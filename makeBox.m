function box = makeBox(x,y,r)
% ----------------------------------------------------------------------
% box = makeBox(x,y,r)
% ----------------------------------------------------------------------
% Goal of the function :
% Make a square rect with xy in the center
% ----------------------------------------------------------------------
% Input(s) :
% x, y = cardinal locations of the points
% r = 'radius' (half-height) of the box       
% ----------------------------------------------------------------------
% Output(s):
% box = the cardinal position of the box     e.g., box = [0 0 4 4]
% ----------------------------------------------------------------------
% Function created by Xiaoyi Liu (xiaoyi.x.liu@gmail.com)
% Last edit : March 2023
% Project : All
% Version : 1.0
% ----------------------------------------------------------------------

box = [x-r, y-r, x+r, y+r];

end