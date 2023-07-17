function [isFix, isBlink] = eyelinkCheckFix(Params, x, y, dist, allowBlink, everySample)
% -------------------------------------------------------------------------------------
% [isFix, isBlink] = eyelinkCheckFix(Params, x, y, dist, allowBlink, everySample)
% -------------------------------------------------------------------------------------
% Goal of the function :
% Check eye fixation within a boundary
% -------------------------------------------------------------------------------------
% Input(s) :
% Params = struct of experiment-related parameters
% x/y = x/y location of the fixation point
% dist = max distance allowed around the fixation point
% allowBlink = 1/0 (allow blinks during fixation or not). Default = 1
% everySample = 1/0 (check every sample (~1 ms) or every update (~5 ms)). Default = 0;
% -------------------------------------------------------------------------------------
% Output(s):
% isFix = 1/0 (fixated or not)
% isBlink = 1/0 (blink or not)
% -------------------------------------------------------------------------------------
% Function created by Xiaoyi LIU (xiaoyi.x.liu@gmail.com)
% Last update : May 2023
% -------------------------------------------------------------------------------------

    el = Params.el;
    scr = Params.scr;
    stim = Params.stim;

    if nargin < 2, x = scr.centx; end
    if nargin < 3, y = scr.centy; end
    if nargin < 4, dist = stim.fc_pixel; end
    if nargin < 5, allowBlink = 1; end
    if nargin < 6, everySample = 0; end

    isFix = 1;
    isBlink = 0;

    if ~everySample
        NextDataType = Eyelink('GetNextDataType');

        if ~allowBlink
            if NextDataType == el.STARTBLINK | NextDataType == el.ENDBLINK
                isFix = 0;
                isBlink = 1;
                return;
            end
        end

        if NextDataType == 9 % el.FIXUPDATE, usually comes every 50 ms!
            FixUpItem = Eyelink('GetFloatData', NextDataType); % make copys of the last
            curr_x = FixUpItem.gavx;
            curr_y = FixUpItem.gavy;

            % check distance from a center
            dist_center = distToCenter(curr_x, curr_y, x, y);
            if dist_center > dist
                isFix = 0;
            end
        end

    else

        newSample = Eyelink('NewestFloatSample');
        curr_x = newSample.gx(EyeChecked);
        curr_y = newSample.gy(EyeChecked);

        if curr_x~=el.MISSING_DATA & curr_y~=el.MISSING_DATA
            dist_center = distToCenter(curr_x, curr_y, x, y);

            if dist_center > dist
                isFix = 0;
            end
        else
            isFix = 0;
            isBlink = 1;
        end

    end
end