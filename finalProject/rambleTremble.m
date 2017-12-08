function COP = rambleTremble(Fx, COPx, COPy)
%% Rambling and Trembling
%   This function will take the forces in X and Y directions as parameters
%   and perform a rambling and trembling analysis.
%   USE: rambleTremble(forcesInX, displacementCOPinX, displacementCOPinY)
%   INPUT:  Forces in X, displacement of center of pressure in the X and Y-axis, 
%           sampling rate of data, frequency at which data was resampled.
%   OUTPUT: none
%  
%   Gustavo Sandri Heidner - 30/11/2017

%% Plot Fx and Reference Horizontal Line
gcf = figure('Name','Rambling & Trembling'), subplot(3,1,1), plot(Fx,'k'), hold on, line([0,length(Fx)],[0,0],'Color','r')
xlabel('Time (ms)'), ylabel('Force (N)'), title('Raw Horizontal Force Data','FontWeight','Bold')
fprintf('Done plotting raw horizontal force data. Press any key to continue...\n')
pause()

%% Filter Fx, COPx, and COPy - low pass butterworth @ 20 Hz.
[b, a] = butter(3, 20/500, 'low');
Fx = filter(b, a, Fx);
COPx = filter(b, a, COPx);
COPy = filter(b, a, COPy);

subplot(3,1,2), plot(Fx,'k'), hold on, line([0,length(Fx)],[0,0],'Color','r') 
xlabel('Time (ms)'), ylabel('Force (N)'), title('Filtered Horizontal Force Data - Low Pass, 3rd order, 20 Hz','FontWeight','Bold')
fprintf('Done plotting filtered horizontal force data. Press any key to continue...\n')
pause()

%% Find F(hor) = 0
% Find the COP timepoint variable where Fx = 0.
COP = zeros(60000,1);
for i = 1:length(Fx)-1
    if sign(Fx(i+1))+sign(Fx(i)) == 0 && Fx(i) < 0 % If points don't have different signals, there is no F(hor) = 0 between.
        COP(i,1) = ((COPx(i))+(COPx(i+1)))/2; % Gotta find a better name for this var...
        COP(i,2) = (abs(COPy(i))+abs(COPy(i+1)))/2;
    elseif sign(Fx(i+1))+sign(Fx(i)) == 0 && Fx(i) > 0
        COP(i,1) = ((COPx(i))+(COPx(i+1)))/2; % Gotta find a better name for this var...
        COP(i,2) = (abs(COPy(i))+abs(COPy(i+1)))/2;
    end
end
%% Plot the COP position associated to the F(hor) = 0 timePoints.
COP(COP == 0) = NaN;
subplot(3,1,3), plot(COPx,'k'), hold on,scatter((1:length(COP(:,1))), COP(:,1), '.r')
xlabel('Time (ms)'), ylabel('Displacement (mm)'), title('Center of Pressure Horizontal Displacement','FontWeight','Bold')
fprintf('Done plotting filtered center or pressure data. Press any key to continue...\n')
pause()

%%  Fit a cubic spline to the scatter dot 
x = find(~isnan(COP(:,1)));
y = COP(x,1);
xx = linspace(1,60000,60000);
yInterp = interp1(x,y,xx,'pchip'); % This is the splined function.
subplot(3,1,3), plot(xx,yInterp,'b-')
fprintf('Done plotting CoP spline. Press any key to continue...\n')
pause()

%% Correlation analysis for Rambling and Trembling
r = corrcoef(COPx, yInterp);
fprintf('Rambling Correlation Coefficient: %.2f\n', r(1,2));
subplot(3,1,3), text(330, 90, ['\it r = ', num2str(r(1,2),'%.2f')])

%% Save results to picture file and export variables to .csv file.
%   First column is filtered horizontal force data, second column is
%   filtered CoP horizontal displacement data, third column is cubic
%   spline interpolation of CoP displacement.
xlswrite('Ramble_Tremble',[Fx, COPx, yInterp'])
saveas(gcf,'Rambling and Trembling Graphs')
