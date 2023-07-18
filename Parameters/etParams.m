function Params = etParams(Params)
    et = struct;

    % ET sampling rate
    et.ELsamplingrate = 1000;
    if Params.exp.useET && et.ELsamplingrate ~= 1000
        error('Eye tracker sampling rate has to be 1000 Hz for current saccade detection thresholds!');
    end

    % Gaze detection
    et.sacDetectThreshDeg = .18;  % if 2 consecutive samples are 0.15 degree away from away, that's a saccade
    et.sacDetectThreshPix = deg2pix(Params.scr, et.sacDetectThreshDeg);

    et.sacEndThreshDeg = 0.18; % not used in this experiment...
    et.sacEndThreshPix = deg2pix(Params.scr, et.sacEndThreshDeg);

    et.sacEndDistTolDeg = 1.2;
    et.sacEndDistTolPix = deg2pix(Params.scr, et.sacEndDistTolDeg);
    
    et.fixDistTolDeg = 1.5; % during target fixation, gaze should be within 1.5 deg away from the target center
    et.fixDistTolPix = deg2pix(Params.scr, et.fixDistTolDeg);

    et.sacEndDisTolFactor_dimension = 0.5; % for determining saccade direction
    et.sacEndDisTolDeg_dimension = Params.stim.eccDeg * et.sacEndDisTolFactor_dimension;
    et.sacEndDisTolPix_dimension = deg2pix(Params.scr, et.sacEndDisTolDeg_dimension);

    
    % Calibration and validation locations
    angle = 0:pi/3:5/3*pi;

    % compute calibration target locations
    [cx1,cy1] = pol2cart(angle,0.8);                           
    [cx2,cy2] = pol2cart(angle+(pi/6),0.45);
    cx = round(Params.scr.centx + Params.scr.centx*[0 cx1 cx2]);
    cy = round(Params.scr.centy + Params.scr.centy*[0 cy1 cy2]);

    % order for eyelink
    et.c = [cx(1), cy(1),...   % 1.  center center
        cx(9), cy(9),...   % 2.  center up
        cx(13),cy(13),...  % 3.  center down
        cx(5), cy(5),...   % 4.  left center
        cx(2), cy(2),...   % 5.  right center
        cx(4), cy(4),...   % 6.  left up
        cx(3), cy(3),...   % 7.  right up
        cx(6), cy(6),...   % 8.  left down
        cx(7), cy(7),...   % 9.  right down
        cx(10),cy(10),...  % 10. left up
        cx(8), cy(8),...   % 11. right up
        cx(11),cy(11),...  % 12. left down
        cx(12),cy(12)];    % 13. right down

    % compute validation target locations (ca libration targets smaller radius)
    [vx1,vy1] = pol2cart(angle,0.60);
    [vx2,vy2] = pol2cart(angle+pi/6,0.35);

    vx = round(Params.scr.centx + Params.scr.centx*[0 vx1 vx2]);
    vy = round(Params.scr.centy + Params.scr.centy*[0 vy1 vy2]);

    % order for eyelink
    % order for eyelink
    et.v = [vx(1), vy(1),...   % 1.  center center
        vx(9), vy(9),...   % 2.  center up
        vx(13),vy(13),...  % 3.  center down
        vx(5), vy(5),...   % 4.  left center
        vx(2), vy(2),...   % 5.  right center
        vx(4), vy(4),...   % 6.  left up
        vx(3), vy(3),...   % 7.  right up
        vx(6), vy(6),...   % 8.  left down
        vx(7), vy(7),...   % 9.  right down
        vx(10),vy(10),...  % 10. left up
        vx(8), vy(8),...   % 11. right up
        vx(11),vy(11),...  % 12. left down
        vx(12),vy(12)];    % 13. right down
    
    Params.et = et;
end