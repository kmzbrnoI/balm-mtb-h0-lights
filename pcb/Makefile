all: fab-top

clean:
	rm -r fab-top

fab-top: top.kicad_pcb top.kicad_sch
	kikit fab jlcpcb --assembly --no-drc --schematic top.kicad_sch top.kicad_pcb fab-top

.PHONY: all clean
