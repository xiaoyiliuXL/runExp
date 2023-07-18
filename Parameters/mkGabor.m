function gaborMat = mkGabor(Params, gaborOri)
    
    stim = Params.stim;
    results = Params.results;

    gaborSizeDeg = stim.gabSizeDeg;
    gaborSize = stim.gabSize;
    gaborStd = stim.gabStd;
    freq = results.sf;
    
    %% add a gabor of certain orientation
    [x,y]=meshgrid(1:gaborSize, 1:gaborSize);
    x = x-mean(x(:));
    y = y-mean(y(:));
    x = Scale(x)*gaborSizeDeg-gaborSizeDeg/2;
    y = Scale(y)*gaborSizeDeg-gaborSizeDeg/2;

    ori = gaborOri/180*pi;
    nx = x*cos(ori) + y*sin(ori);
    ny = x*cos(ori) - y*sin(ori);

    carrier      =cos(nx*freq*2*pi+0*2*pi);
    modulator    =exp(-((x/gaborStd).^2)-((y/gaborStd).^2));
    gabor        = carrier.*modulator;
    % gabor        = carrier.*modulator*contrast;
    
%     gaborMat = gabor + 0.5;
     
    [mask, ~] = mkMask(Params);
    gaborMat = gabor.*mask;
    % gaborMat = gabor.*mask + 0.5;
    
    % gaborMat = uint8(255*gaborMat);

    % % colored gabor
    % colgaborMat = nan([size(gaborMat), 3]);
    % colgaborMat(:, :, i_color) = gaborMat;
    % colgaborMat = uint8(colgaborMat);

end