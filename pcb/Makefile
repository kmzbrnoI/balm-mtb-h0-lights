all: fab-top

clean:
	rm -r fab-top

fab-top: top.kicad_pcb top.sch
	kikit fab jlcpcb --assembly --schematic top.sch top.kicad_pcb fab-top

.PHONY: all clean
