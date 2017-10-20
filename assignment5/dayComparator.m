function [out] = dayComparator(SubjectID, pre, post)
% takes the subject ids and two days as inputs and returns a matrix with 
% the subject IDs of the subjects who had an increase from the first day 
% to the second day (it should also work for the second day to the third 
% day).
%
% Output = Input: [out] = dayComparator(SubjectID, pre, post)
%
% Gustavo Sandri Heidner (October 20th, 2017).
out = [];
for i = 1:length(SubjectID)
    if pre(i) < post(i)
        out = [out; SubjectID(i)];
    end
end

end
