function [pix] = cm2pix(cm,scr,nVal)
% ----------------------------------------------------------------------
% [pix] = cm2pix(cm,scr)
% ----------------------------------------------------------------------
% Goal of the function :
% Convert cm in pixel ( x or x and y )
% ----------------------------------------------------------------------
% Input(s) :
% cm : size in cm
% scr : screen configuration
% nVal : number of output arguments; 2 returns x and y value
% ----------------------------------------------------------------------
% Output(s):
% pix  = size in pixel ([x] or [xy])
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

pix_by_mmX = scr.resx/scr.mmx;
pix_by_mmY = scr.resy/scr.mmy;

if nVal == 2
    pixX = cm.*10.*pix_by_mmX;
    pixY = cm.*10.*pix_by_mmY;
    pix = [pixX,pixY];
else
    pix = cm.*10.*pix_by_mmX;
end

end