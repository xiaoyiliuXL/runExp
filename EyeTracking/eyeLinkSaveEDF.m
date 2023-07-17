function eyeLinkSaveEDF(fileDir, filename)
% ----------------------------------------------------------------------
% eyeLinkSaveEDF(fileDir, filename)
% ----------------------------------------------------------------------
% Goal of the function :
% Save edf file to folder
% ----------------------------------------------------------------------
% Input(s) :
% fileDir = folder to which the edf file is saved
% filename = name of the edf file
% ----------------------------------------------------------------------
% Output(s):
% None
% ----------------------------------------------------------------------
% Function created by Xiaoyi LIU (xiaoyi.x.liu@gmail.com)
% Last update : May 2023
% ----------------------------------------------------------------------

    fprintf('Receiving data file ''%s''\n', filename);
    status = Eyelink('ReceiveFile');
    if status > 0
        fprintf('ReceiveFile status %d\n', status);
    end
    WaitSecs(1.0);

    % move EDF file to subfolder / clean-up
    fprintf('Moving edf file to subfolder ''%s''...\n', fileDir);

    try
        [mvEDFsuccess, mvEDFmessage, mvEDFmessID] = movefile(filename, fileDir);
        if ~mvEDFsuccess
            warning(mvEDFmessID, mvEDFmessage);
        end
    catch
        fprintf('Failed.\n');
    end
    fprintf('Done.\n');
    Eyelink('Shutdown');
end