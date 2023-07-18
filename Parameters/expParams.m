function Params = expParams()
    Params = struct;
    
    %% TIME
    Params.times.fixDur = 1;

    Params.times.targCueDurMin = 1;
    Params.times.targCueDurMax = 1.5;
    Params.times.targDelayMin = 0;
    Params.times.targDelayMax = 1.6
    Params.times.targDur = 0.05;

    Params.times.postSaccDur = 0.3;

    Params.times.itiDur = 2;
    
    Params.times.max_RTsac = 1.2;
    Params.times.min_RTsac = 0.05;
    Params.times.max_sacDur = 0.1;
    Params.times.saccDur = 1.8;

    %% STIMULI
    Params.stim.fixSizeDeg = 0.25; %diameter (the size of the central fixation dot)
    Params.stim.fixLineLengthDeg = 0.25;
    Params.stim.fixLineWidthDeg = 0.1;
    Params.stim.fc_deg = 1.5; %radial (gaze must be within XXX visual degree from the center)

    Params.stim.eccDeg = 8;
    Params.stim.gabSizeDeg = 1.5; % gab size in diameter!
    Params.stim.gabNum = 6;
    angles = linspace(0, 2*pi, Params.stim.gabNum+1); 
    Params.stim.angles = angles(1:Params.stim.gabNum);

    Params.stim.saccTargFreq = 50;
    Params.stim.attendedFreq = 60;
    Params.stim.remappingFreq = 70;
    Params.stim.controlFreq = 80;

    Params.stim.gabStd = Params.stim.gabSizeDeg/4;
    Params.stim.gabSF = [3, 8];
    Params.stim.gabTilt = 15;
    Params.stim.gabOri = [-1, 1];

    %% CONDITION
    Params.cond.nTargLoc = 4;
    Params.cond.nSaccDir = 2;
    Params.cond.nRemap = 2;
    Params.cond.gabOri = Params.stim.gabOri;
    Params.cond.nGabOri = length(Params.cond.gabOri);
    Params.cond.gabSF = Params.stim.gabSF;
    Params.cond,nGabSF = length(Params.cond.gabSF);

end