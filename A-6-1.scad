// This file implements the so-called "useful" 4-stud bricks

include <hexbrick-lib.scad>

// A-6-1-1 (bar)
hexgrid(0,0)
piece_punctual([[0,0], [1,1], [2,2], [3,3]]);
hexgrid(-2,1)
piece_punctual([[0,0], [1,1], [2,2], [3,3]]);
hexgrid(-4,2)
piece_punctual([[0,0], [1,1], [2,2], [3,3]]);

// A-6-1-2 (fan)
hexgrid(4,1)
piece_punctual([[0,0], [1,1], [3,0], [0,3]]);
hexgrid(6,-3)
piece_punctual([[0,0], [1,1], [3,0], [0,3]]);

// A-6-1-3 (diamond)
hexgrid(2,-2)
piece_punctual([[0,1], [2,0], [3,1], [1,2]]);
hexgrid(8,-2)
piece_punctual([[0,1], [2,0], [3,1], [1,2]]);
