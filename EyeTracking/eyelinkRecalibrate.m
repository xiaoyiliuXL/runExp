function eyelinkRecalibrate(Params)
    el = Params.el;
    
    Eyelink('StopRecording');
    WaitSecs(0.5);
    EyelinkEnterSetup(el);

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
