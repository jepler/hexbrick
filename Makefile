default: hexbrick-demo.scad hexbrick-demo.stl hexbrick-demo.png hexbrick-preview.png

hexbrick-demo.scad: hexbrick-lib.scad demo.scad
	cat $^ > $@

%.stl: %.scad
	openscad -o $@ $^

XVFB_RUN := xvfb-run -s "-screen 0 1024x768x24" -a

%.png: %.scad
	$(XVFB_RUN) openscad --camera=15,20,0,30,0,25,120 --autocenter --imgsize 7680,5120 -o $*_4x.png $^
	convert -geometry 25% $*_4x.png $@
	rm -f $*_4x.png

hexbrick-preview.png: hexbrick-demo.png
	convert -geometry 50% $< $@


.PHONY: clean
clean:
	rm -f hexbrick-demo.scad hexbrick-demo.stl hexbrick-demo.png

.DELETE_ON_ERROR:
