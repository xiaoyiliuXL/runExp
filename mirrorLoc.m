function newLoc = mirrorLoc(oldLoc,fixLoc)
% ----------------------------------------------------------------------
% mirrorLoc(oldLoc,fix,newLoc)
% ----------------------------------------------------------------------
% Goal of the function :
% Mirror a location.
% ----------------------------------------------------------------------
% Input(s) :
% oldLoc = location to be mirrored
% fixLoc = mirror fix location
% ----------------------------------------------------------------------
% Output(s):
% newLoc = new location (old Loc mirrored)
% ----------------------------------------------------------------------
% Function created by Nina HANNING (hanning.nina@gmail.com)
% Last edit : 2020-10-31
% Project : -
% Version : -
% ----------------------------------------------------------------------

if numel(oldLoc) ~= numel(fixLoc)
    fixLoc = repmat(fixLoc,size(oldLoc));
    %msg = 'Put one fix-value for each oldLoc-value.';
    %error(msg)
end

newLoc = nan(numel(oldLoc),1);
for i = 1:numel(oldLoc)
    if oldLoc(i,1) > fixLoc(i,1)
        newLoc(i,1) = fixLoc(i,1) - abs(oldLoc(i,1)-fixLoc(i,1));
    elseif oldLoc(i,1) <= fixLoc(i,1)
        newLoc(i,1) = fixLoc(i,1) + abs(oldLoc(i,1)-fixLoc(i,1));
    end
end

end
