function output = scaleImg(input)
% output = Scale(input)
% Perform an offine scaling to put data in range [0-1].

[minval,maxval] = MatMinMax(input);
output = (input - minval) ./ (maxval-minval);

end
