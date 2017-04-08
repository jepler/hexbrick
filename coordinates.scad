include <hexbrick-lib.scad>

quick = false;

module render_if() {
    if(quick) render() children();
    else children();
}

R=-30;
sz=2.6;

translate([-10,0,0])
rotate([0,0,R])
{
    color(c=[.8,.3,.3], alpha=.4)
    render_if()
    intersection() {
        inner_volume_coordlist([[ [0,0],[9,0],[9,5],[0,5] ]]);
        translate([-base_width/2, -short_advance/2, -base_height])
        for(x=[-1:1:10]) for(y=[-1:1:6]) hexgrid(x,y) lambda_wall();
    }

    color("black")
    translate([0,0,20])
    for(x=[0:1:9]) for(y=[0:1:5]) hexgrid(x,y) {
        rotate([0,0,-R])
        text(str(x, ",", y), size=sz, valign="center", halign="center");
    }

    translate([0,0,10])
    color(c=[.3,.3,.3], alpha=.4) {
        outer_walls_coordlist([[[1,0]], [[0,2]]]);
        outer_walls_coordlist([[[2,1]], [[3,2]]]);
        outer_walls_coordlist([[[0,5]], [[2,4]]]);
        outer_walls_coordlist([[[5,0], [5,2]]]);
        outer_walls_coordlist([[[4,4], [6,4]]]);
        outer_walls_coordlist([[[7,2], [9,0]]]);
    }
}

color("black")
translate([65,28]) {
    text("Deltas (punctual):", size=sz);
    translate([0,-4,0]) text("-1,+2", size=sz);
    translate([15,-4,0]) text("+1,-2", size=sz);
    translate([0,-8,0]) text("+1,+1", size=sz);
    translate([15,-8,0]) text("-1,-1", size=sz);
    translate([0,-12,0]) text("+2,-1", size=sz);
    translate([15,-12,0]) text("-2,+1", size=sz);

    translate([0,-20,0]) text("Deltas (lateral):", size=sz);
    translate([0,-24,0]) text("+2,0", size=sz);
    translate([15,-24,0]) text("-2,0", size=sz);
    translate([0,-28,0]) text("0,+2", size=sz);
    translate([15,-28,0]) text("0,-2", size=sz);
    translate([0,-32,0]) text("+2,-2", size=sz);
    translate([15,-32,0]) text("-2,+2", size=sz);
}
