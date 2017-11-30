function [sFx, sFy, nFx, nFy, Fx, Fy] = simData(sampRate, noiseMag)
%% Test Data Generator
%   Generates a known variable data path composed of a smooth trajectory
%   and noise data.
%   USE: [sFx, sFy, dFx, dFy, Fx, Fy] = simData(samplingRate)
%   INPUT: Data sampling rate in integer format, magnitude of noise [int]
%   OUTPUT: smooth forces, noise forces, and compound signal in X and Y
%           coordinates.
%
%   Gustavo Sandri Heidner - 11/30/2017

%% Creates a smooth path of data and stores it.
t = 0:pi/sampRate:6*pi;
r = t.^2;
sFx = r.*cos(t);
sFy = r.*sin(t);
plot(sFx,sFy)
fprintf('Press any key to continue... \n\n')
% Wait for key press to continue.
pause()

%% Create a noisy signal.
nFx = rand(1, length(sFx));
nFy = rand(1, length(sFy));

%% Combine smooth and noisy signal to create simulated Fx and Fy
Fx = sFx + noiseMag*nFx;
Fy = sFy + noiseMag*nFy;
% Display the results:
plot(Fx,Fy)
fprintf('Press any key to continue... \n\n')
% Wait for key press to continue.
pause()
end
