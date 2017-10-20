function [m3DaysMean, f3DaysMean, mMeanMean, fMeanMean] = genderIsoCalc(GENDER,DAY1,DAY2,DAY3)
% Calculate Mean Isometric Strength for Each Gender Accross all 3 Days & Mean of Those Means
%
% Output = Input: [male3DaysMean, female3DaysMean, maleMeanOfMeans, femaleMeanOfMeans] = 
%                                                      genderIsoCalc(GENDER,DAY1,DAY2,DAY3)
%
%  Gustavo Sandri Heidner (October 20th, 2017).
    for i = 1:length(GENDER)
        if GENDER(i) == 'M'
            gender(i,1) = 0;
        else
            gender(i,1) = 1;
        end
    end
    M = [gender, DAY1, DAY2, DAY3];
    males = [];
    females = [];
    for i = 1:length(gender)
        if gender(i) == 0
            males = [males; DAY1(i), DAY2(i), DAY3(i)];
        else
            females = [females; DAY1(i), DAY2(i), DAY3(i)];
        end
    end
    m3DaysMean = [mean(males(:,1:3))]';
    f3DaysMean = [mean(females(:,1:3))]';
    mMeanMean = mean(m3DaysMean);
    fMeanMean = mean(f3DaysMean);
    
end
