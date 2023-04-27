function [vaDeg]= pix2vaDeg (pix,scr,nVal)
% ----------------------------------------------------------------------
% [vaDeg]= pix2vaDeg (pix,scr,nVal)
% ----------------------------------------------------------------------
% Goal of the function :
% Convert pixel in visual angle
% ----------------------------------------------------------------------
% Input(s) :
% pix : size in pixel
% scr : screen configuration
% nVal : number of output arguments; 2 returns x and y value
% ----------------------------------------------------------------------
% Output(s):
% vaDeg = size in visual angle (degree)
% ----------------------------------------------------------------------
% Function created by by Nina HANNING (hanning.nina@gmail.com)
% based on a template by Martin SZINTE (martin.szinte@gmail.com)
% Last update : 29 / 01 / 2017
% Project : -
% Version : -
% ----------------------------------------------------------------------

if nargin < 3
    nVal = 1;
end

[cmX,cmY]=pix2cm(pix,scr);
[vaDeg] = cm2vaDeg([cmX,cmY],scr);

if nVal == 1
    vaDeg = vaDeg(:,1);
end
end
