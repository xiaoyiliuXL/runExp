function Params = scrParams(Params)
    
    scr = struct;

    scr.viewdist = 65;
    scr.refreshrate = 120;
    scr.txtSize = 18; scr.TextvSpacing = 1.5;

    newPriority = 1; % 0 low, 1 higher, 2 highest but not desired, see help
    oldPriority = Priority(newPriority); % set the executive priority of the current script

    scr.screenNumber = max(Screen('Screens'));
    skipsyncTestInput = 1;
    % Setting this preference to 1 suppresses the printout of warnings.
    Screen('Preference', 'SkipSyncTests', skipsyncTestInput);
    AssertOpenGL;

    scr.ScreenResolution = Screen('Resolution', scr.screenNumber);
    
    % Check if the refresh rate is 120
    if ~Params.exp.TEST_RUN
        if scr.ScreenResolution.hz ~= scr.refreshrate
            error('Screen refresh rate should be 120 Hz, but PTB reports %f!', scr.ScreenResolution.hz);
        end
    end
    
    [scr.win, scr.screenRect] = Screen('OpenWindow', scr.screenNumber, 0);
%     [scr.mmx, scr.mmy] = Screen('DisplaySize', scr.screenNumber);
    scr.mmx = 650;
    scr.mmy = 410
    scr.resx = scr.screenRect(3); scr.resy = scr.screenRect(4);
    
    % check conversion for px to mm
    scr.cmx = scr.mmx/10;
    scr.cmy = scr.mmy/10;
    scr.centx = .5*scr.screenRect(3); 
    scr.centy = .5*scr.screenRect(4); 

    scr.CmToPixX = (scr.screenRect(3)/scr.cmx); 
    scr.CmToPixY = (scr.screenRect(4)/scr.cmy); 
    scr.CmToPix = mean([scr.CmToPixX, scr.CmToPixY]);

    % flip interval
    scr.FlpInt = Screen('GetFlipInterval', scr.win);
    scr.FrmPerSec = Screen('FrameRate',scr.win);
    
    % colors
    scr.black = BlackIndex(scr.win);
    scr.white = WhiteIndex(scr.win);
    scr.red = [255 0 0];
    scr.green = [0 128 0];
    scr.bgcolor = scr.black;
    scr.fgcolor = scr.white;

    scr.fixcolor = scr.white;
    scr.cuecolor = scr.red;
    scr.promptcolor = 60;

    scr.nQuad = 4;
    scr.nCol = 3;
    scr.srate = scr.refreshrate * scr.nQuad * scr.nCol;
    for i_quad = 1:scr.nQuad
        [scr.quadCentx(i_quad), scr.quadCenty(i_quad)] = convertToQuadrant([scr.centx, scr.centy], scr.screenRect, i_quad);
    end

    scr.q_rects(1, :) = [0 0 scr.resx/2 scr.resy/2];
    scr.q_rects(2, :) = [scr.resx/2 0 scr.resx scr.resy/2]; 
    scr.q_rects(3, :) = [0 scr.resy/2 scr.resx/2 scr.resy]; 
    scr.q_rects(4, :) = [scr.resx/2 scr.resy/2 scr.resx scr.resy];
    

    % finally...
    Screen('BlendFunction', scr.win, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    HideCursor;
    ListenChar(0);
    LoadPsychHID;

    % for vpixx
    Datapixx('Close');
    Datapixx('Open');
    Datapixx('StopAllSchedules');
    Datapixx('RegWrRd');
    Datapixx('EnablePixelMode');
    Datapixx('RegWr');
    Datapixx('SetPropixxDlpSequenceProgram', 0);
    Datapixx('RegWrRd');
 

    Params.scr = scr;
end