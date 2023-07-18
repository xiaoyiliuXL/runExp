%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Columns of the "TrialSeq_..." variable will be
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% 1-saccade location % 1:left; 4:right
% 2-attended location % 2,3,6,5
% 3-remap location %
% 4-remap type % 0:backward; 1:forward
% 5-control location
% 6-gab tilt direction % -1:left; 1:right
% 7-gab spatial frequency


function Params = makeExpConditions(Params)

    exp = Params.exp;
    cond = Params.cond;
    trials = Params.trials;
    stim = Params.stim;
    times = Params.times;

    % 1- saccade location % 1:left; 4:right
    saccLoc_temp = [1, 4]; 
    saccLoc = reshape(repmat(saccLoc_temp', trials.nTrial/cond.nTargLoc/cond.nSaccDir, cond.nTargLoc)', trials.nTrial, 1);

    % 2-attended location % 2,3,6,5
    attendedLoc_temp = [2, 3, 6, 5];
    attendedLoc = repmat(attendedLoc_temp', trials.nTrial/cond.nTargLoc, 1);

    % 3-remap location
    remapLoc_temp = [3, 2, 5, 6];
    remapLoc = repmat(remapLoc_temp', trials.nTrial/cond.nTargLoc, 1);

    % 4-remap type % 0:backward; 1:forward
    remapType = mod(attendedLoc, 2) == mod(saccLoc, 2);

    % 5-control location
    controlLoc_temp = [6, 6, 2, 2, 5, 5, 1, 1];
    controlLoc = repmat(controlLoc_temp', trials.nTrial/cond.nTargLoc/cond.nSaccDir, 1);

    % 6-gab tilt direction % -1:left; 1:right
    tilt_temp = [-1, 1];
    tile = reshape(repmat(tilt_temp', 1, trials.nTrial/2)', trials.nTrial, 1);

    % 7-gab spatial frequency
    sf = reshape(repmat(stim.gabSF', 2, trials.nTrial/4)', trials.nTrial, 1);

    %
    Params.trials.TrialSeq_sorted = [saccLoc, attendedLoc, remapLoc, remapType, controlLoc, tile, sf];
    Params.trials.TrialSeq_shuf = Params.trials.TrialSeq_sorted(randperm(trials.nTrial),:);
    
end