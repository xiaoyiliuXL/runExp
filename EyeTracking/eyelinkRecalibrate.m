function eyelinkRecalibrate(Params)
% ----------------------------------------------------------------------
% eyelinkRecalibrate(Params)
% ----------------------------------------------------------------------
% Goal of the function :
% Recalibration during experiment
% ----------------------------------------------------------------------
% Input(s) :
% Params
% ----------------------------------------------------------------------
% Output(s):
% none
% ----------------------------------------------------------------------
% Function created by Xiaoyi LIU (xiaoyi.x.liu@gmail.com)
% Last update : July 2021
% Project :     Eyelink toolbox
% Version :     1.0
% ----------------------------------------------------------------------
    el = Params.el;
    
    Eyelink('StopRecording');
    WaitSecs(0.5);
    EyelinkEnterSetup(el);

    % count down to enter experiment
    for countdownSecs = 2 : -1 : 1
        Screen('FillRect', Params.scr.win, Params.scr.bgcolor);
        DrawFormattedText(Params.scr.win, ...
            sprintf('The experiment continues in %d seconds...', countdownSecs),...
            'center', 'center', Params.scr.fgcolor,[],[],[],Params.scr.TextvSpacing);             
        Screen('Flip', Params.scr.win);
        WaitSecs(.950);
    end
    Screen('FillRect', Params.scr.win, Params.scr.bgcolor); WaitSecs(0.05);
    
return
