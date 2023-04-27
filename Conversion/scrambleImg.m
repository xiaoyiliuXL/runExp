function scrambled_img = scrambleImg(intact_img)

% ----------------------------------------------------------------------
% scrambled_img = scrambleImg(intact_img)
% ----------------------------------------------------------------------
% Goal of the function :
% Make a phase scrambled version of image
% ----------------------------------------------------------------------
% Input(s) :
% intact_img = M * N matrix of an image
% ----------------------------------------------------------------------
% Output(s):
% scrambled_img = M * N matrix of the scrambled version
% ----------------------------------------------------------------------
% Function created by Xiaoyi Liu (xiaoyi.x.liu@gmail.com)
% Last edit : March 2023
% Project : All
% Version : 1.0
% ----------------------------------------------------------------------

    rng('default');
    StimSize = size(intact_img);

    % phase scrambling
    newim = uint8(intact_img);
    ImFourier = fft2(newim);
    Amp = abs(ImFourier);
    PhaseOrig = angle(ImFourier);
    % add random phase to original phase
    PhaseRandom = angle(fft2(rand(StimSize)));
    PhaseNew = PhaseOrig + PhaseRandom;
    % combine Amp and Phase then perform inverse Fourier
    ImScrambled = ifft2(Amp .* exp(sqrt(-1) * (PhaseNew)));

    ImScrambled_final = real(ImScrambled) .* 400;
    ImScrambled_final(ImScrambled_final < 0) = 0;
    scrambled_img = (ImScrambled_final .* 400) ./ max(max(ImScrambled_final));
    scrambled_img = uint8(scrambled_img);

end