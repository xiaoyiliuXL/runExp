function DrawOval1440(win, rect, stimRect, stimLoc, rr, stimLum, stimContrast)

% Generate 12 frames of filled oval at 1440 Hz
%
% win = screen window
% rect = screen rect (pixel size)
% stimSize 
% stimLoc = the center (x, y) of the gabor
% stimLum = 0-1
% stimLum = 12 luminance values

if nargin < 7, stimContrast = repelem(1, 1, 12); end
if nargin < 6, stimLum = 1; end
if nargin < 5, rr = 1440; end

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
            for i_stim = 1:size(stimLoc, 1)
                position = stimLoc(i_stim, :);
                [x, y] = convertToQuadrant(position, rect, i_quad);
                stimRectQuad = CenterRectOnPoint(stimRect, x, y);
        
                stimColor = [0 0 0];
                stimColor(color) = stimContrast(i_contrast) * stimLum * 255;
        
                Screen('FillOval', win, stimColor, stimRectQuad);
        
                i_contrast = i_contrast + 1;
            end
        end
    
        if rr == 480
            break
        end
    
    end
else
    Screen('FillOval', win, stimLum, stimRect);
end

end