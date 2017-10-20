%% Main Function
%  Data file (.CSV) must be in the Current Folder.
%
%  Gustavo Sandri Heidner (October 20th, 2017).

%% 1. Import Data
[SubjectID,Age,Gender,Weight,Day1,Day2,Day3] = importfile('isok_data_6803.csv');

%% 2. Calculate Mean Isometric Strength for Each Gender Accross all 3 Days & Mean of Those Means
[m3DaysMean, f3DaysMean, mMeanMean, fMeanMean] = genderIsoCalc(Gender,Day1,Day2,Day3);

%% 3. Compare the Days for Increase in Isometric Strength
