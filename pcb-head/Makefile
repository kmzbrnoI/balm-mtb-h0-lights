all: panel.kicad_pcb fab

panel.kicad_pcb: pcb-head.kicad_pcb Makefile
	kikit panelize \
		--layout 'grid; rows: 10; cols: 3; space: 5mm' \
		--tabs annotation \
		--cuts 'mousebites; drill: 0.3mm; spacing: 0.6 mm; prolong: 0.5mm' \
		--post 'millradius: 1mm' \
		--source 'tolerance: 15mm' \
		pcb-head.kicad_pcb panel.kicad_pcb

fab: panel.kicad_pcb Makefile
	kikit fab jlcpcb --no-drc panel.kicad_pcb fab

clean:
	rm -f panel.*
	rm -rf fab

.PHONY: all clean
