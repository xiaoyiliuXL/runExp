function [x,y] = convertToQuadrant(position, displaySize, quad)
% ----------------------------------------------------------------------
% [x,y] = convertToQuadrant(position, displaySize, quad)
% ----------------------------------------------------------------------
% Goal of the function :
% Scale an x,y position into a specific quadrant of the screen
% ----------------------------------------------------------------------
% Input(s) :
% position: [x, y] locaiton of the stimulus
% displaySize: size of the display
% quad: 1-top left; 2-top right; 3-bottom left; 4-bottom-right
% ----------------------------------------------------------------------
% Output(s):
% x, y: position of the new sitmulus in the quadrant
% ----------------------------------------------------------------------
% Function created by ?
% Last update : July 2021
% Project :     vpixx
% Version :     1.0
% ----------------------------------------------------------------------

scale = 0.5;

switch quad
    case 1; xOffset = 0; yOffset = 0;                                       % top-left
    case 2; xOffset = displaySize(3)/2; yOffset = 0;                        % top-right
    case 3; xOffset = 0; yOffset = displaySize(4)/2;                        % bottom-left
    case 4; xOffset = displaySize(3)/2; yOffset = displaySize(4)/2;         % bottom-right
end
    
x = (position(1)*scale)+xOffset;
y = (position(2)*scale)+yOffset;

end