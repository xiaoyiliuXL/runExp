function Params = initEyelink(Params)

    if Params.exp.useET

        EyelinkInit(Params.exp.dummyMode);
        el = EyelinkInitDefaults(Params.scr.win);

        % calibration background
        el.backgroundcolour = 128;
        el.foregroundcolour = 250; el.msgfontcolour = 250; el.imgtitlecolour = 250; el.targetbeep = 0;

        EyelinkUpdateDefaults(el);

        Eyelink('Command', 'set_idle_mode'); % ensure smooth transition
        WaitSecs(0.05); 

        % Set-up datafile -----------------------------------------------------
        if ~Params.exp.isPractice, Eyelink('Openfile', Params.output.eyefilename); end
        Eyelink('command', sprintf('add_file_preamble_text ''Recorded by EyelinkToolbox, Preview Effect: Performance Field, %s, subjno: %02d''', Params.exp.dateString, Params.subj.subjno));
        WaitSecs(0.05);
        Eyelink('message', 'subjno %02d', Params.subj.subjno);
        WaitSecs(0.05);
        Eyelink('message', 'DATE %s', Params.exp.dateString);
        WaitSecs(0.05);

        % Set-up screen resolution ---------------------------------------------
        Eyelink('command', 'screen_pixel_coords = %ld %ld %ld %ld', 0, 0, Params.scr.resx - 1, Params.scr.resy - 1);

        % Calibration settings
        Eyelink('command', 'calibration_type = HV13');
        Eyelink('command', 'generate_default_targets = NO');
        Eyelink('command', 'randomize_calibration_order 1');
        Eyelink('command', 'randomize_validation_order 1');
        Eyelink('command', 'cal_repeat_first_target 1');
        Eyelink('command', 'val_repeat_first_target 1');
        Eyelink('command', 'enable_automatic_calibration = YES');

        Eyelink('command', 'calibration_samples=14');
        Eyelink('command', 'calibration_sequence=0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12');
        Eyelink('command', sprintf('calibration_targets = %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i', Params.et.c));

        Eyelink('command', 'validation_samples=14');
        Eyelink('command', 'validation_sequence=0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12');
        Eyelink('command', sprintf('validation_targets = %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i %i,%i', Params.et.v));

        % has to be executed after calibration targets were specified:
        Eyelink('message', 'DISPLAY_COORDS %ld %ld %ld %ld', 0, 0, Params.scr.resx-1, Params.scr.resy-1);

        % only do monocular recording
        Eyelink('command', 'binocular_enabled = NO'); WaitSecs(0.05);

        % we want pupil area, not diameter
        Eyelink('command', 'pupil_size_diameter = NO'); WaitSecs(0.05);

        % Set sampling rate ---------------------------------------------------
        Eyelink('command', 'sample_rate = %d', Params.et.ELsamplingrate); WaitSecs(0.05);

        % Set movement thresholds (conservative) ------------------------------
        Eyelink('command', 'saccade_velocity_threshold = 35'); WaitSecs(0.05);
        Eyelink('command', 'saccade_acceleration_threshold = 9500'); WaitSecs(0.05);

        % Get tracker and software versions -----------------------------------
        [v, el.version] = Eyelink('GetTrackerVersion');
        fprintf('Running experiment on a ''%s'' tracker.\n', el.version);

        % Link to edf data ----------------------------------------------------
        Eyelink('command', 'file_event_filter = LEFT,RIGHT,FIXATION,SACCADE,BLINK,MESSAGE,BUTTON,INPUT');
        WaitSecs(0.05);
        Eyelink('command', 'file_sample_data  = LEFT,RIGHT,GAZE,HREF,AREA,GAZERES,STATUS,INPUT,HTARGET');
        WaitSecs(0.05);

        % Link data to Matlab -------------------------------------------------
        Eyelink('command', 'link_event_filter = LEFT,RIGHT,FIXATION,SACCADE,BLINK,MESSAGE,BUTTON,FIXUPDATE,INPUT');
        WaitSecs(0.05);
        Eyelink('command', 'link_sample_data  = LEFT,RIGHT,GAZE,GAZERES,AREA,STATUS,INPUT,HTARGET');
        WaitSecs(0.05);
        Eyelink('command', 'link_event_data = GAZE,GAZERES,HREF,AREA,VELOCITY');
        WaitSecs(0.05);

        Eyelink('command', 'heuristic_filter = %d', 2); WaitSecs(0.05); % 2 samples delay are added to link data
        Eyelink('command', 'set_idle_mode'); WaitSecs(0.05);

    else
        el.f1 = Params.keys.F1Key;
        el.f10 = Params.keys.F10Key;
    end

    Params.el = el;

end