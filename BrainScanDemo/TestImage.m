function [N, D, snrN, snrD, r] = TestImage(I, m, v)
% TestSlice - Tests a single 2D image for accuracy of denoising via Optimal
% Hard Thresholding.
%
%       Inputs:
%           I - 2D image matrix of intensity values
%       
%       Outputs:
%           N - Noisey 2D image matrix of I with gaussian noise added
%           D - Denoised 2D image matrix of N with Optimal Hard
%           Thresholding
%           snrN - Signal to Noise Ratio of Noisey 2D Image matrix
%           snrD - Signal to Noise Ratio of Denoised 2D Image matrix
%           r - rank of approximation


    I = im2double(I);
    N = imnoise(I, "gaussian", m, v);
    [U, S, V] = svd(N);
    
    c = 2.858; % threshold coefficeint
    s = median(diag(S));
    t = c*s; % threshold for arbitrary matrix
    
    S(S < t) = 0; % truncate based on threshold t
    
    D = U*S*V'; % reconstruct new thresholded matrix
    
    snrN = snr(I, N-I);
    snrD = snr(I, D-I);
    
    r = rank(S);
end 