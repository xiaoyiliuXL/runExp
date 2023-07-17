function [tex_rect,dest_rect] = DrawFlicker(Params, stimRect, stimLoc, texture)
% ----------------------------------------------------------------------
% [tex_rect,dest_rect] = DrawFlicker(Params, stimRect, stimLoc, texture)
% ----------------------------------------------------------------------
% Goal of the function :
% Draw a texture in an offscreen window, at the first quadrant;
% Create destimation rect in all four quadrants
% ----------------------------------------------------------------------
% Input(s) :
% Params
% stimRect: [0 0 x y]; x, y are the size of the rect
% stimLoc: x, y position of the stimulus
% texture: MakeTexture
% ----------------------------------------------------------------------
% Output(s):
% x, y: position of the new sitmulus in the quadrant
% ----------------------------------------------------------------------
% Function created by Xiaoyi LIU (xiaoyi.x.liu@gmail.com)
% Last update : July 2023
% Project :     vpixx
% Version :     1.0
% ----------------------------------------------------------------------

    %% texture rect (a white rect of bigger size as the gabor)
    tex_rect = Screen('OpenOffscreenwindow', Params.scr.win, [Params.scr.bgcolor Params.scr.bgcolor Params.scr.bgcolor 0], [0 0 stimRect(3) stimRect(4)]);
    Screen('DrawTexture', tex_rect, texture);
%     Screen('FillRect', tex_rect, [255 255 255]); 
% 
%     %% transparency mask (a luminance + alpha matrix of 2 layers)
%     transLayer = 2;
%     mx = round(stimRect(3)) / 2;
%     my = round(stimRect(4)) / 2;
%     [x,y] = meshgrid(-mx:mx, -my:my);
%     % layer 1: filled with the luminance value of the bg
%     maskblob = uint8(ones(2*my+1, 2*mx+1, transLayer) * Params.scr.bgcolor);
%     % layer 2: filled with gaussian transparency mask
%     xsd = mx/1.2; %bigger than 1.2, more concentrated blob, less smoothing area
%     ysd = my/1.2;
%     maskblob(:,:,transLayer) = uint8(round(255 - exp(-((x/xsd).^2)-((y/ysd).^2))*255));
%     trans_mask = Screen('MakeTexture', Params.scr.win, maskblob);

    %% destination rect (in the 4 quandrants)
    dest_rect = nan(4, 4);
    for i_quad = 1:4
        [x, y] = convertToQuadrant(stimLoc, Params.scr.screenRect, i_quad);
        stimRectQuad = CenterRectOnPoint(stimRect, x, y);
        dest_rect(i_quad, 1:4) = stimRectQuad;
    end
    dest_rect = dest_rect';

    end