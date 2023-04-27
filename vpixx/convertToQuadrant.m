function [x,y] = convertToQuadrant(position, displaySize, quad)
%This scales an x, y position into a specific quadrant of the screen    
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