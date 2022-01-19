all: panel.kicad_pcb fab

panel.kicad_pcb: pcb-head.kicad_pcb Makefile
	kikit panelize grid \
		--space 3 --gridsize 7 3 --tabwidth 3 --tabheight 2 --radius 1 \
		--mousebites 0.3 0.6 0 --vtabs 2 \
		pcb-head.kicad_pcb panel.kicad_pcb

fab: panel.kicad_pcb Makefile
	kikit fab jlcpcb panel.kicad_pcb fab

clean:
	rm -f panel.kicad_pcb
	rm -rf fab

.PHONY: all clean
