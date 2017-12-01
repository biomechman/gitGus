function rambleTremble(Fx, sampRate, freq)
%% Rambling and Trembling
%   This function will take the forces in X and Y directions as parameters
%   and perform a rambling and trembling analysis.
%   USE: rambleTremble(forces_in_X_axis, samplingRate, frequency)
%   INPUT:  Forces in X and Y axis, sampling rate of data, the desired
%           frequency for the resampling of the rambling and trembling analysis.
%   OUTPUT: none
%  
%   Gustavo Sandri Heidner - 30/11/2017

%% What it does?
%   1. The original rambling and trembling decomposition uses data at 20 Hz,
%   then interpolates the time point between a positive and negative
%   differential of those two points to find a point in the middle where
%   horizontal force is zero (Fx = 0).



% Find the timepoint proportion within where Fx = 0.
for  i = 1:length(vX)
    if mod(vX(i+1)*vX(i)) == 0; % If points don't have different signals, there is no Fx = 0 between.
        continue
    elseif vX(i) < 0
        stuff = abs(vX(i))+abs(vX(i+1));
        rate = stuff/(sampRate/20);
        t = vX(i);
        timeDiff = 0;
        while t < 0
            timeDiff = timeDiff + 1;
            t = t + rate;
        end
        timePoint = ((i*50)-49) + timeDiff;
   %other cases go here...
    
    end
end
        %% Find X and Y at timePoint
        
%         FxZero = vX(i) + (freq/2)*rate;
%     elseif vX(i+1) < 0
%         rate = abs(vX(i))+abs(vX(i+1));
%         FxZero = vX(i) - (freq/2)*rate;
%     end
%     
