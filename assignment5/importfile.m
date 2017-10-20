%%  Import Function
%   When caled, will impot the CSV values from the input file name.
%   The function will automatically acquire the Current Folder path. 
%   Your data file must be in the same folder. 
%
%   Use: importfile('file name')
%   
%   Gustavo Sandri Heidner (October 20th, 2017)
%__________________________________________________________________________

function importfile(fileName)
    path = input('Enter the folder address that contains your data file and press return: ','s');
    data = readtable(strcat(path,fileName)); 
    varNames = data.Properties.VariableNames;
    for i = 1:length(varNames)
        input = data{i,:};
        try
            eval(strcat(varNames{i},' = ',(data{:,1})));
        catch
            eval(strcat(varNames{i},' = ',num2str(data{:,1})));
        end
    end
end