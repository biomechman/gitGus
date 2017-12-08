%% Run the Analysis
%   Calls the importData function with the appropriate file name defined
%   below. Then calls rambleTremble function with the needed variables.
%
%   Gustavo Sandri Heidner - 12/03/2017

[Fx, COPx, COPy, sampRate] = importData('P00_C3_f_2.tsv');
fprintf('Done importing data. Press any key to continue...\n')
pause()
COP = rambleTremble(Fx, COPx, COPy);

