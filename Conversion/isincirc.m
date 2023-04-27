function isin = isincirc(myPos,tarPos,pix)
% ----------------------------------------------------------------------
% isin = isincirc(myPos,tarPos,pix)(const,sub,eyeana)
% ----------------------------------------------------------------------
% Goal of the function :
% Check if myPos is within pix of tarPos
% ----------------------------------------------------------------------
% Input(s) :
% myPos : [x,y]*n of to be checked position
% tarPos : [x,y]*n of target position
% pix : required radius (in pix)
% ----------------------------------------------------------------------
% Output(s):
% isin : 1 if yes, 0 of not
% ----------------------------------------------------------------------
% Function created by Nina HANNING (hanning.nina@gmail.com)
% Last update : 2022-01-22
% Project : -
% Version : -
% ----------------------------------------------------------------------

if size(myPos) ~= size(tarPos)
    tarPos = repmat(tarPos,size(myPos,1),1);
end

isin = nan(size(myPos,1),1);
for i = 1:size(myPos,1)
    if sqrt((myPos(i,1)-tarPos(i,1))^2+(myPos(i,2)-tarPos(i,2))^2) < pix
        isin(i,1) = 1;
    else
        isin(i,1) = 0;
    end
end
