;;======================================================================;;
;;                      DCC FUNCTION DECODER                            ;;
;;======================================================================;;
;;                                                                      ;;
;; Program:         DCC_ISR -- DCC function decoder                     ;;
;; Code:            Paco Cañada                                         ;;
;; Platform:        Microchip PIC12F629, 4 Mhz                          ;;
;; Date:            14.07.2006                                          ;;
;; First release:   14.07.2006                                          ;;
;; LastDate:        14.07.2006                                          ;;
;;                                                                      ;;
;;======================================================================;;
;
; Minimal external components, uses internal oscilator at 4 MHz

; This program is distributed as is but WITHOUT ANY WARRANTY
; I hope you enjoy!!
;
; Revisions:
; 14.07.2006    Start of writting code
; 16.07.2006    Added fluorescent lights
; 18.07.2006    Added multiplexed mode
; 09.08.2006    Added PoM
; 30.04.2007    Added analog mode
;  1,02.2014    Removed analog, added more functions
;  8.09.2014    completed reset function
; 17.11.2014    corrected handling F13-F28 frames - no more stucks
; 29.03.2016    blink function on some outputs

; ----- Definitions

#define         __VERNUM        D'6'
#define         __VERDAY        0x10
#define         __VERMONTH      0x04
#define         __VERYEAR       0x16


        LIST       p=12F629     ; target processor

        errorlevel -305,-302

        #include P12F629.inc

        __CONFIG  _BODEN_ON & _CP_OFF & _WDT_OFF & _MCLRE_OFF & _PWRTE_ON & _INTRC_OSC_NOCLKOUT & 0x31FF

                        ; Make sure that internal osc. is calibrated
                        ; Value has to be read before reprogramming the device.
        org     0x03FF
;        retlw   0x80



; --- Macros

#define         DNOP            goto    $+1


; --- Constant values

FXTAL           equ     D'4000000'

GP_TRIS         equ     b'00000100'             ; GP2: input
GP_INI          equ     0x00                    ; all zero
OPTION_INI      equ     0x88                    ; Option register: no pull-up, falling GP2, no prescaler, wdt 1:1
WPU_INI         equ     0x33                    ; Weak pull-up enable. default, no pull-ups

INTC_INI        equ     0x88                    ; GIE, GPIE enable, PEIE disable
PIE1_INI        equ     0x00                    ; no interrupts

BLIK_DIV_P      equ     0x82                    ; blink divider preset (×3,84 ms)

E_DEF_1ex       equ     0x03                    ; short addr, long addr L, analog
E_DEF_7         equ     0x16                    ; version = 22
E_DEF_8         equ     0x0D                    ; manufacturer = DIY
E_DEF_17        equ     0xC0                    ; long addr H
E_DEF_19        equ     0x00                    ; consist
E_DEF_29        equ     0x06                    ; config (short, F1-F4)
E_DEF_33        equ     0x10                    ; F0F
E_DEF_34        equ     0x20                    ; F0R
E_DEF_3536      equ     0x02                    ; F1
E_DEF_3738      equ     0x00                    ; F2


#define         OUT1    0                       ;
#define         OUT2    1                       ;
#define         DCCIN   GPIO,2                  ; DCC input pin
#define         OUT4    4                       ;
#define         OUT5    5                       ;


; --- EEPROM Section

#define         EE_INI          0x01

E_MM            equ     0x00
E_CV1           equ     EE_INI+0x00             ; CV513 Primary Adress low
E_CV7           equ     EE_INI+0x01             ; Manufacturer Version
E_CV8           equ     EE_INI+0x02             ; Manufacturer ID
E_CV13          equ     EE_INI+0x03             ; Analog F1..F8
E_CV14          equ     EE_INI+0x04             ; Analog FL,FR (F9..F12)
E_CV17          equ     EE_INI+0x05             ; Extended Adress Low Byte
E_CV18          equ     EE_INI+0x06             ; Extended Adress High Byte
E_CV19          equ     EE_INI+0x07             ; Consist Adress
E_CV29          equ     EE_INI+0x08             ; config
E_CV33          equ     EE_INI+0x09             ; F0F -> GPIO (xx54xx10)
E_CV34          equ     EE_INI+0x0A             ; F0R -> GPIO (xx54xx10)
E_CV35          equ     EE_INI+0x0B             ; F1F -> GPIO (xx54xx10)
E_CV36          equ     EE_INI+0x0C             ; F1R -> GPIO (xx54xx10)
E_CV37          equ     EE_INI+0x0D             ; F2F -> GPIO (xx54xx10)
E_CV38          equ     EE_INI+0x0E             ; F2R -> GPIO (xx54xx10)
E_CV39          equ     EE_INI+0x0F             ; F3F -> GPIO (xx54xx10)
E_CV40          equ     EE_INI+0x10             ; F3R -> GPIO (xx54xx10)
E_CV41          equ     EE_INI+0x11             ; F4F -> GPIO (xx54xx10)
E_CV42          equ     EE_INI+0x12             ; F4R -> GPIO (xx54xx10)
E_CV43          equ     EE_INI+0x13             ; F5F -> GPIO (xx54xx10)
E_CV44          equ     EE_INI+0x14             ; F5R -> GPIO (xx54xx10)
E_CV45          equ     EE_INI+0x15             ; F6F -> GPIO (xx54xx10)
E_CV46          equ     EE_INI+0x16             ; F6R -> GPIO (xx54xx10)
E_CV47          equ     EE_INI+0x17             ; F7F -> GPIO (xx54xx10)
E_CV48          equ     EE_INI+0x18             ; F7R -> GPIO (xx54xx10)
E_CV49          equ     EE_INI+0x19             ; F8F -> GPIO (xx54xx10)
E_CV50          equ     EE_INI+0x1A             ; F8R -> GPIO (xx54xx10)
E_CV51          equ     EE_INI+0x1B             ; blik speed (× 3.84 ms)

; ----- Variables

; --- Internal RAM Section

#define         RAMINI0         0x020           ; 64 bytes

INT_W           equ     RAMINI0+0x00            ; interrupt context registers
INT_STAT        equ     RAMINI0+0x01

SHIFT0          equ     RAMINI0+0x02
DATA1           equ     RAMINI0+0x03            ; interrupt shift register
DATA2           equ     RAMINI0+0x04
DATA3           equ     RAMINI0+0x05
DATA4           equ     RAMINI0+0x06
DATA5           equ     RAMINI0+0x07
DATA6           equ     RAMINI0+0x08

PREAMBLE        equ     RAMINI0+0x09
DCCSTATE                equ     RAMINI0+0x0A
DCCBYTE         equ     RAMINI0+0x0B

F1F8SET         equ     RAMINI0+0x0C
;F1F8OLD        equ     RAMINI0+0x0D
;FSET           equ     RAMINI0+0x0E
;FCHG           equ     RAMINI0+0x0F

CV1             equ     RAMINI0+0x10            ;
CV7             equ     RAMINI0+0x11            ;
CV8             equ     RAMINI0+0x12            ;
CV13            equ     RAMINI0+0x13            ;
CV14            equ     RAMINI0+0x14            ;
CV17            equ     RAMINI0+0x15            ;
CV18            equ     RAMINI0+0x16            ;
CV19            equ     RAMINI0+0x17            ;
CV29            equ     RAMINI0+0x18            ; config

CV33            equ     RAMINI0+0x19            ; F0F
CV34            equ     RAMINI0+0x1A            ; F0R
CV35            equ     RAMINI0+0x1B            ; F1F
CV36            equ     RAMINI0+0x1C            ; F1R
CV37            equ     RAMINI0+0x1D            ; F2F
CV38            equ     RAMINI0+0x1E            ; F2R
CV39            equ     RAMINI0+0x1F            ; F3F
CV40            equ     RAMINI0+0x20            ; F3R
CV41            equ     RAMINI0+0x21            ; F4F
CV42            equ     RAMINI0+0x22            ; F4R
CV43            equ     RAMINI0+0x23            ; F5F
CV44            equ     RAMINI0+0x24            ; F5R
CV45            equ     RAMINI0+0x25            ; F6F
CV46            equ     RAMINI0+0x26            ; F6R
CV47            equ     RAMINI0+0x27            ; F7F
CV48            equ     RAMINI0+0x28            ; F7R
CV49            equ     RAMINI0+0x29            ; F8F
CV50            equ     RAMINI0+0x2A            ; F8R
CV51            equ     RAMINI0+0x2B            ; blik speed


TEMP            equ     RAMINI0+0x2C
COUNT           equ     RAMINI0+0x2D
FLAGS           equ     RAMINI0+0x2E
FLAGS2          equ     RAMINI0+0x2F
EEDATA0         equ     RAMINI0+0x30            ; data to write in EEPROM
EEADR0          equ     RAMINI0+0x31
PAGEREG         equ     RAMINI0+0x32            ; Page register
OUTPUT          equ     RAMINI0+0x33            ; output buffer

SHOOTCNT        equ     RAMINI0+0x34            ; shooting prescaler
ANALOGCNT       equ     RAMINI0+0x35            ; analog detector timeout

BLIKDIV         equ     RAMINI0+0x36            ; BLIK divider



; --- Flags
                                                ; FLAGS
#define         NEW_PACKET      FLAGS,0         ; New packet received
#define         NOCV            FLAGS,1         ; No CV finded
#define         RDONLY          FLAGS,2         ; CV read only
#define         DCC4BYTE        FLAGS,3         ; DCC command 4 or 5 bytes
#define         CONSIST         FLAGS,4
#define         PROG_2X         FLAGS,6         ; 2x prog
#define         RESET_FLG       FLAGS,7         ; reset packet

                                                ; FLAGS2
#define         DIR             FLAGS2,0
#define         LASTDIR         FLAGS2,1
#define         LIGHT           FLAGS2,2
#define         BLIK            FLAGS2,3        ; blink state
#define         BLIK_FLAG       b'00001000'     ; for XOR instruction

                                                ; CV29
#define         DIRINV          CV29,0          ; direction inverted
#define         FS28            CV29,1          ; 14/28 speed step
#define         PWRSRC          CV29,2          ; anolog and DCC
#define         RES293          CV29,3          ; reserved
#define         RES294          CV29,4          ; reserved
#define         LADRE           CV29,5          ; long adress enable
#define         F9F12           CV29,6          ; reserved
#define         F13F20          CV29,7          ; reserved

                                                ; CV50


; --------------- Program Section --------------------------------------


                org     0x000

PowerUp:
                clrf    STATUS                  ; Bank 0 default
                clrf    INTCON                  ; Disable all interrupts
                clrf    PCLATH                  ; tables on page 0
                goto    INIT

; ----------------------------------------------------------------------

                org     0x004

Interrupt:
                movwf   INT_W                   ; save context registers                ;1
                swapf   STATUS,w                                                        ;2
                movwf   INT_STAT                                                        ;3
                clrf    STATUS                  ; interrupt uses bank 0                 ;4

                btfss   DCCIN                                                           ;5
                goto    Int_Low_Half                                                    ;6,7

Int_High_Half:
                movf    DCCSTATE,w                                                              ; 8
                addwf   PCL,f                                                           ; 9

                goto    Preamble                                                        ; 10,11
                goto    WaitLow
                goto    ReadBit
                goto    ReadBit
                goto    ReadBit
                goto    ReadBit
                goto    ReadBit
                goto    ReadBit
                goto    ReadBit
                goto    ReadLastBit
                goto    EndByte1
                goto    EndByte2
                goto    EndByte3
                goto    EndByte4
                goto    EndByte5
                goto    EndByte6


Int_Low_Half:
                movlw   d'256' - d'77'          ; 77us: between 64us (one) and 90us (zero);8
                movwf   TMR0                                                            ;9
                bcf     INTCON,T0IF             ; clear overflow flag for counting      ;10
EndHighHalf:
                bcf     INTCON,GPIF                                             ;11     ;21
EndInt:
                swapf   INT_STAT,w              ; restore context registers     ;12     ;22
                movwf   STATUS                                                  ;13     ;23
                swapf   INT_W,f                                                 ;14     ;24
                swapf   INT_W,w                                                 ;15     ;25
                retfie                                                          ;16,17  ;26,27


Preamble:
                btfss   NEW_PACKET              ; wait until last decoded               ;12
                incf    PREAMBLE,f              ;                                       ;13
                btfsc   INTCON,T0IF             ; if timer 0 overflows then is a DCC zero;14
                clrf    PREAMBLE                ;                                       ;15
                movlw   0xF6                    ; 10 preamble bits?                     ;16
                addwf   PREAMBLE,w              ;                                       ;17
                btfsc   STATUS,C                ;                                       ;18
                incf    DCCSTATE,f              ; yes, next state                       ;19
                goto    EndHighHalf             ;                                       ;20,21


WaitLow:
                btfsc   INTCON,T0IF             ; if timer 0 overflows then is a DCC zero;12
                incf    DCCSTATE,f              ; then state                            ;13
                clrf    DCCBYTE                 ;                                       ;14
                clrf    PREAMBLE                ;                                       ;15
                clrf    DATA4                   ;                                       ;16
                clrf    DATA5                   ;                                       ;17
                clrf    DATA6                   ;                                       ;18
                goto    EndHighHalf             ;                                       ;19,20


ReadBit:
                bsf     STATUS,C                                                        ;12
                btfsc   INTCON,T0IF             ; if timer 0 overflows then is a DCC zero;13
                bcf     STATUS,C                                                        ;14
                rlf     SHIFT0,f                ; receiver shift register               ;15
                incf    DCCSTATE,f                      ;                                       ;16
                goto    EndHighHalf             ;                                       ;17,18

ReadLastBit:
                bsf     STATUS,C                                                        ;12
                btfsc   INTCON,T0IF             ; if timer 0 overflows then is a DCC zero;13
                bcf     STATUS,C                                                        ;14
                rlf     SHIFT0,f                ; receiver shift register               ;15
                incf    DCCBYTE,w                                                       ;16
                addwf   DCCSTATE,f                                                              ;17
                goto    EndHighHalf             ;                                       ;18,19

EndByte1:
                movlw   0x00                    ;                                       ;12
                btfsc   INTCON,T0IF             ; End bit=1, invalid packet             ;13
                movlw   0x02                    ;                                       ;14
                movwf   DCCSTATE                        ;                                       ;15
                movf    SHIFT0,w                ;                                       ;16
                movwf   DATA1                   ;                                       ;17
                incf    DCCBYTE,f               ;                                       ;18
                goto    EndHighHalf             ;                                       ;19,20

EndByte2:
                movlw   0x00                    ;                                       ;12
                btfsc   INTCON,T0IF             ; End bit=1, invalid packet             ;13
                movlw   0x02                    ;                                       ;14
                movwf   DCCSTATE                        ;                                       ;15
                movf    SHIFT0,w                ;                                       ;16
                movwf   DATA2                   ;                                       ;17
                incf    DCCBYTE,f               ;                                       ;18
                goto    EndHighHalf             ;                                       ;19,20


EndByte3:
                btfss   INTCON,T0IF             ; End bit=1, end of packet              ;12
                goto    EndByte3x               ;                                       ;13,14
                movlw   0x02                    ;                                       ;14
                movwf   DCCSTATE                        ;                                       ;15
                movf    SHIFT0,w                ;                                       ;16
                movwf   DATA3                   ;                                       ;17
                incf    DCCBYTE,f               ;                                       ;18
                bsf     DCC4BYTE                ;                                       ;19
                goto    EndHighHalf             ;                                       ;20,21
EndByte3x:
                clrf    DCCSTATE                        ;                                       ;15
                movf    SHIFT0,w                ;                                       ;16
                movwf   DATA3                   ;                                       ;17
                bsf     NEW_PACKET              ;                                       ;18
                bcf     DCC4BYTE                ;                                       ;19
                goto    EndHighHalf             ;                                       ;20,21

EndByte4:
                btfss   INTCON,T0IF             ; End bit=1, end of packet              ;12
                goto    EndByte4x               ;                                       ;13,14
                movlw   0x02                    ;                                       ;14
                movwf   DCCSTATE                        ;                                       ;15
                movf    SHIFT0,w                ;                                       ;16
                movwf   DATA4                   ;                                       ;17
                incf    DCCBYTE,f               ;                                       ;18
                goto    EndHighHalf             ;                                       ;19,20
EndByte4x:
                clrf    DCCSTATE                        ;                                       ;15
                movf    SHIFT0,w                ;                                       ;16
                movwf   DATA4                   ;                                       ;17
                bsf     NEW_PACKET              ;                                       ;18
                goto    EndHighHalf             ;                                       ;19,20

EndByte5:
                btfss   INTCON,T0IF             ; End bit=1, end of packet              ;12
                goto    EndByte5x               ;                                       ;13,14
                movlw   0x02                    ;                                       ;14
                movwf   DCCSTATE                        ;                                       ;15
                movf    SHIFT0,w                ;                                       ;16
                movwf   DATA5                   ;                                       ;17
                incf    DCCBYTE,f               ;                                       ;18
                goto    EndHighHalf             ;                                       ;19,20
EndByte5x:
                clrf    DCCSTATE                        ;                                       ;15
                movf    SHIFT0,w                ;                                       ;16
                movwf   DATA5                   ;                                       ;17
                bsf     NEW_PACKET              ;                                       ;18
                goto    EndHighHalf             ;                                       ;19,20

EndByte6:
                clrf    DCCSTATE                        ;                                       ;12
                btfsc   INTCON,T0IF             ; End bit=1, end of packet              ;13
                goto    EndInt                  ; End bit=0, invalid packet             ;14,15
                movf    SHIFT0,w                ;                                       ;15
                movwf   DATA6                   ;                                       ;16
                bsf     NEW_PACKET              ;                                       ;17
                goto    EndHighHalf             ;                                       ;18,19


; ----- Tables on first 256 bytes --------------------------------------

BitPos:
                clrf    PCLATH
                addwf   PCL,f
                retlw   b'00000001'             ; 0
                retlw   b'00000010'             ; 1
                retlw   b'00000100'             ; 2
                retlw   b'00001000'             ; 3
                retlw   b'00010000'             ; 4
                retlw   b'00100000'             ; 5
                retlw   b'01000000'             ; 6
                retlw   b'10000000'             ; 7

DecodeCommand:
                swapf   DATA2,w
                movwf   TEMP
                rrf     TEMP,w
                andlw   0x07
                addwf   PCL,f

                goto    DecControl              ; 000   Decoder Control
                goto    Advanced                ; 001   Advanced operations (4 bytes packet)
                goto    Forward                 ; 010   Forward
                goto    Reverse                 ; 011   Reverse
                goto    Function                ; 100   Function FL,F1..F4
                goto    Function1               ; 101   Function F1..F8
                goto    ExitDecode              ; 110   Feature Expansion Instruction (F13-F28)
                goto    PoM                     ; 111   PoM

; ----------------------------------------------------------------------

INIT:
                clrf    GPIO
                movlw   0x07
                movwf   CMCON                   ; set GP2:0 to digital I/O

                bsf     STATUS,RP0              ; bank 1
                movlw   GP_TRIS
                movwf   TRISIO
                call    0x3FF                   ; get OSCCAL value
                movwf   OSCCAL
                movlw   WPU_INI                 ; pull-ups
                movwf   WPU
                movlw   b'00000100'
                movwf   IOC                     ; interrupt on change on GP2 (DCC)
                clrf    VRCON                   ; voltage reference off
                movlw   OPTION_INI              ; Option register: no pull-up, falling GP2, no prescaler, wdt 1:1
                movwf   OPTION_REG
                movlw   PIE1_INI
                movwf   PIE1
                bcf     STATUS,RP0              ; bank 0
                clrf    PIR1
                movlw   0x01                    ; Timer 1 on, 1:1
                movwf   T1CON

                movlw   0x20                    ; clear RAM
                movwf   FSR
ClearRAM:
                clrf    INDF
                incf    FSR,f
                movlw   0x60
                xorwf   FSR,w
                btfss   STATUS,Z
                goto    ClearRAM

                clrf    PAGEREG                 ; page register default
                bsf     SHOOTCNT,2              ; init shooting prescaler

                call    LoadCV                  ; load CV values

                movlw   INTC_INI
                movwf   INTCON                  ; enable interrupt on change


; ----------------------------------------------------------------------

MainLoop:
                btfsc   NEW_PACKET              ; new packet?
                call    Decode                  ; yes, decode

Loop:
                btfsc   RESET_FLG               ; no output on reset
                goto    MainLoop

                btfss   PIR1,TMR1IF             ; end timer?
                goto    MainLoop

                bcf     PIR1,TMR1IF             ; yes, reload
                movlw   0xF1
                movwf   TMR1H

                decfsz  BLIKDIV, f
                goto    MainLoop

blik:           movf    CV51, w                 ; reload divider
                movwf   BLIKDIV

                movlw   BLIK_FLAG               ; toggle blik bit state
                xorwf   FLAGS2                  ;

                ;                               ; refresh outputs
                call    Func_make

                goto    MainLoop


; ----------------------------------------------------------------------

; ----------------------------------------------------------------------

Decode:
                bcf     INTCON,GIE              ; disable interrupts for more speed
                bcf     NEW_PACKET              ; prepare for next packet

                movf    DATA1,w                 ; exclusive-OR check
                xorwf   DATA2,w
                xorwf   DATA3,w
                xorwf   DATA4,w
                xorwf   DATA5,w
                xorwf   DATA6,w

                btfss   STATUS,Z                ; valid packet?
                goto    ExitDecode              ; no, return

                movf    DATA1,w
                btfss   DATA1,7                 ; address = '1XXXXXXX' ?
                goto    ShortAddr

                xorwf   CV17,w                  ; '11AAAAAA''AAAAAAAA'
                btfss   STATUS,Z
                goto    ExitDecode
                movf    DATA2,w
                xorwf   CV18,w
                btfss   STATUS,Z
                goto    ExitDecode

                btfss   LADRE
                goto    ExitDecode
                btfsc   CONSIST
                goto    ExitDecode

                movf    DATA3,w                 ; put correct order
                movwf   DATA2
                movf    DATA4,w
                movwf   DATA3
                movf    DATA5,w
                movwf   DATA4
                movf    DATA6,w
                movwf   DATA5
                goto    DecodeCommand

ChkCons:
                btfsc   CONSIST                 ; only if no consist
                goto    ExitDecode
                goto    Broadcast

ShortAddr:
                btfsc   STATUS,Z
                goto    Broadcast               ; address = '00000000' ?

                btfss   LADRE
                xorwf   CV1,w
                btfsc   STATUS,Z
                goto    ChkCons

                movf    CV19,w
                andlw   0x7F
                bcf     CONSIST                 ; set consist flag
                btfss   STATUS,Z
                bsf     CONSIST
                xorwf   DATA1,w
Broadcast:
                btfss   STATUS,Z
                goto    ChkProg
                goto    DecodeCommand

ChkProg:
                movf    DATA1,w
                andlw   0xF0
                xorlw   0x70                    ; '0111xxxx'?
                btfsc   STATUS,Z
                goto    CheckSM                 ; yes, may be service mode

                incfsz  DATA1,w                 ;'11111111' idle packet
                goto    ExitDecode
                bsf     INTCON,GIE              ; yes, don't clear reset flag
                return


; ----------------------------------------------------------------------

DecControl:                                     ; (DCC command)
                btfsc   DATA2,4                 ; 000 1 XXXX?
                goto    ConsistControl
                movf    DATA2,w                 ; reset packet? 000 00000
                btfsc   STATUS,Z
                goto    ResetDec
ExitDecode:
                bcf     RESET_FLG
                bsf     INTCON,GIE              ; enable interrupts
                return

ResetDec:
                bcf     PROG_2X
                bsf     RESET_FLG
                                                ; reset decoder
                clrf    GPIO

                bsf     INTCON,GIE              ; enable interrupts
                return

ConsistControl:
                movf    DATA3,w                 ; '0001001X' 'ADDR'
                movwf   CV19
                movf    DATA2,w
                xorlw   b'00010010'
                btfsc   STATUS,Z
                bcf     CV19,7
                xorlw   (b'00010010' ^ b'00010011')
                btfsc   STATUS,Z
                bsf     CV19,7
                movf    CV19,w
                movwf   EEDATA0
                movlw   E_CV19
                call    SetParm
                goto    ExitDecode

; ----------------------------------------------------------------------

Advanced:                                       ; (DCC command)
                movf    DATA2,w                 ; 128 steps
                xorlw   b'00111111'
                btfss   STATUS,Z
                goto    ExitDecode
                btfsc   DATA3,7                 ; check dir
                goto    AdvBack
AdvForw:
                btfsc   DIRINV                  ; CV29,0 dir invert
                goto    AdvBack1
AdvForw1:
                btfsc   CV19,7                  ; CV19,7 dir invert
                goto    AdvBack2
AdvForw2:
                btfsc   DIR
                goto    ForwExchg
                goto    ExitDecode

AdvBack:
                btfsc   DIRINV                  ; CV29,0 dir invert
                goto    AdvForw1
AdvBack1:
                btfsc   CV19,7                  ; CV19,7 dir invert
                goto    AdvForw2
AdvBack2:
                btfss   DIR
                goto    ReverExchg
                goto    ExitDecode

; ----------------------------------------------------------------------

Forward:                                                ; (DCC command)
                btfsc   DIRINV                  ; CV29,0 dir invert
                goto    Rever1
Forw1:
                btfsc   CV19,7                  ; CV19,7 dir invert
                goto    Rever2
Forw2:
                btfss   DIR
                goto    Speed
ForwExchg:
                bcf     DIR
                call    Func_make
                goto    ExitDecode

; ----------------------------------------------------------------------

Reverse:                                                ; (DCC command)
                btfsc   DIRINV                  ; CV29,0 dir invert
                goto    Forw1
Rever1:
                btfsc   CV19,7                  ; CV19,7 dir invert
                goto    Forw2
Rever2:
                btfsc   DIR
                goto    Speed
ReverExchg:
                bsf     DIR
                call    Func_make
                goto    ExitDecode

; ----------------------------------------------------------------------

Speed:
                btfsc   FS28                    ; 28/128 speed steps
                goto    ExitDecode
                call    Lights_check            ; no, 14 speed steps
                call    Func_make
                goto    ExitDecode


; ----------------------------------------------------------------------

Lights_check:
                bcf     LIGHT
                btfsc   DATA2, 4                        ; check light state
                bsf     LIGHT
                return

Lights_make:
                movlw   CV33
                btfss   DIR
                movlw   CV34
                movwf   FSR
                btfsc   LIGHT
                goto    FuncOn
                return

; ----------------------------------------------------------------------


Function:                                       ; (DCC command)
                btfsc   FS28                    ; 28/128 steps?
                call    Lights_check            ; yes
                btfsc   F9F12                   ; use F9-F12 ?
                goto    Func_make1              ; yes, F1-F4 is irrelevant
                movf    DATA2,w                 ; no, decode data
                andlw   0x0F
                iorwf   F1F8SET,f
                xorlw   0xF0
Func2:
                andwf   F1F8SET,w
                movwf   F1F8SET

Func_make1:     call    Func_make
                goto    ExitDecode

Func_make:
                clrf    COUNT
                clrf    OUTPUT
                call    Lights_make
FuncSet:                                                ; for
                call    FuncSet1
FuncSet2:
                incf    COUNT,f                 ; next
                btfss   COUNT,3
                goto    FuncSet

                movf    OUTPUT,w                        ; set real outputs
                andlw   0x33
                andlw   0xFE                    ; Disallow output GP0
                movwf   GPIO

                return

                ;goto    ExitDecode

FuncSet1:

                rlf     COUNT,w
                addlw   CV35
                btfsc   DIR
                addlw   1
                movwf   FSR                     ; FSR = &CV35 + (2*COUNT) + DIR
                movf    COUNT,w
                call    BitPos
                andwf   F1F8SET,w
                btfsc   STATUS,Z
                return

FuncOn:                                         ; set output if enabled in CV
                                                ; new - reflect BLIK state
                movf    INDF,w                  ; load CV setting to W
                btfsc   INDF,7                  ; is flashing active in CV?
                btfsc   BLIK                    ; yes, is BLIK bit set?
                iorwf   OUTPUT,f
                return

;FuncOff:               return


; ----------------------------------------------------------------------

Function1:                                      ; (DCC command)
                btfss   DATA2,4                 ; 1011FFFF (F5-F8)
                goto    Function2
                swapf   DATA2,w
                andlw   0xF0
                iorwf   F1F8SET,f
                xorlw   0x0F
                goto    Func2


Function2:                                      ; (DCC command)
                                                ; 1010FFFF (F9-F12)
                btfss   F9F12                   ; use F9-F12 ?
                goto    ExitDecode              ; no, go away
                movf    DATA2,w                 ; yes, get data
                andlw   0x0F
                iorwf   F1F8SET,f
                xorlw   0xF0
                goto    Func2



; --------------------------------------------------------------------------

; --------------------------------------------------------------------------

; LLLLLLLL 1110CCAA AAAAAAAA DDDDDDDD EEEEEEEE  ; CC=11 write byte
;  DATA1    DATA2    DATA3    DATA4    DATA5

PoM:                                            ; (DCC command)
                btfss   PROG_2X
                goto    SetSM_Flag

                bcf     PROG_2X
                movf    DATA4,w                 ; save data
                movwf   EEDATA0

                movlw   b'11101100'             ; CC=11 write byte
                xorwf   DATA2,w
                btfss   STATUS,Z
                goto    ExitProg

                movf    DATA3,w                 ; CV1 not valid
                btfss   CONSIST                 ; consist address not valid
                btfsc   STATUS,Z
                goto    ExitProg
                call    FindCV
                btfsc   NOCV
                goto    ExitProg

WritePoM:                                       ;11 Write byte
                btfsc   RDONLY
                goto    CheckCV8PoM
                call    SetParm
                call    LoadCV
                goto    ExitProg

CheckCV8PoM:
                goto    ExitProg                ; disabled reset in PoM
;               xorlw   E_CV8                   ; CV8?
;               btfss   STATUS,Z
;               goto    ExitProg
;heckResetCVPoM:
;               movlw   d'33'                   ; CV8 = 33 -> reset CV
;               xorwf   DATA4,w
;               btfss   STATUS,Z
;               goto    ExitProg
;               call    ResetCV                 ; program CV defaults
;               call    LoadCV
;               goto    ExitProg


; --------------------------------------------------------------------------


;************* SM Mode *******************************************
; Service Mode

CheckSM:
                btfss   RESET_FLG               ; check for SM, reset packet has to come first
                goto    ServModeError
                btfss   PROG_2X
                goto    SetSM_Flag

                btfsc   DCC4BYTE                ; 3 or 4 byte packet?
                goto    ChkProg4
                ;goto    ExitProg                ; RegProg - deleted (obsolete mode)

; 0111CRRR DDDDDDDD EEEEEEEE

                bcf     PROG_2X
                movf    DATA2,w                         ; save data
                movwf   EEDATA0

                movf    DATA1,w                         ; 3 byte programming
                andlw   b'11110111'
                xorlw   b'01110101'                     ; Reg6
                btfsc   STATUS,Z
                goto    REG6
                xorlw   (b'01110101')^(b'01110100')     ; Reg5
                btfsc   STATUS,Z
                goto    REG5
                xorlw   (b'01110100')^(b'01110110')     ; reg7
                btfsc   STATUS,Z
                goto    REG7
                xorlw   (b'01110110')^(b'01110111')     ; reg8
                btfsc   STATUS,Z
                goto    REG8

                movf    DATA1,w
                andlw   0x03
                addwf   PAGEREG,w
                call    FindCV
                btfsc   NOCV
                goto    ExitProg
ProgReg:
                btfss   DATA1,3
                goto    EEVERI
                goto    EEPROG

REG5:
                movlw   E_CV29                  ; CV29 configuration
                goto    ProgReg

REG6:
                btfss   DATA1,3                 ; read or write
                goto    REG6RD
                decf    DATA2,f                 ; Page register
                rlf     DATA2,f
                rlf     DATA2,w
                andlw   b'11111100'             ; page 1 and 129 are the same. CV1 & CV513
                movwf   PAGEREG
                goto    ExitProg
REG6RD:
                decf    DATA2,f                 ; read page register
                rlf     DATA2,f
                rlf     DATA2,w
                andlw   b'11111100'             ; page 1 and 129 are the same. CV1 & CV513
                xorwf   PAGEREG,w
                goto    EEVERIP

REG7:
                movlw   E_CV7                   ; only read
                btfss   DATA1,3
                goto    EEVERI
                goto    ExitProg

REG8:
                movlw   E_CV8                   ; only read
                btfss   DATA1,3
                goto    EEVERI
                goto    CheckResetCV            ; if CV8 = 33 reset CV


EEPROG:
                btfsc   RDONLY
                goto    CheckCV8
                call    SetParm                 ; program EEPROM
                call    AckPulse                ; do ACK
                bcf     PROG_2X
                bcf     NEW_PACKET
                call    LoadCV
                goto    ExitProg


EEVERI:
                call    EE_Read                 ; check data
                xorwf   DATA2,w
EEVERIP:
                btfss   STATUS,Z
                goto    ExitProg
DoAck:
                call    AckPulse                ; equal, do ACK
                bcf     PROG_2X
;               bcf     NEW_PACKET
                goto    ExitProg


SetSM_Flag:
                bsf     PROG_2X
                goto    ExitProg

ServModeError:
                bcf     RESET_FLG
                bcf     PROG_2X
                goto    ExitProg

CheckCV8:
                xorlw   E_CV8                   ; CV8?
                btfss   STATUS,Z
                goto    ExitProg
CheckResetCV:
                movlw   d'33'                   ; CV8 = 33 -> reset CV
                xorwf   DATA2,w
                btfss   STATUS,Z
                goto    ExitProg
CheckResetCVP:
                call    ResetCV_init            ; program CV defaults
                call    AckPulse                ; do ACK
                bcf     PROG_2X
                bcf     NEW_PACKET
                call    ResetCV
                call    LoadCV
                goto    ExitProg

ExitProg:
                bsf     INTCON,GIE              ; enable interrupts
                return

; -----------------------------------------------------------------------------------

AckPulse:
                movlw   b'00110111'             ; all lights on
                movwf   GPIO
                movlw   d'6'                    ; 6ms pulse
                movwf   TEMP
                movlw   0x00
AckNext:
                addlw   0xFF                    ;1
                btfss   STATUS,Z                ;2
                goto    $-2                     ;3,4
                decfsz  TEMP,f
                goto    AckNext
                clrf    GPIO                    ; all light off
                return

; -----------------------------------------------------------------------------------

; 0111CCAA AAAAAAAA DDDDDDDD EEEEEEEE

ChkProg4:
                bcf     PROG_2X
;               bcf     RESET_FLG
                movf    DATA3,w                 ; save data
                movwf   EEDATA0

                btfsc   DATA1,0                 ; CV513.. or CV1..
                goto    ExitProg

                movf    DATA2,w                 ; x0AAAAAAAA
                call    FindCV
                btfsc   NOCV
                goto    ExitProg
ProgDirect:
                btfsc   DATA1,3
                goto    RomNxt
                btfss   DATA1,2
                goto    ExitProg                ;00 not defined
RomNxt:
                btfss   DATA1,2
                goto    BitMan                  ;10 Bit Manipulation
                btfss   DATA1,3
                goto    EEVERI4                 ;01 Verify byte
WriteDirect:                                    ;11 Write byte
                btfsc   RDONLY
                goto    CheckCV8D
                call    SetParm
                call    AckPulse
                bcf     PROG_2X
                bcf     NEW_PACKET
                call    LoadCV
                goto    ExitProg

EEVERI4:
                call    EE_Read                 ; check data
                xorwf   DATA3,w
                goto    EEVERIP

CheckCV8D:
                movlw   d'33'                   ; CV8 = 33 -> reset CV
                xorwf   DATA3,w
                btfss   STATUS,Z
                goto    ExitProg
                goto    CheckResetCVP


; 0111CCAA AAAAAAAA 111KDBBB EEEEEEEE

BitMan:
                call    EE_Read
                movwf   EEDATA0
                movlw   EEDATA0
                movwf   FSR
                movlw   b'00000111'
                andwf   DATA3,w
                call    BitPos
                btfss   DATA3,4                 ; K
                goto    Vbit                    ; K=0,verify bit
                btfsc   DATA3,3
                iorwf   INDF,f                  ; D=1,set bit
                xorlw   0xFF
                btfss   DATA3,3
                andwf   INDF,f                  ; D=0,clear bit
                movf    DATA2,w
                call    FindCV
                goto    ProgDirect              ; write complete byte

Vbit:
                andwf   INDF,w
                btfsc   STATUS,Z
                goto    BitClear
BitSet:
                btfsc   DATA3,3                 ;D=0
                goto    DoAck                   ;D=1, ack
                goto    ExitProg
BitClear:
                btfss   DATA3,3                 ;D=1
                goto    DoAck                   ;D=0, ack
                goto    ExitProg

; -----------------------------------------------------------------------------------

LoadCV:
                movlw   E_MM                    ; get Magic byte address
                call    EE_Read                 ; read magic byte
                xorlw   0x64                    ; compare with this value
                btfss   STATUS, Z               ; is magic byte correct?
                call    ResetCV                 ; no, reset all to default
                                                ; yes, do normal CV load
                movlw   CV1                     ; first CV to read
                movwf   FSR
                movlw   E_CV1
                movwf   EEADR0
LoadNext:
                movf    EEADR0,w
                call    EE_Read
                movwf   INDF
                movlw   CV51                    ; last CV to read
                xorwf   FSR,w
                btfsc   STATUS,Z
                return
                incf    FSR,f
                incf    EEADR0,f
                goto    LoadNext

; -----------------------------------------------------------------------------------

FindCV:
                bcf     NOCV                    ; w = CV - 1
                bcf     RDONLY

                movwf   TEMP

                xorlw   0x00                    ; CV1
                btfsc   STATUS,Z
                retlw   E_CV1
                xorlw   (0x00 ^ 0x0C)           ; CV13
                btfsc   STATUS,Z
                retlw   E_CV13
                xorlw   (0x0C ^ 0x0D)           ; CV14
                btfsc   STATUS,Z
                retlw   E_CV14
                xorlw   (0x0D ^ 0x10)           ; CV17
                btfsc   STATUS,Z
                retlw   E_CV17
                xorlw   (0x10 ^ 0x11)           ; CV18
                btfsc   STATUS,Z
                retlw   E_CV18
                xorlw   (0x11 ^ 0x12)           ; CV19
                btfsc   STATUS,Z
                retlw   E_CV19
                xorlw   (0x12 ^ 0x1C)           ; CV29
                btfsc   STATUS,Z
                retlw   E_CV29

                ; agregated CV33 - CV51
                movfw   TEMP
                sublw   d'33' - 2               ; CV33, 32 - W ... C=0 ... W>=32 ... not in range
                btfsc   STATUS, C
                goto    FindCV_1                ; W < CV32
                movfw   TEMP
                sublw   d'51' - 1               ; CV51, 51 - W ... C=1 ... W<=51
                btfss   STATUS, C
                goto    FindCV_1                ; find address in EEPROM
                ; CV33 <= W <= CV51
                movfw   TEMP
                addlw   0x100 - d'32'            ; W - 32
                addlw   E_CV33
                return

FindCV_1:
                movfw   TEMP
                bsf     RDONLY
                xorlw   (0x00 ^ 0x06)           ; CV7
                btfsc   STATUS,Z
                retlw   E_CV7
                xorlw   (0x06 ^ 0x07)           ; CV8
                btfsc   STATUS,Z
                retlw   E_CV8

                bsf     NOCV                    ; CV not finded
                retlw   0x7F                    ; return last location

;---------------------------------------------------------------------------

ResetCV_init:   movlw   0x00                    ; begin reset sequence (erase magic byte)
                movwf   EEDATA0
                movlw   0xFF
                call    SetParm
                return

ResetCV:
                movlw   E_DEF_1ex               ; reset CV to default values
                movwf   EEDATA0
                movlw   E_CV1                   ; CV1
                call    SetParm
                movlw   E_CV14                  ; CV14
                call    SetParm
                movlw   E_CV18                  ; CV18
                call    SetParm

                movlw   E_DEF_7
                movwf   EEDATA0
                movlw   E_CV7                   ; CV7
                call    SetParm

                movlw   E_DEF_8
                movwf   EEDATA0
                movlw   E_CV8                   ; CV8
                call    SetParm

                movlw   E_DEF_17
                movwf   EEDATA0
                movlw   E_CV17                  ; CV17
                call    SetParm

                movlw   E_DEF_19
                movwf   EEDATA0
                movlw   E_CV19                  ; CV19
                call    SetParm

                movlw   E_DEF_29
                movwf   EEDATA0
                movlw   E_CV29                  ; CV29
                call    SetParm

                movlw   E_DEF_33
                movwf   EEDATA0
                movlw   E_CV33
                call    SetParm

                movlw   E_DEF_34
                movwf   EEDATA0
                movlw   E_CV34
                call    SetParm

                movlw   E_DEF_3536
                movwf   EEDATA0
                movlw   E_CV35
                call    SetParm
                movlw   E_CV36
                call    SetParm

                movlw   E_DEF_3738
                movwf   EEDATA0
                movlw   E_CV37
                call    SetParm
                movlw   E_CV38
                call    SetParm

                movlw   BLIK_DIV_P              ; default blik speed
                movwf   EEDATA0
                movlw   E_CV51
                call    SetParm

                movlw   0x00                    ; zero other CVs
                movwf   EEDATA0
                movlw   E_CV13
                call    SetParm
                movlw   E_CV39
                call    SetParm
                movlw   E_CV40
                call    SetParm
                movlw   E_CV41
                call    SetParm
                movlw   E_CV42
                call    SetParm
                movlw   E_CV43
                call    SetParm
                movlw   E_CV44
                call    SetParm
                movlw   E_CV45
                call    SetParm
                movlw   E_CV46
                call    SetParm
                movlw   E_CV47
                call    SetParm
                movlw   E_CV48
                call    SetParm
                movlw   E_CV49
                call    SetParm
                movlw   E_CV50
                call    SetParm

                movlw   0x64                    ; write magic byte
                movwf   EEDATA0
                movlw   E_MM
                call    SetParm

                return


;---------------------------------------------------------------------------

EE_Read:
                bsf     STATUS,RP0              ; w=ADR
                movwf   EEADR
                bsf     EECON1,RD
                movf    EEDATA,w
                bcf     STATUS,RP0
                return

SetParm:
                call    EE_Read                 ; w=ADR, EEDATA0=data. Write only changes
                xorwf   EEDATA0,w
                btfsc   STATUS,Z
                return
EE_Write:
                movf    EEDATA0,w
                bsf     STATUS,RP0
                movwf   EEDATA
                bsf     EECON1,WREN
                bcf     INTCON,GIE
                movlw   0x55
                movwf   EECON2
                movlw   0xAA
                movwf   EECON2
                bsf     EECON1,WR
                bsf     INTCON,GIE
                bcf     EECON1,WREN
EEWrite0:
                btfsc   EECON1,WR               ; wait
                goto    EEWrite0
                bcf     STATUS,RP0
                return



; ----- EEPROM default values (only for simulation)

                org     0x2100

;               dw      0x64                    ; magic byte
;               dw      0x03                    ; CV1   Primary Adress
;               dw      0x1E                    ; CV7   Manufacturer Version
;               dw      0x0D;                   ; CV8   Manufacturer ID
;               dw      0x00;                   ; CV13  Analog F1..F8
;               dw      0x03;                   ; CV14  Analog FL,FR (F9..F12)
;               dw      0xC0;                   ; CV17  Extended Adress High Byte
;               dw      0x03;                   ; CV18  Extended Adress Low Byte
;               dw      0x00;                   ; CV19  Consist Adress
;               dw      0x06;                   ; CV29  0=DIR 1=14/28 2=PWRSRC 3=ADVACK 4=SPDTAB 5=LADRE 6=F8F12 7=ACCDEC
;               dw      0x01;                   ; CV33  front light ->  GPIO (xx54x210)
;               dw      0x02;                   ; CV34  back light  ->  GPIO (xx54x210)
;               dw      0x10;                   ; CV35  F1F ->          GPIO (xx54x210)
;               dw      0x10;                   ; CV36  F1R ->          GPIO (xx54x210)
;               dw      0x20;                   ; CV37  F2F ->          GPIO (xx54x210)
;               dw      0x20;                   ; CV38  F2R ->          GPIO (xx54x210)
;               dw      0x00;                   ; CV39  F3F ->          GPIO (xx54x210)
;               dw      0x00;                   ; CV40  F3R ->          GPIO (xx54x210)
;               dw      0x00;                   ; CV41  F4F ->          GPIO (xx54x210)
;               dw      0x00;                   ; CV42  F4R ->          GPIO (xx54x210)
;               dw      0x00;                   ; CV43
;               dw      0x00;                   ; CV44
;               dw      0x00;                   ; CV45
;               dw      0x00;                   ; CV46
;               dw      0x00;                   ; CV47
;               dw      0x00;                   ; CV48
;               dw      0x00;                   ; CV49
;               dw      0x00;                   ; CV50
;               dw      0x00;                   ; CV51  blik speed


                org     0x2130

                dt      "dcc_func"
                dt      "Petrilak"
                dt      (__VERDAY   >> 4)  +0x30
                dt      (__VERDAY   & 0x0F)+0x30,"/"
                dt      (__VERMONTH >> 4)  +0x30
                dt      (__VERMONTH & 0x0F)+0x30,"/"
                dt      (__VERYEAR  >> 4)  +0x30
                dt      (__VERYEAR  & 0x0F)+0x30


        end
