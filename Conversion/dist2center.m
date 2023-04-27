function dist = dist2center(xCenter, yCenter, x, y)
% ----------------------------------------------------------------------
% [dist] = dist2center(xCenter, yCenter, x, y)
% ----------------------------------------------------------------------
% Goal of the function :
% Compute the distance between 2 points
% ----------------------------------------------------------------------
% Input(s) :
% x, y = cardinal locations of the points          
% ----------------------------------------------------------------------
% Output(s):
% dist = distance in between
% ----------------------------------------------------------------------
% Function created by Xiaoyi Liu (xiaoyi.x.liu@gmail.com)
% Last edit : March 2023
% Project : All
% Version : 1.0
% ----------------------------------------------------------------------

    dist2 = (x-xCenter)^2 + (y-yCenter)^2;
    dist = dist2^0.5;

end