all: dcc_isr.hex

dcc_isr.cod dcc_isr.hex dcc_isr.lst: dcc_isr.asm
	gpasm dcc_isr.asm

prog:
	minipro -p pic12f629 -c code -w dcc_isr.hex --icsp_vcc
	minipro -p pic12f629 -c config -w fuses.conf --icsp_vcc

clean:
	rm -f dcc_isr.cod dcc_isr.lst dcc_isr.hex

.PHONY: all sim clean prog
