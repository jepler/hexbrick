include <hexbrick-lib.scad>

// A-1
hexgrid(-1,3)
piece_coordlist([[[0,0]]]);
piece_coordlist([
    [[0,1]], [[2,0]]
]);

// A-3.1
hexgrid(1,3)
piece_coordlist([
    [[0,2]], [[2,1]], [[4,0]]
]);
// A-3.2
hexgrid(4,0)
piece_coordlist([
    [[0,2]], [[2,1]], [[3,2]]
]);

// A-3.3
hexgrid(1,1)
piece_coordlist([
    [[0,1]], [[2,0]], [[1,2]]
]);

// D-1 (lateral brick)
hexgrid(4,-1)
piece_coordlist([[[0,0],[2,0]]]);

// A-1 (no studs)
hexgrid(6,4)
piece_coordlist([[[0,0]]],[]);

hexgrid(0,4)
piece_coordlist([[[0,0]],[[-1,2]]],[]);

// A-3.2, two studs
hexgrid(0,5)
piece_coordlist([
    [[0,2]], [[2,1]], [[4,0]]
], [[[0,2]], [[4,0]]]);
