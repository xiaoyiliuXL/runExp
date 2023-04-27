function DrawGabor1440(win, rect, gaborMat, stimRect, stimLoc, contrast)
% Generate 12 frames of gabor at 1440 Hz
%
% win = screen window
% rect = screen rect (pixel size)
% gaborMat = gabor matrix
% stimRect 
% stimLoc = the center (x, y) of the gabor
% contrast = 12 contrast values

i_contrast = 1;

for i_color = 1:3

    blendIdx = [0 0 0 0];
    blendIdx(i_color) = 1;
    Screen('BlendFunction', win, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, blendIdx);

    for i_quad = 1:4
        [x, y] = convertToQuadrant(stimLoc, rect, i_quad);
        stimRectQuad = CenterRectOnPoint(stimRect, x, y);

%         stimColor = [0 0 0];
%         stimColor(i_color) = contrast(i_contrast) * 255;
% 
%         Screen('FillOval', win, stimColor, stimRectQuad);
%         i_contrast = i_contrast + 1;

        % gabor contrast
        curr_contrast = contrast(i_contrast);
        colgaborMat = mkColGabor(gaborMat, curr_contrast, i_color);

        colgaborTex = Screen('MakeTexture', win, colgaborMat);
        Screen('DrawTexture', win, colgaborTex, [], stimRectQuad);

        i_contrast = i_contrast + 1;

    end

end

end