function [vX, Fx, Fy] = simData(sampRate, noiseMag, freq)
%% Test Data Generator
%   Generates a known variable data path composed of a smooth trajectory
%   and noise data.
%   USE: [sFx, sFy, dFx, dFy, Fx, Fy] = simData(samplingRate, noiseMagnitude, resamplingFrequency)
%   INPUT: Data sampling rate in integer format, magnitude of noise [int],
%           resampling frequency
%   OUTPUT: differential of forces, compound signal in X and Y coordinates.
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

%% Combine smooth and noisy signal to create simulated Fx and Fy.
%   Noise magnitude is also randomized.
Fx = sFx + rand(1)*noiseMag*nFx;
Fy = sFy + rand(1)*noiseMag*nFy;
% Display the results:
plot(Fx,Fy)
fprintf('Press any key to continue... \n\n')
% Wait for key press to continue.
pause()

% Resample the data:
reFx = Fx(1:sampRate/freq:length(Fx));
reFy = Fy(1:sampRate/freq:length(Fy));
plot(reFx,reFy);
fprintf('Press any key to continue... \n\n')
pause()

% Create the dipoles
for i = 1:length(reFx)-1
    vX(i) = reFx(i+1) - reFx(i);
end


end
