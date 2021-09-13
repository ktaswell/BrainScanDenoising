function [Nvol, Dvol, snrNvec, snrDvec, r] = TestVolume(Vol, m, v)
% TestVolume - Tests a volume for Optimal Hard Threshold denoising along the 3rd dimension 
%
%       Inputs:
%           Vol - 3D image matrix of intensity values to be tested
%
%       Outputs: 
%           Nvol - 3D image matrix of Vol with noise added at each slice
%           Dvol - 3D image matrix of Nvol with Optimal Hard Thresholding
%           applied at each slice
%           snrNvec - 1D vector of signal to noise ratios of each noisey 2D
%           image slice in Nvol
%           snrDvec - 1D vector of signal to noise ratios of each denoised
%           2D image slice in Dvol
%           r - 1D vector of rank of approximation
%

%Initialize data structures with 0s
n = size(Vol);
Nvol = zeros(n);
Dvol = zeros(n);

snrNvec = zeros(n(1), 1);
snrDvec = zeros(n(1), 1);
r = zeros(n(1), 1);

for i = 1:n(1)
    [Nvol(:, :, i), Dvol(:, :, i), snrNvec(i), snrDvec(i), r(i)] = TestImage(Vol(:, :, i), m, v);
end

end