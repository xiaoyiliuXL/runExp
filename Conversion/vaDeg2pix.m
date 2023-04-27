function [pix]= vaDeg2pix(vaDeg,scr,nVal)
% ----------------------------------------------------------------------
% [pix]= vaDeg2pix(vaDeg,scr,nVal)
% ----------------------------------------------------------------------
% Goal of the function :
% Convert visual angle (degree) in pixel ( x or x and y )
% ----------------------------------------------------------------------
% Input(s) :
% vaDeg : size in visual angle (deg)
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

cm = vaDeg2cm(vaDeg,scr);
[pix] = cm2pix(cm,scr,nVal);
end
