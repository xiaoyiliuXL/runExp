function newVal = scaleVals(oriVal,oriMinMax,newMinMax)
% -------------------------------------------------------------------------
% mirrorLoc(oldLoc,fix,newLoc)
% -------------------------------------------------------------------------
% Goal of the function :
% Locate the position of a value (oriVal) in a range (oriRange) in a 
% new range (newRange).
% -------------------------------------------------------------------------
% Input(s) :
% oldVal = Nx1 vector with values to be scaled                 e.g. 5
% oriMinMax = original range (1x2)                             e.g. [1, 10]     
% newMinMax = new range (1x2)                                  e.g. [11,20]
% -------------------------------------------------------------------------
% Output(s):
% newVal = scaled value
% -------------------------------------------------------------------------
% Function created by Nina HANNING (hanning.nina@gmail.com)
% Last edit : 2020-11-06
% Project : -
% Version : -
% -------------------------------------------------------------------------

if size(oriMinMax,1) ~= 1 || size(oriMinMax,1) ~= size(newMinMax,1)
    msg = 'Wrong dimension of oriRange and/or newRange.';
    error(msg);
end

oriRange = linspace(oriMinMax(1),oriMinMax(2),10000);
newRange = linspace(newMinMax(1),newMinMax(2),10000);

newVal = nan(size(oriVal));
for idx = 1:numel(oriVal)
    leftFlag = 0;
    rightFlag = 0;
    
    if ~isnan(oriVal(idx))
        
        % potentilly flip values out of range
        if oriVal(idx) < oriMinMax(1)
            curr_val = mirrorLoc(oriVal(idx),oriMinMax(1));
            leftFlag = 1;
        elseif oriVal(idx) > oriMinMax(2)
            curr_val = mirrorLoc(oriVal(idx),oriMinMax(2));
            rightFlag = 1;
        else
            curr_val = oriVal(idx);
        end
        
        [~,pos] = min(abs(oriRange-curr_val));  % locate value in old range
        curr_newVal = newRange(pos);            % find located position in new range
        
        
        % potentilly flip balck values out of range
        if leftFlag
            newVal(idx) = mirrorLoc(curr_newVal,newMinMax(1));
        elseif rightFlag
            newVal(idx) = mirrorLoc(curr_newVal,newMinMax(2));
        else
            newVal(idx) = curr_newVal;
        end
        
    end
end

end