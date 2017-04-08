default: hexbrick-demo.scad hexbrick-demo.stl hexbrick-demo.png hexbrick-preview.png coordinates-preview.png

hexbrick-demo.scad: hexbrick-lib.scad demo.scad
	cat $^ > $@

%.stl: %.scad
	openscad -o $@ $^

XVFB_RUN := xvfb-run -s "-screen 0 1024x768x24" -a

SCFLAGS :=
hexbrick-demo.png: SCFLAGS := --camera=15,20,0,30,0,25,120 --autocenter
coordinates.png: SCFLAGS := --camera=40,12.5,0,0,0,0,180 --projection=ortho --autocenter

%.png: %.scad
	$(XVFB_RUN) openscad $(SCFLAGS) --imgsize 7680,5120 -o $*_4x.png $^
	pngtopnm $*_4x.png | pnmscale .25 | pnmtopng > $@
	rm -f $*_4x.png

hexbrick-preview.png: hexbrick-demo.png
	pngtopnm $< | pnmscale .50 | pnmtopng > $@

%-preview.png: %.png
	pngtopnm $< | pnmscale .50 | pnmtopng > $@

.PHONY: clean
clean:
	rm -f hexbrick-demo.scad hexbrick-demo.stl hexbrick-demo.png coordinates.png *_4x.png

.DELETE_ON_ERROR:
