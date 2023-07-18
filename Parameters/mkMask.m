%%file mkMask.m
function [patch, full_gabSizeDeg] = mkMask(Params, sinSizeDeg, sinPower)

scr = Params.scr;
stim = Params.stim;

if nargin < 3 || isempty(sinSizeDeg)
    sinSizeDeg = .5;
end
if nargin < 4 || isempty(sinPower)
    sinPower = 5;
end

gabSizeDeg = stim.gabSizeDeg;
gabSizePix = stim.gabSize;
sinSizePix  = deg2pix(scr, sinSizeDeg);

[x,y]=meshgrid(1:gabSizePix, 1:gabSizePix);
x = x-mean(x(:));
y = y-mean(y(:));
x = Scale(x)*gabSizeDeg-gabSizeDeg/2;
y = Scale(y)*gabSizeDeg-gabSizeDeg/2;

[~,r] = cart2pol(x,y);
patch = double(r <= gabSizeDeg/2);

sinFilter = sin(linspace(0,pi,sinSizePix)).^sinPower;
sinFilter = sinFilter'*sinFilter;
sinFilter = sinFilter/sum(sinFilter(:));

patch = conv2(patch, sinFilter,'same');

Idx_1 = abs(patch-1) <= 10^-2;
Idx_r = r(Idx_1);
full_gabSizeDeg = 2*max(Idx_r(:));

end