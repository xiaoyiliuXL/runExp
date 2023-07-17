function DrawText1440(win, rect, text, TextvSpacing, stimLoc, rr, stimLum, stimContrast)

if nargin < 8, stimContrast = repelem(1, 1, 12); end
if nargin < 7, stimLum = 1; end
if nargin < 6, rr = 1440;end

[textSize] = Screen('TextBounds', win, text);

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
            [x, y] = convertToQuadrant(stimLoc, rect, i_quad);
    
            stimColor = [0 0 0];
            stimColor(color) = stimContrast(i_contrast) * stimLum * 255;
    
            DrawFormattedText(win, text, x-textSize(3)/2, y-textSize(4)/2, stimColor,[],[],[],TextvSpacing);
    
            i_contrast = i_contrast + 1;
    
        end
    
        if rr == 480
            break
        end
    
    end
else
    DrawFormattedText(win, text, stimLoc(1)-textSize(3)/2, stimLoc(2)-textSize(4)/2, stimLum,[],[],[],TextvSpacing);
end
end