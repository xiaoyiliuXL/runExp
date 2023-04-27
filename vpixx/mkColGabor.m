function colgaborMat = mkColGabor(gaborMat, contrast, i_color)
    % gabor contrast
    gaborMat = (gaborMat * contrast + 0.5) * 255;

    % add color to the gabor
    colgaborMat = nan([size(gaborMat), 3]);
    colgaborMat(:, :, i_color) = gaborMat;
    colgaborMat = uint8(colgaborMat);
end