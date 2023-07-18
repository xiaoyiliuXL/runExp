function Params = triggerParams(Params)
    triggers = struct;

    %(triggers for the eye tracker)
    % start and stop recording
    triggers.TC_START_EXPERIMENT = 205; 
    triggers.TC_END_EXPERIMENT = 206;
    % resting state
    triggers.TC_RESTING_STATE_START = 207;
    triggers.TC_RESTING_STATE_END = 208;

    % within a trial
    triggers.TC_TRIAL_START = 11; 
    triggers.TC_TRIAL_END = 12;

    triggers.TC_CONDITION = 9;
    % 1-forward, hi SF, left
    % 2-forward, hi SF, right
    % 3-forward, lo SF, left
    % 4-forward, lo SF, right
    % 5-backward, hi SF, left
    % 6-backward, hi SF, right
    % 7-backward, lo SF, left
    % 8-backward, lo SF, right


    triggers.TCT_FIXATION = 110;
    triggers.TCT_TARGCUE = 120;
    triggers.TCT_SACCCUE = 130;
    triggers.TCT_SACCON = 140;
    triggers.TCT_SACCOFF = 150;
    triggers.TCT_TARGON = 160;
    triggers.TCT_RESPONSECUE_ONSET = 170;

    triggers.TC_RESPONSE = 229;
    triggers.TC_SACOKAY = 219;

    % get the RGB color
    names = fieldnames(triggers);
    for i = 1:length(names)
        curr_field = cell2mat(names(i));
        curr_col = getRGB(getfield(triggers, curr_field));

        col_fieldname = sprintf('%s_COL', curr_field);
        triggers.(col_fieldname) = curr_col;
    end

    % trigger rect for eeg
    triggers.trigRect = [0 0 1 1];

    Params.triggers = triggers;
end