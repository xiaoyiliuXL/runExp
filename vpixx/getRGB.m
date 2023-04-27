
function col = getRGB(trig)
% ----------------------------------------------------------------------
% col = getRGB(trig)
% ----------------------------------------------------------------------
% Goal of the function :
% Convert trigger codes to Viewpixx codes
% ----------------------------------------------------------------------
% Input(s) :
% trig = 1-255    
% ----------------------------------------------------------------------
% Output(s):
% col = RGB color             ex : col = [255 0 0]
% ----------------------------------------------------------------------
% Function created by Xiaoyi Liu (xiaoyi.x.liu@gmail.com)
% Last edit : March 2023
% Project : All
% Version : 1.0
% ----------------------------------------------------------------------

    % trigger codes
    triggerCodes = [ 4  0  0; ...  0 usually "Stimulus bit 0"
                16  0  0; ...  1
                64  0  0; ...  2
                 0  1  0; ...  3
                 0  4  0; ...  4
                 0 16  0; ...  5
                 0 64  0; ...  6
                 0  0  1; ...  7 usually "Stimulus bit 7"
                 ];

    bit_num = dec2bin(trig);
    n_bit_num = length(bit_num);
    
    indx = n_bit_num - find(bit_num(1:end) == '1') + 1;
    rgb_num = sum(triggerCodes(indx,:), 1);

    R = rgb_num(1); G = rgb_num(2); B = rgb_num(3);
    col = [R G B];
    
end