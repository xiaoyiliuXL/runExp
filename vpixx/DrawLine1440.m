function DrawLine1440(win, rect, x1, y1, x2, y2, lineWidth, rr, stimLum, stimContrast)

% Generate 12 frames of line at 1440 Hz
%
% win = screen window
% rect = screen rect (pixel size)
% x, y = the beginning and end locations of the line 
% lineWidth = in pixel
% stimLum = 12 luminance values

if nargin < 10, stimContrast = repelem(1, 1, 12); end
if nargin < 9, stimLum = 1; end
if nargin < 8, rr = 1440; end

i_contrast = 1;

if rr ~= 120
    for i_color = 1:3
    
        if rr == 1440
            blendIdx = [0 0 0 0];
            blendIdx(i_color) = 1;
            Screen('BlendFunction', win, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, blendIdx);
    
            color = i_color;
            
        elseif rr == 480
            color = 1:3;
        end
    
        for i_quad = 1:4
            [x1, y1] = convertToQuadrant([x1, y1], rect, i_quad);
            [x2, y2] = convertToQuadrant([x2, y2], rect, i_quad);
    
            stimColor = [0 0 0];
            stimColor(color) = stimContrast(i_contrast) * stimLum * 255;
    
            Screen('DrawLine', win, stimColor, x1, y1, x2, y2, lineWidth);
    
            i_contrast = i_contrast + 1;
    
        end
    
        if rr == 480
            break
        end
    
    end
else
    Screen('DrawLine', win, stimLum, x1, y1, x2, y2, lineWidth);
end
end