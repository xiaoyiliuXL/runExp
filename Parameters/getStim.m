function Params = getStim(Params)

    load('stimCell.mat');

    if Params.cond.isEnglish == 1
        stimCell = stimCell.english;
    else
        stimCell = stimCell.arabic;
    end

    Params.stim.numCell = squeeze(stimCell(:,:,1));
    wordCell = squeeze(stimCell(:,:,2));
    probeCell = squeeze(stimCell(:,:,3));

    Params.cond.nWord = Params.trials.nRepPerCond * Params.cond.nSide * Params.cond.nPreview;
    if Params.exp.isPractice
        Params.stim.wordCell = wordCell((end-Params.cond.nWord+1):end, :);
        Params.stim.probeCell = probeCell((end-Params.cond.nWord+1):end, :);
    else
        Params.stim.wordCell = wordCell(1:Params.cond.nWord, :);
        Params.stim.probeCell = probeCell(1:Params.cond.nWord, :);
    end

end