function rambleTremble(reFx, COPx, COPy, sampRate, resFreq)
%% Rambling and Trembling
%   This function will take the forces in X and Y directions as parameters
%   and perform a rambling and trembling analysis.
%   USE: rambleTremble(forcesInX, displacementCOPinX, samplingRate, resamplingFrequency)
%   INPUT:  Forces in X, displacement of center of pressure in the X and Y-axis, 
%           sampling rate of data, frequency at which data was resampled.
%   OUTPUT: none
%  
%   Gustavo Sandri Heidner - 30/11/2017

%% Find F(hor) = 0
% Find the timepoint proportion within where Fx = 0.
timePoint = [];
for i = 1:length(reFx)-1
    t = reFx(i);
    timeDiff = 0;
    if sign(reFx(i+1))+sign(reFx(i)) == 0 && reFx(i) < 0 % If points don't have different signals, there is no F(hor) = 0 between.
        stuff = abs(reFx(i))+abs(reFx(i+1)); % Gotta find a better name for this var...
        rate = stuff/(sampRate/resFreq);
        %         t = vX(i);
        while t < 0
            timeDiff = timeDiff + 1;
            t = t + rate;
        end
        timePoint(i) = ((i*50)-49) + (timeDiff-1);
    elseif sign(reFx(i+1))+sign(reFx(i)) == 0 && reFx(i) > 0
        stuff = abs(reFx(i))+abs(reFx(i+1)); % Gotta find a better name for this var...
        rate = stuff/(sampRate/resFreq);
        %         t = vX(i)
        while t > 0
            timeDiff = timeDiff + 1;
            t = t - rate;
        end
        timePoint(i) = ((i*50)-49) + (timeDiff-1);
    end
end
    
%% Retrieve the COP position associated to the F(hor) = 0 timePoints.

for i = 1:length(timePoint)
    if timePoint(i) ~= 0
        X((i*50)-49) = COPx(timePoint(i));
        Y((i*50)-49) = COPy(timePoint(i));
    end
    scatter(X,Y)
end

%%  Fit a cubic spline to the scatter dot

for i = 1:length(COPx)
     