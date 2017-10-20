%% Main Function
%  Data file (.CSV) must be in the Current Folder.
%  Requires other functions to be in the same folder to run:
%       dayComparator.m
%       genderIsoCalc.m
%       importfile.m
%  
%   Output: .CSV file with mean isometric strength for each gender across
%   all 3 days and mean of means, a comparison between day 1 & 2, and day 2
%   & 3 to determine which subjects increased in isometric strength, and
%   normalized mean isokinetic group mean for each day.
%
%  Gustavo Sandri Heidner (October 20th, 2017).

%% 1. Import Data
% Must verify that file name is correct. Needs to be entered manually.
[SubjectID,Age,Gender,Weight,Day1,Day2,Day3] = importfile('isok_data_6803.csv');

%% 2. Calculate Mean Isometric Strength for Each Gender Accross all 3 Days & Mean of Those Means
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3);

%% 3. Compare the Days for Increase in Isometric Strength
day1toDay2 = dayComparator(SubjectID, Day1, Day2);
day2toDay3 = dayComparator(SubjectID, Day2, Day3);

%% 4. Normalize Isokinetic Data and Calculate Group Means for Each Day
normWeight = [Day1./Weight, Day2./Weight, Day3./Weight];
normDay1mean = mean(normWeight(:,1));
normDay2mean = mean(normWeight(:,2));
normDay3mean = mean(normWeight(:,3));

%% 5. Write output to .CSV file
M = cat(1, maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean, day1toDay2, day2toDay3, normDay1mean, normDay2mean, normDay3mean);
csvwrite('iso_results.csv',M)