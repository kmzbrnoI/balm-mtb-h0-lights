EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Osvětlení vozů Balm MTB model - horní deska"
Date "2021-12-23"
Rev "1.0"
Comp "Model Railroader Club Brno I – KMŽ Brno I – https://kmz-brno.cz/"
Comment1 "Jan Horáček; inspirováno https://usuaris.tinet.cat/fmco/dccfunc_en.html"
Comment2 "https://github.com/kmzbrnoI/"
Comment3 "https://creativecommons.org/licenses/by-sa/4.0/"
Comment4 "Released under the Creative Commons Attribution-ShareAlike 4.0 License"
$EndDescr
$Comp
L Regulator_Linear:L78L05_SOT89 U1
U 1 1 61C4DC59
P 5350 1450
F 0 "U1" H 5350 1692 50  0000 C CNN
F 1 "L78L05_SOT89" H 5350 1601 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-89-3_Handsoldering" H 5350 1650 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 5350 1400 50  0001 C CNN
F 4 "C71136" H 5350 1450 50  0001 C CNN "LCSC"
F 5 "0;0;180" H 5350 1450 50  0001 C CNN "JLCPCB_CORRECTION"
	1    5350 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 61C4E378
P 4550 1750
F 0 "C1" H 4665 1796 50  0000 L CNN
F 1 "22u/25V" H 4665 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4588 1600 50  0001 C CNN
F 3 "~" H 4550 1750 50  0001 C CNN
F 4 "C45783" H 4550 1750 50  0001 C CNN "LCSC"
	1    4550 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 61C4E772
P 6150 1750
F 0 "C2" H 6265 1796 50  0000 L CNN
F 1 "47u/6.3V" H 6265 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6188 1600 50  0001 C CNN
F 3 "~" H 6150 1750 50  0001 C CNN
F 4 "C16780" H 6150 1750 50  0001 C CNN "LCSC"
	1    6150 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 61C5145D
P 5350 2050
F 0 "#PWR05" H 5350 1800 50  0001 C CNN
F 1 "GND" H 5355 1877 50  0000 C CNN
F 2 "" H 5350 2050 50  0001 C CNN
F 3 "" H 5350 2050 50  0001 C CNN
	1    5350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1450 6150 1450
$Comp
L power:VCC #PWR03
U 1 1 61C54677
P 6150 1350
F 0 "#PWR03" H 6150 1200 50  0001 C CNN
F 1 "VCC" H 6165 1523 50  0000 C CNN
F 2 "" H 6150 1350 50  0001 C CNN
F 3 "" H 6150 1350 50  0001 C CNN
	1    6150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 1450 6150 1350
Connection ~ 6150 1450
Wire Wire Line
	5350 1750 5350 2050
Connection ~ 5350 2050
Wire Wire Line
	5350 2050 6150 2050
Wire Wire Line
	6150 1600 6150 1450
Wire Wire Line
	6150 1900 6150 2050
Wire Wire Line
	4550 1900 4550 2050
Connection ~ 4550 2050
Wire Wire Line
	4550 2050 5350 2050
Wire Wire Line
	4550 1600 4550 1450
Connection ~ 4550 1450
Wire Wire Line
	4550 1450 5050 1450
Text Label 1650 1150 0    50   ~ 0
J
Text Label 1650 2200 0    50   ~ 0
K
$Comp
L power:VCC #PWR010
U 1 1 61C747A0
P 6000 4450
F 0 "#PWR010" H 6000 4300 50  0001 C CNN
F 1 "VCC" H 6015 4623 50  0000 C CNN
F 2 "" H 6000 4450 50  0001 C CNN
F 3 "" H 6000 4450 50  0001 C CNN
	1    6000 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 61C74F59
P 6000 5950
F 0 "#PWR016" H 6000 5700 50  0001 C CNN
F 1 "GND" H 6005 5777 50  0000 C CNN
F 2 "" H 6000 5950 50  0001 C CNN
F 3 "" H 6000 5950 50  0001 C CNN
	1    6000 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 61C7534B
P 6600 4750
F 0 "C4" H 6715 4796 50  0000 L CNN
F 1 "100n" H 6715 4705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6638 4600 50  0001 C CNN
F 3 "~" H 6600 4750 50  0001 C CNN
F 4 "C49678" H 6600 4750 50  0001 C CNN "LCSC"
	1    6600 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 61C7685B
P 6600 4900
F 0 "#PWR011" H 6600 4650 50  0001 C CNN
F 1 "GND" H 6605 4727 50  0000 C CNN
F 2 "" H 6600 4900 50  0001 C CNN
F 3 "" H 6600 4900 50  0001 C CNN
	1    6600 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4450 6000 4600
Connection ~ 6000 4600
Wire Wire Line
	6000 4600 6000 4750
$Comp
L Transistor_FET:2N7002 Q3
U 1 1 61C8CC8D
P 8550 5350
F 0 "Q3" H 8754 5396 50  0000 L CNN
F 1 "2N7002" H 8754 5305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 8750 5275 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 8550 5350 50  0001 L CNN
F 4 "C8545" H 8550 5350 50  0001 C CNN "LCSC"
	1    8550 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 61CACCE2
P 5400 4750
F 0 "R7" H 5470 4796 50  0000 L CNN
F 1 "100k" H 5470 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5330 4750 50  0001 C CNN
F 3 "~" H 5400 4750 50  0001 C CNN
F 4 "C17407" H 5400 4750 50  0001 C CNN "LCSC"
	1    5400 4750
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_PIC12:PIC12F629-ISN U2
U 1 1 61C6DBE8
P 6000 5350
F 0 "U2" H 5700 4750 50  0000 C CNN
F 1 "PIC12F629-ISN" H 5650 4850 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 6600 6000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/41190G.pdf" H 6000 5350 50  0001 C CNN
	1    6000 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5400 5250 5400 4900
Wire Wire Line
	5400 4600 6000 4600
Wire Wire Line
	6000 4600 6600 4600
Wire Wire Line
	6600 5450 6700 5450
$Comp
L Device:R R11
U 1 1 61CB6ADF
P 6850 5450
F 0 "R11" V 6650 5450 50  0000 C CNN
F 1 "22k" V 6750 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6780 5450 50  0001 C CNN
F 3 "~" H 6850 5450 50  0001 C CNN
F 4 "C17560" H 6850 5450 50  0001 C CNN "LCSC"
	1    6850 5450
	0    1    -1   0   
$EndComp
Wire Wire Line
	7000 5450 7100 5450
Text GLabel 7100 5450 2    50   Input ~ 0
K
$Comp
L power:GND #PWR014
U 1 1 61CC56BD
P 8650 5750
F 0 "#PWR014" H 8650 5500 50  0001 C CNN
F 1 "GND" H 8655 5577 50  0000 C CNN
F 2 "" H 8650 5750 50  0001 C CNN
F 3 "" H 8650 5750 50  0001 C CNN
	1    8650 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 61CC7DC0
P 8250 5500
F 0 "R13" H 8180 5454 50  0000 R CNN
F 1 "100k" H 8180 5545 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8180 5500 50  0001 C CNN
F 3 "~" H 8250 5500 50  0001 C CNN
F 4 "C17407" H 8250 5500 50  0001 C CNN "LCSC"
	1    8250 5500
	1    0    0    1   
$EndComp
Wire Wire Line
	8250 5650 8650 5650
Wire Wire Line
	8650 5650 8650 5550
Wire Wire Line
	8650 5650 8650 5750
Connection ~ 8650 5650
Wire Wire Line
	8350 5350 8250 5350
Wire Wire Line
	8450 3800 8450 3700
Wire Wire Line
	8850 3700 8850 3800
Wire Wire Line
	8850 3400 8850 3300
Wire Wire Line
	8450 3300 8450 3400
$Comp
L Device:LED D16
U 1 1 61C7C627
P 8850 3950
F 0 "D16" H 8843 4167 50  0000 C CNN
F 1 "LED" H 8843 4076 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 8850 3950 50  0001 C CNN
F 3 "~" H 8850 3950 50  0001 C CNN
	1    8850 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D12
U 1 1 61C7C1C5
P 8850 3550
F 0 "D12" H 8843 3767 50  0000 C CNN
F 1 "LED" H 8843 3676 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 8850 3550 50  0001 C CNN
F 3 "~" H 8850 3550 50  0001 C CNN
	1    8850 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D8
U 1 1 61C7BD37
P 8850 3150
F 0 "D8" H 8843 3367 50  0000 C CNN
F 1 "LED" H 8843 3276 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 8850 3150 50  0001 C CNN
F 3 "~" H 8850 3150 50  0001 C CNN
	1    8850 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D15
U 1 1 61C7B53A
P 8450 3950
F 0 "D15" H 8443 4167 50  0000 C CNN
F 1 "LED" H 8443 4076 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 8450 3950 50  0001 C CNN
F 3 "~" H 8450 3950 50  0001 C CNN
	1    8450 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D11
U 1 1 61C7AE3E
P 8450 3550
F 0 "D11" H 8443 3767 50  0000 C CNN
F 1 "LED" H 8443 3676 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 8450 3550 50  0001 C CNN
F 3 "~" H 8450 3550 50  0001 C CNN
	1    8450 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D7
U 1 1 61C7A55C
P 8450 3150
F 0 "D7" H 8443 3367 50  0000 C CNN
F 1 "LED" H 8443 3276 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 8450 3150 50  0001 C CNN
F 3 "~" H 8450 3150 50  0001 C CNN
	1    8450 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8250 5350 7900 5350
Connection ~ 8250 5350
Wire Wire Line
	8650 4750 8450 4750
Wire Wire Line
	8450 4750 8450 4500
Wire Wire Line
	8650 4750 8850 4750
Wire Wire Line
	8850 4750 8850 4500
Connection ~ 8650 4750
$Comp
L power:+15V #PWR06
U 1 1 61D15525
P 8650 2750
F 0 "#PWR06" H 8650 2600 50  0001 C CNN
F 1 "+15V" H 8665 2923 50  0000 C CNN
F 2 "" H 8650 2750 50  0001 C CNN
F 3 "" H 8650 2750 50  0001 C CNN
	1    8650 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 2900 8650 2900
Wire Wire Line
	8650 2900 8650 2750
Connection ~ 8650 2900
Wire Wire Line
	8650 2900 8850 2900
Wire Wire Line
	7250 5250 6600 5250
Wire Wire Line
	5400 5350 4750 5350
Wire Wire Line
	8650 4750 8650 5150
$Comp
L Transistor_FET:2N7002 Q4
U 1 1 61DAE36A
P 4050 5450
F 0 "Q4" H 4254 5496 50  0000 L CNN
F 1 "2N7002" H 4254 5405 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4250 5375 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 4050 5450 50  0001 L CNN
F 4 "C8545" H 4050 5450 50  0001 C CNN "LCSC"
	1    4050 5450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 61DAE370
P 3950 5850
F 0 "#PWR015" H 3950 5600 50  0001 C CNN
F 1 "GND" H 3955 5677 50  0000 C CNN
F 2 "" H 3950 5850 50  0001 C CNN
F 3 "" H 3950 5850 50  0001 C CNN
	1    3950 5850
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 61DAE376
P 4350 5600
F 0 "R14" H 4280 5554 50  0000 R CNN
F 1 "100k" H 4280 5645 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4280 5600 50  0001 C CNN
F 3 "~" H 4350 5600 50  0001 C CNN
F 4 "C17407" H 4350 5600 50  0001 C CNN "LCSC"
	1    4350 5600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4350 5750 3950 5750
Wire Wire Line
	3950 5750 3950 5650
Wire Wire Line
	3950 5750 3950 5850
Connection ~ 3950 5750
Wire Wire Line
	4250 5450 4350 5450
$Comp
L power:+15V #PWR07
U 1 1 61D7E79C
P 9650 2750
F 0 "#PWR07" H 9650 2600 50  0001 C CNN
F 1 "+15V" H 9665 2923 50  0000 C CNN
F 2 "" H 9650 2750 50  0001 C CNN
F 3 "" H 9650 2750 50  0001 C CNN
	1    9650 2750
	1    0    0    -1  
$EndComp
Connection ~ 9650 4750
Wire Wire Line
	9850 4750 9850 4500
Wire Wire Line
	9650 4750 9850 4750
Wire Wire Line
	9450 4750 9450 4500
Wire Wire Line
	9650 4750 9450 4750
Wire Wire Line
	9650 4850 9650 4750
Connection ~ 9250 5050
Wire Wire Line
	9250 5050 7900 5050
Wire Wire Line
	9350 5050 9250 5050
Connection ~ 9650 5350
Wire Wire Line
	9650 5350 9650 5450
Wire Wire Line
	9650 5350 9650 5250
Wire Wire Line
	9250 5350 9650 5350
$Comp
L Device:R R10
U 1 1 61D26723
P 9250 5200
F 0 "R10" H 9180 5154 50  0000 R CNN
F 1 "100k" H 9180 5245 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9180 5200 50  0001 C CNN
F 3 "~" H 9250 5200 50  0001 C CNN
F 4 "C17407" H 9250 5200 50  0001 C CNN "LCSC"
	1    9250 5200
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 61D2671D
P 9650 5450
F 0 "#PWR012" H 9650 5200 50  0001 C CNN
F 1 "GND" H 9655 5277 50  0000 C CNN
F 2 "" H 9650 5450 50  0001 C CNN
F 3 "" H 9650 5450 50  0001 C CNN
	1    9650 5450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:2N7002 Q1
U 1 1 61D26717
P 9550 5050
F 0 "Q1" H 9754 5096 50  0000 L CNN
F 1 "2N7002" H 9754 5005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 9750 4975 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 9550 5050 50  0001 L CNN
F 4 "C8545" H 9550 5050 50  0001 C CNN "LCSC"
	1    9550 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61C83A9A
P 9850 4350
F 0 "R6" V 9643 4350 50  0000 C CNN
F 1 "10k" V 9734 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9780 4350 50  0001 C CNN
F 3 "~" H 9850 4350 50  0001 C CNN
F 4 "C17414" H 9850 4350 50  0001 C CNN "LCSC"
	1    9850 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D10
U 1 1 61C7F6AB
P 9850 3150
F 0 "D10" H 9843 3367 50  0000 C CNN
F 1 "LED" H 9843 3276 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 9850 3150 50  0001 C CNN
F 3 "~" H 9850 3150 50  0001 C CNN
	1    9850 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9850 3700 9850 3800
Wire Wire Line
	9850 3300 9850 3400
Wire Wire Line
	9450 3400 9450 3300
Wire Wire Line
	9450 3800 9450 3700
$Comp
L Device:LED D18
U 1 1 61C7F6B7
P 9850 3950
F 0 "D18" H 9843 4167 50  0000 C CNN
F 1 "LED" H 9843 4076 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 9850 3950 50  0001 C CNN
F 3 "~" H 9850 3950 50  0001 C CNN
	1    9850 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D14
U 1 1 61C7F6B1
P 9850 3550
F 0 "D14" H 9843 3767 50  0000 C CNN
F 1 "LED" H 9843 3676 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 9850 3550 50  0001 C CNN
F 3 "~" H 9850 3550 50  0001 C CNN
	1    9850 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D17
U 1 1 61C7F6A5
P 9450 3950
F 0 "D17" H 9443 4167 50  0000 C CNN
F 1 "LED" H 9443 4076 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 9450 3950 50  0001 C CNN
F 3 "~" H 9450 3950 50  0001 C CNN
	1    9450 3950
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D13
U 1 1 61C7F69F
P 9450 3550
F 0 "D13" H 9443 3767 50  0000 C CNN
F 1 "LED" H 9443 3676 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 9450 3550 50  0001 C CNN
F 3 "~" H 9450 3550 50  0001 C CNN
	1    9450 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D9
U 1 1 61C7F699
P 9450 3150
F 0 "D9" H 9443 3367 50  0000 C CNN
F 1 "LED" H 9443 3276 50  0000 C CNN
F 2 "LED_SMD:LED_PLCC_2835_Handsoldering" H 9450 3150 50  0001 C CNN
F 3 "~" H 9450 3150 50  0001 C CNN
	1    9450 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 61C8407F
P 9450 4350
F 0 "R5" V 9243 4350 50  0000 C CNN
F 1 "10k" V 9334 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 9380 4350 50  0001 C CNN
F 3 "~" H 9450 4350 50  0001 C CNN
F 4 "C17414" H 9450 4350 50  0001 C CNN "LCSC"
	1    9450 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3000 9450 2900
Wire Wire Line
	9450 2900 9650 2900
Wire Wire Line
	9850 2900 9850 3000
Wire Wire Line
	9650 2750 9650 2900
Connection ~ 9650 2900
Wire Wire Line
	9650 2900 9850 2900
Wire Wire Line
	7250 5050 7250 5250
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 61E218BD
P 2850 5350
F 0 "Q2" H 3054 5396 50  0000 L CNN
F 1 "2N7002" H 3054 5305 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 3050 5275 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/NDS7002A-D.PDF" H 2850 5350 50  0001 L CNN
F 4 "C8545" H 2850 5350 50  0001 C CNN "LCSC"
	1    2850 5350
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 61E218C3
P 2750 5750
F 0 "#PWR013" H 2750 5500 50  0001 C CNN
F 1 "GND" H 2755 5577 50  0000 C CNN
F 2 "" H 2750 5750 50  0001 C CNN
F 3 "" H 2750 5750 50  0001 C CNN
	1    2750 5750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 61E218C9
P 3150 5500
F 0 "R12" H 3080 5454 50  0000 R CNN
F 1 "100k" H 3080 5545 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3080 5500 50  0001 C CNN
F 3 "~" H 3150 5500 50  0001 C CNN
F 4 "C17407" H 3150 5500 50  0001 C CNN "LCSC"
	1    3150 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	3150 5650 2750 5650
Wire Wire Line
	2750 5650 2750 5550
Wire Wire Line
	2750 5650 2750 5750
Connection ~ 2750 5650
Wire Wire Line
	3050 5350 3150 5350
Wire Wire Line
	4350 5450 4450 5450
Connection ~ 4350 5450
Wire Wire Line
	4750 5350 4750 5150
Wire Wire Line
	3150 5150 3150 5350
Connection ~ 3150 5350
Wire Wire Line
	2750 5150 2750 5050
$Comp
L Device:R R9
U 1 1 61E4F7A3
P 3950 4900
F 0 "R9" H 3880 4854 50  0000 R CNN
F 1 "10k" H 3880 4945 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3880 4900 50  0001 C CNN
F 3 "~" H 3950 4900 50  0001 C CNN
F 4 "C17414" H 3950 4900 50  0001 C CNN "LCSC"
	1    3950 4900
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 61E57DFE
P 2750 4900
F 0 "R8" H 2680 4854 50  0000 R CNN
F 1 "10k" H 2680 4945 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2680 4900 50  0001 C CNN
F 3 "~" H 2750 4900 50  0001 C CNN
F 4 "C17414" H 2750 4900 50  0001 C CNN "LCSC"
	1    2750 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 4650 2750 4650
Wire Wire Line
	2750 4650 2750 4750
$Comp
L power:+15V #PWR08
U 1 1 61E5E3C8
P 2750 4400
F 0 "#PWR08" H 2750 4250 50  0001 C CNN
F 1 "+15V" H 2765 4573 50  0000 C CNN
F 2 "" H 2750 4400 50  0001 C CNN
F 3 "" H 2750 4400 50  0001 C CNN
	1    2750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4550 2750 4550
Wire Wire Line
	2750 4550 2750 4400
$Comp
L power:+15V #PWR09
U 1 1 61E64D89
P 3950 4400
F 0 "#PWR09" H 3950 4250 50  0001 C CNN
F 1 "+15V" H 3965 4573 50  0000 C CNN
F 2 "" H 3950 4400 50  0001 C CNN
F 3 "" H 3950 4400 50  0001 C CNN
	1    3950 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4550 3950 4550
Wire Wire Line
	3950 4550 3950 4400
Wire Wire Line
	3750 4650 3950 4650
Wire Wire Line
	3950 4650 3950 4750
Wire Wire Line
	3950 5050 3950 5250
$Comp
L Device:CP C3
U 1 1 61EA672D
P 4800 2900
F 0 "C3" H 4918 2946 50  0000 L CNN
F 1 "470u/25V" H 4918 2855 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 4838 2750 50  0001 C CNN
F 3 "~" H 4800 2900 50  0001 C CNN
	1    4800 2900
	1    0    0    -1  
$EndComp
$Comp
L Diode:CD4148W D3
U 1 1 61ED98D7
P 3950 1450
F 0 "D3" H 3950 1233 50  0000 C CNN
F 1 "CD4148W" H 3950 1324 50  0000 C CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3950 1250 50  0001 C CNN
F 3 "https://www.dccomponents.com/upload/product/original/806236332588.pdf" H 3950 1450 50  0001 C CNN
F 4 "C2128" H 3950 1450 50  0001 C CNN "LCSC"
	1    3950 1450
	-1   0    0    1   
$EndComp
Text Notes 6300 1550 0    50   ~ 0
Napájení pouze pro procesor,\nmusí vydržet delší výpadek!
$Comp
L Diode:1N4007 D6
U 1 1 61EEB281
P 4050 2550
F 0 "D6" H 4050 2767 50  0000 C CNN
F 1 "1N4007" H 4050 2676 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 4050 2375 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 4050 2550 50  0001 C CNN
F 4 "C64898" H 4050 2550 50  0001 C CNN "LCSC"
	1    4050 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 61EEF049
P 4400 2900
F 0 "R2" H 4470 2946 50  0000 L CNN
F 1 "2k2" H 4470 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4330 2900 50  0001 C CNN
F 3 "~" H 4400 2900 50  0001 C CNN
F 4 "C17520" H 4400 2900 50  0001 C CNN "LCSC"
	1    4400 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 61EECD7B
P 4050 3250
F 0 "L1" V 4240 3250 50  0000 C CNN
F 1 "47uH" V 4149 3250 50  0000 C CNN
F 2 "Inductor_THT:L_Axial_L6.6mm_D2.7mm_P10.16mm_Horizontal_Vishay_IM-2" H 4050 3250 50  0001 C CNN
F 3 "~" H 4050 3250 50  0001 C CNN
	1    4050 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 3250 4400 3250
Wire Wire Line
	4800 3250 4800 3050
Wire Wire Line
	4400 3050 4400 3250
Connection ~ 4400 3250
Wire Wire Line
	4400 3250 4800 3250
Wire Wire Line
	4400 2750 4400 2550
Wire Wire Line
	4400 2550 4800 2550
Wire Wire Line
	4800 2550 4800 2750
Wire Wire Line
	4400 2550 4250 2550
Connection ~ 4400 2550
Wire Wire Line
	4250 2550 4250 2900
Wire Wire Line
	4250 2900 4200 2900
Connection ~ 4250 2550
Wire Wire Line
	4250 2550 4200 2550
$Comp
L Device:R R1
U 1 1 61EEBA12
P 4050 2900
F 0 "R1" V 4257 2900 50  0000 C CNN
F 1 "100R" V 4166 2900 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric_Pad1.40x3.35mm_HandSolder" V 3980 2900 50  0001 C CNN
F 3 "~" H 4050 2900 50  0001 C CNN
F 4 "" H 4050 2900 50  0001 C CNN "LCSC"
	1    4050 2900
	0    1    -1   0   
$EndComp
Wire Wire Line
	3900 2900 3800 2900
Wire Wire Line
	3800 2900 3800 2550
Wire Wire Line
	3800 2550 3900 2550
Wire Wire Line
	3800 2550 3300 2550
Connection ~ 3800 2550
Wire Wire Line
	3900 3250 3100 3250
Wire Wire Line
	3100 2050 3100 3250
Wire Wire Line
	3100 2050 4550 2050
Wire Wire Line
	3300 1450 3300 1750
Connection ~ 3300 1450
Wire Wire Line
	3300 1250 3300 1450
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 61C6A9E5
P 1400 1150
F 0 "J1" H 1318 925 50  0000 C CNN
F 1 "Conn_01x01" H 1318 1016 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 1400 1150 50  0001 C CNN
F 3 "~" H 1400 1150 50  0001 C CNN
	1    1400 1150
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 61C6B7B8
P 1400 2200
F 0 "J4" H 1318 1975 50  0000 C CNN
F 1 "Conn_01x01" H 1318 2066 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 1400 2200 50  0001 C CNN
F 3 "~" H 1400 2200 50  0001 C CNN
	1    1400 2200
	-1   0    0    1   
$EndComp
Text Label 6700 5250 0    50   ~ 0
GP0|PGD
Text Label 6700 5350 0    50   ~ 0
GP1|PGC
Text GLabel 5400 5250 0    50   Input ~ 0
GP3|MCLR
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 61C75225
P 9300 1500
F 0 "J3" H 9380 1492 50  0000 L CNN
F 1 "Conn_01x06" H 9380 1401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 9300 1500 50  0001 C CNN
F 3 "~" H 9300 1500 50  0001 C CNN
	1    9300 1500
	1    0    0    -1  
$EndComp
Text Notes 9200 1150 0    50   ~ 0
Programming\nconnector
Text GLabel 8900 1300 0    50   Input ~ 0
GP3|MCLR
Wire Wire Line
	9100 1400 9000 1400
Wire Wire Line
	8900 1300 9100 1300
$Comp
L power:VCC #PWR01
U 1 1 61C8D1BE
P 9000 1200
F 0 "#PWR01" H 9000 1050 50  0001 C CNN
F 1 "VCC" H 9015 1373 50  0000 C CNN
F 2 "" H 9000 1200 50  0001 C CNN
F 3 "" H 9000 1200 50  0001 C CNN
	1    9000 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1200 9000 1400
Wire Wire Line
	9100 1500 9000 1500
Wire Wire Line
	9000 1500 9000 1900
$Comp
L power:GND #PWR04
U 1 1 61C960C4
P 9000 1900
F 0 "#PWR04" H 9000 1650 50  0001 C CNN
F 1 "GND" H 9005 1727 50  0000 C CNN
F 2 "" H 9000 1900 50  0001 C CNN
F 3 "" H 9000 1900 50  0001 C CNN
	1    9000 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1600 8900 1600
Text GLabel 8900 1600 0    50   Input ~ 0
GP0|PGD
Wire Wire Line
	9100 1700 8900 1700
Text GLabel 8900 1700 0    50   Input ~ 0
GP1|PGC
NoConn ~ 9100 1800
Wire Wire Line
	4100 1450 4550 1450
Wire Wire Line
	3300 1450 3800 1450
$Comp
L Diode:1N4007 D1
U 1 1 61C6E829
P 2350 1450
F 0 "D1" H 2350 1667 50  0000 C CNN
F 1 "1N4007" H 2350 1576 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 2350 1275 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2350 1450 50  0001 C CNN
F 4 "C64898" H 2350 1450 50  0001 C CNN "LCSC"
	1    2350 1450
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D2
U 1 1 61C6EC88
P 2850 1450
F 0 "D2" H 2850 1667 50  0000 C CNN
F 1 "1N4007" H 2850 1576 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 2850 1275 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2850 1450 50  0001 C CNN
F 4 "C64898" H 2850 1450 50  0001 C CNN "LCSC"
	1    2850 1450
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D5
U 1 1 61C6F498
P 2850 1800
F 0 "D5" H 2850 2017 50  0000 C CNN
F 1 "1N4007" H 2850 1926 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 2850 1625 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2850 1800 50  0001 C CNN
F 4 "C64898" H 2850 1800 50  0001 C CNN "LCSC"
	1    2850 1800
	-1   0    0    -1  
$EndComp
$Comp
L Diode:1N4007 D4
U 1 1 61C6DEAF
P 2350 1800
F 0 "D4" H 2350 2017 50  0000 C CNN
F 1 "1N4007" H 2350 1926 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 2350 1625 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 2350 1800 50  0001 C CNN
F 4 "C64898" H 2350 1800 50  0001 C CNN "LCSC"
	1    2350 1800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 1450 3100 1450
Wire Wire Line
	2700 1450 2600 1450
Wire Wire Line
	2500 1800 2600 1800
Wire Wire Line
	3100 2050 2100 2050
Wire Wire Line
	2100 2050 2100 1800
Wire Wire Line
	2100 1450 2200 1450
Connection ~ 3100 2050
Wire Wire Line
	2200 1800 2100 1800
Connection ~ 2100 1800
Wire Wire Line
	2100 1800 2100 1450
Wire Wire Line
	3000 1800 3100 1800
Wire Wire Line
	3100 1800 3100 1450
Connection ~ 3100 1450
Wire Wire Line
	3100 1450 3000 1450
Wire Wire Line
	1600 1150 1750 1150
Wire Wire Line
	2600 1150 2600 1450
Connection ~ 2600 1450
Wire Wire Line
	2600 1450 2500 1450
Wire Wire Line
	1600 2200 1750 2200
Wire Wire Line
	2600 2200 2600 1800
Connection ~ 2600 1800
Wire Wire Line
	2600 1800 2700 1800
$Comp
L Connector_Generic:Conn_01x01 J5
U 1 1 61CE3E32
P 1400 2350
F 0 "J5" H 1500 2300 50  0000 L CNN
F 1 "Conn_01x01" H 1500 2400 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 1400 2350 50  0001 C CNN
F 3 "~" H 1400 2350 50  0001 C CNN
	1    1400 2350
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 61CEB4C6
P 1400 1300
F 0 "J2" H 1500 1250 50  0000 L CNN
F 1 "Conn_01x01" H 1500 1350 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 1400 1300 50  0001 C CNN
F 3 "~" H 1400 1300 50  0001 C CNN
	1    1400 1300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1600 1300 1750 1300
Wire Wire Line
	1750 1300 1750 1150
Connection ~ 1750 1150
Wire Wire Line
	1750 1150 2600 1150
Wire Wire Line
	1600 2350 1750 2350
Wire Wire Line
	1750 2350 1750 2200
Connection ~ 1750 2200
Wire Wire Line
	1750 2200 2600 2200
Text Notes 3800 3400 0    50   ~ 0
250 mA max
$Comp
L Mechanical:MountingHole H1
U 1 1 61CA32F4
P 1250 6550
F 0 "H1" H 1350 6596 50  0000 L CNN
F 1 "MountingHole" H 1350 6505 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 1250 6550 50  0001 C CNN
F 3 "~" H 1250 6550 50  0001 C CNN
	1    1250 6550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 61CA4340
P 1250 6750
F 0 "H2" H 1350 6796 50  0000 L CNN
F 1 "MountingHole" H 1350 6705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 1250 6750 50  0001 C CNN
F 3 "~" H 1250 6750 50  0001 C CNN
	1    1250 6750
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 61CA48C2
P 1250 6950
F 0 "H3" H 1350 6996 50  0000 L CNN
F 1 "MountingHole" H 1350 6905 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 1250 6950 50  0001 C CNN
F 3 "~" H 1250 6950 50  0001 C CNN
	1    1250 6950
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 61CA5208
P 1250 7150
F 0 "H4" H 1350 7196 50  0000 L CNN
F 1 "MountingHole" H 1350 7105 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 1250 7150 50  0001 C CNN
F 3 "~" H 1250 7150 50  0001 C CNN
	1    1250 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 61CD785A
P 7750 5050
F 0 "R15" V 7543 5050 50  0000 C CNN
F 1 "220R" V 7634 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7680 5050 50  0001 C CNN
F 3 "~" H 7750 5050 50  0001 C CNN
F 4 "C17557" H 7750 5050 50  0001 C CNN "LCSC"
	1    7750 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 5050 7250 5050
$Comp
L Device:R R17
U 1 1 61CD8474
P 7750 5350
F 0 "R17" V 7543 5350 50  0000 C CNN
F 1 "220R" V 7634 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7680 5350 50  0001 C CNN
F 3 "~" H 7750 5350 50  0001 C CNN
F 4 "C17557" H 7750 5350 50  0001 C CNN "LCSC"
	1    7750 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 5350 6600 5350
$Comp
L Device:R R18
U 1 1 61CDBBFA
P 4600 5450
F 0 "R18" V 4393 5450 50  0000 C CNN
F 1 "220R" V 4484 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4530 5450 50  0001 C CNN
F 3 "~" H 4600 5450 50  0001 C CNN
F 4 "C17557" H 4600 5450 50  0001 C CNN "LCSC"
	1    4600 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	4750 5450 5400 5450
$Comp
L Device:R R16
U 1 1 61CDC419
P 4600 5150
F 0 "R16" V 4393 5150 50  0000 C CNN
F 1 "220R" V 4484 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4530 5150 50  0001 C CNN
F 3 "~" H 4600 5150 50  0001 C CNN
F 4 "C17557" H 4600 5150 50  0001 C CNN "LCSC"
	1    4600 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 5150 3150 5150
$Comp
L Device:CP C5
U 1 1 61CF6CF1
P 5500 2900
F 0 "C5" H 5618 2946 50  0000 L CNN
F 1 "1000u/25V" H 5618 2855 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 5538 2750 50  0001 C CNN
F 3 "~" H 5500 2900 50  0001 C CNN
	1    5500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2550 5500 2550
Wire Wire Line
	5500 2550 5500 2750
Connection ~ 4800 2550
Wire Wire Line
	4800 3250 5500 3250
Wire Wire Line
	5500 3250 5500 3050
Connection ~ 4800 3250
Text Notes 5000 3400 0    50   ~ 0
Variants
$Comp
L Connector_Generic:Conn_01x01 J6
U 1 1 61D11B44
P 2300 4550
F 0 "J6" H 2218 4325 50  0000 C CNN
F 1 "Conn_01x01" H 2218 4416 50  0000 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.5mm_Drill0.7mm" H 2300 4550 50  0001 C CNN
F 3 "~" H 2300 4550 50  0001 C CNN
	1    2300 4550
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J8
U 1 1 61D14455
P 2300 4650
F 0 "J8" H 2200 4900 50  0000 C CNN
F 1 "Conn_01x01" H 2200 4800 50  0000 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.5mm_Drill0.7mm" H 2300 4650 50  0001 C CNN
F 3 "~" H 2300 4650 50  0001 C CNN
	1    2300 4650
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J7
U 1 1 61D17687
P 3550 4550
F 0 "J7" H 3468 4325 50  0000 C CNN
F 1 "Conn_01x01" H 3468 4416 50  0000 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.5mm_Drill0.7mm" H 3550 4550 50  0001 C CNN
F 3 "~" H 3550 4550 50  0001 C CNN
	1    3550 4550
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J9
U 1 1 61D1768D
P 3550 4650
F 0 "J9" H 3450 4900 50  0000 C CNN
F 1 "Conn_01x01" H 3450 4800 50  0000 C CNN
F 2 "TestPoint:TestPoint_THTPad_D1.5mm_Drill0.7mm" H 3550 4650 50  0001 C CNN
F 3 "~" H 3550 4650 50  0001 C CNN
	1    3550 4650
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 61D3AFFC
P 2600 2200
F 0 "#FLG0101" H 2600 2275 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 2373 50  0000 C CNN
F 2 "" H 2600 2200 50  0001 C CNN
F 3 "~" H 2600 2200 50  0001 C CNN
	1    2600 2200
	-1   0    0    1   
$EndComp
Connection ~ 2600 2200
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 61D3B7DF
P 2600 1150
F 0 "#FLG0102" H 2600 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 1323 50  0000 C CNN
F 2 "" H 2600 1150 50  0001 C CNN
F 3 "~" H 2600 1150 50  0001 C CNN
	1    2600 1150
	1    0    0    -1  
$EndComp
Connection ~ 2600 1150
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 61D3CCB5
P 4550 2050
F 0 "#FLG0103" H 4550 2125 50  0001 C CNN
F 1 "PWR_FLAG" H 4550 2223 50  0000 C CNN
F 2 "" H 4550 2050 50  0001 C CNN
F 3 "~" H 4550 2050 50  0001 C CNN
	1    4550 2050
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 61D3D3E3
P 4550 1450
F 0 "#FLG0104" H 4550 1525 50  0001 C CNN
F 1 "PWR_FLAG" H 4550 1623 50  0000 C CNN
F 2 "" H 4550 1450 50  0001 C CNN
F 3 "~" H 4550 1450 50  0001 C CNN
	1    4550 1450
	1    0    0    -1  
$EndComp
Text GLabel 2600 2200 2    50   Input ~ 0
K
$Comp
L power:+15V #PWR0101
U 1 1 61D54732
P 3300 1250
F 0 "#PWR0101" H 3300 1100 50  0001 C CNN
F 1 "+15V" H 3315 1423 50  0000 C CNN
F 2 "" H 3300 1250 50  0001 C CNN
F 3 "" H 3300 1250 50  0001 C CNN
	1    3300 1250
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0105
U 1 1 61D5803C
P 3300 1750
F 0 "#FLG0105" H 3300 1825 50  0001 C CNN
F 1 "PWR_FLAG" V 3300 1878 50  0000 L CNN
F 2 "" H 3300 1750 50  0001 C CNN
F 3 "~" H 3300 1750 50  0001 C CNN
	1    3300 1750
	0    1    1    0   
$EndComp
Connection ~ 3300 1750
Wire Wire Line
	3300 1750 3300 2550
Text GLabel 7250 5050 0    50   Input ~ 0
GP0|PGD
Text GLabel 7400 5350 3    50   Input ~ 0
GP1|PGC
$Comp
L Connector_Generic:Conn_01x01 J10
U 1 1 61DA5067
P 1400 1450
F 0 "J10" H 1318 1225 50  0000 C CNN
F 1 "Conn_01x01" H 1318 1316 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 1400 1450 50  0001 C CNN
F 3 "~" H 1400 1450 50  0001 C CNN
	1    1400 1450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1600 1450 1750 1450
Wire Wire Line
	1750 1450 1750 1300
Connection ~ 1750 1300
$Comp
L Connector_Generic:Conn_01x01 J11
U 1 1 61DAEFB4
P 1400 2500
F 0 "J11" H 1318 2275 50  0000 C CNN
F 1 "Conn_01x01" H 1318 2366 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 1400 2500 50  0001 C CNN
F 3 "~" H 1400 2500 50  0001 C CNN
	1    1400 2500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1600 2500 1750 2500
Wire Wire Line
	1750 2500 1750 2350
Connection ~ 1750 2350
Wire Wire Line
	8850 2900 8850 3000
Wire Wire Line
	8450 3000 8450 2900
$Comp
L Device:R R4
U 1 1 61C84465
P 8850 4350
F 0 "R4" V 8643 4350 50  0000 C CNN
F 1 "10k" V 8734 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8780 4350 50  0001 C CNN
F 3 "~" H 8850 4350 50  0001 C CNN
F 4 "C17414" H 8850 4350 50  0001 C CNN "LCSC"
	1    8850 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 61C84938
P 8450 4350
F 0 "R3" V 8243 4350 50  0000 C CNN
F 1 "10k" V 8334 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8380 4350 50  0001 C CNN
F 3 "~" H 8450 4350 50  0001 C CNN
F 4 "C17414" H 8450 4350 50  0001 C CNN "LCSC"
	1    8450 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4200 8850 4100
Wire Wire Line
	8450 4200 8450 4100
Wire Wire Line
	9850 4200 9850 4100
Wire Wire Line
	9450 4200 9450 4100
$EndSCHEMATC
