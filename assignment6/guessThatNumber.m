function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber()
%
%        NAME: Gustavo Sandri heidner
%
%         DUE: November 02
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it,
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github.
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------

beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game \n\n', ... % B01: Not buggy anymore.
    'This program plays the game of Guess That Number in which you have to guess\n', ...
    'a secret number.  After each guess you will be told whether your \n', ...
    'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): ');
%% B.01: Endless WHILE loop: (while level ~= beginner && level ~= moderate && level ~= advanced)
%        Found by "playing." Conditions are never met with ||; should be &&.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while level ~= beginner && level ~= moderate && level ~= advanced
    fprintf('Sorry, that is not a valid level selection.\n')
    level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

%% B.02: Assignment instead of comparison: (if level = beginner)
%        Found by visual inspection.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if level == beginner
    
    highest = beginnerHighest;
    
elseif level == moderate
    
    highest = moderateHighest;
    
else
%% B.03: Undefined function or variable 'advancedhighest'.
%        Found testing. Changed to: highest = advancedHighest;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    highest = advancedHighest;
end

% randomly select secret number between 1 and highest for level of play


%% B.04: Faulty equation: (secretNumber = floor(rand() + 1 * highest);)
%        Found by "trying it on command window." Always return highest.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B.05: Formula will generate results of 0 and 100 if using 'floor'/'ceil'
%        Found by simulating results. Better to use 'randi' with defined
%        numerical space.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

secretNumber = randi([1,highest]);

% initialize number of guesses and User_guess <-- Var name?

%% B.06: Number of guesses initialization: (numOfTries = 1;)
%        Found by visual inspection. Initial # of tries is ZERO.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numOfTries = 0;
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

while userGuess ~= secretNumber
    
    % get a valid guess (an integer from 1-Highest) from the user
    
%% B.07: Unchecked user input.
%        i.  Found by testing. Will take a floating number (with decimals).
%        ii. Found by testing. Will 'kind of break' when receiving a
%        string.
%        Needs a (few) constraint statement(s).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    fprintf('\nEnter a guess (1-%d). Decimals will be rounded down: ', highest);
    userGuess = floor(str2double(input('','s')));
%% B.08: Wrong comparison in WHILE loop: (userGuess >= highest)
%        Found by visual inspection. Will include a correct guess that is
%        equal to the highest number. Changed the statement: userGuess > highest
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    while isnan(userGuess) || userGuess < 1 || 
        fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);
        userGuess = floor(str2double(input('','s')));
    end % of guess validation loop
         
    
    % add 1 to the number of guesses the user has made
    
    numOfTries = numOfTries + 1;
    
    % report whether the user's guess was high, low, or correct
%% B.08: Open IF statement: (if userGuess > secretNumber)
%        Found by visual inspection/debugger highlighted previous WHILE loop.
%        Needs an 'end' statement.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B.09: Wrong IF statement response (if userGuess > secretNumber)
%        Found by visual inspection. Fixed by changing the comparison
%        type.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if userGuess < secretNumber 
        fprintf('Sorry, %d is too low.\n', userGuess);
    elseif userGuess > secretNumber
        fprintf('Sorry, %d is too high.\n', userGuess);
%% B.10: Wrong ELSEIF statement: (elseif numOfTries == 1)
%        Found by visual inspection. Will always break the IF
%        conditional on the first try. Needs to be nested after the correct 
%        guess has been determined.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
    else
        if numOfTries == 1
            fprintf('\nLucky You! You got it on your first try!\n\n');
        else
%% B.11: Displays the wrong numbers: (fprintf('\nCongratulations!  You got %d in %d tries.\n\n')
%        Found by playing. Needs to have the correct inputs.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
            fprintf('\nCongratulations! You got it in %d tries.\n\n', numOfTries);
        end
    end % end of IF statement
    
    
    end
    fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');
    
end  % of guessing while loop

% end of game