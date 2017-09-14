%% Tic-Tac-Toe
%
% Gustavo Sandri Heidner --name
% 09-15-2017 --date 
%
% This script lets you play Tic-Tac-Toe of DOOM against the computer. 
% You shall not win!

% Reset and Initialize available number of plays.
clear numPlay
numPlay = [1, 2, 3, 4, 5, 6, 7, 8, 9];

fprintf(strcat('\nWelcome to Tic-Tac-Toe o'' Doom!\n'));
fprintf('Starting Game'), pause(1) ,fprintf('.'), pause(1), fprintf('.'), pause(1), fprintf('.\n\n');

% Reset and Initialize Game Board (gB)
clear gB
gB = ['123456789'];

% Show Game Board
fprintf('\nHere is your playing board.\n\n')
fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
pause(2)

% Computer plays smart
winStart = [1, 3, 7, 9];
compPlay = winStart(randi(length(winStart)));
fprintf('### Computer plays %i! ###\n\n',compPlay);
pause(1)

% Remove computer's play from the possible plays
numPlay(compPlay) = [];
winStart(ismember(winStart,compPlay)) = [];
% Update board
gB(compPlay) = 'X';

% Show updated board and prompt user to play
fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
fprintf('It is your turn to play.\nWARNING! If you choose a number that is not on the board, you will lose your turn!\n')
fprintf('You have been warned!\n\n'); pause(3); 
humanPlay = input('Type one of the available numbers: ');

% Check input and assign human play
if any(ismember(numPlay,humanPlay)) == 1
    numPlay(ismember(numPlay,humanPlay)) = [];
    gB(humanPlay) = 'O';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
else
    disp('INVALID PLAY! YOU''VE LOST YOUR TURN!')
    pause(1)
end

% Update computer winning choices
winStart(ismember(winStart,humanPlay)) = [];

% Computer plays again.
if gB(5) == 'O'
    if gB(1) == 'X'
        compPlay = 9;
        fprintf('### Computer plays %i! ###\n\n',compPlay);
        pause(1)
    elseif gB(3) == 'X'
        compPlay = 7;
        fprintf('### Computer plays %i! ###\n\n',compPlay);
        pause(1)
    elseif gB(7) == 'X'
        compPlay = 3;
        fprintf('### Computer plays %i! ###\n\n',compPlay);
        pause(1)
    else
        compPlay = 1;
        fprintf('### Computer plays %i! ###\n\n',compPlay);
        pause(1)
    end
else
    compPlay = winStart(randi(length(winStart)));
    fprintf('### Computer plays %i! ###\n\n',compPlay);
    pause(1)
end
    
% Update board and available numbers 
numPlay(ismember(numPlay,compPlay)) = [];
gB(compPlay) = 'X';
fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))

% Human's 2nd Play
humanPlay = input('Type one of the available numbers: ');

% Check input and assign human play
if any(ismember(numPlay,humanPlay)) == 1
    numPlay(ismember(numPlay,humanPlay)) = [];
    gB(humanPlay) = 'O';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
else
    disp('INVALID PLAY! YOU''VE LOST YOUR TURN!')
    pause(1)
end

% Coputer Plays 3rd Time

if (gB(1) == 'X' && gB(3) == 'X') && gB(2) ~= 'O'
    compPlay = 2; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    fprintf('You LOSE!\nGAME OVER\n')
elseif (gB(1) == 'X' && gB(7) == 'X') && gB(4) ~= 'O'
    compPlay = 4; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    fprintf('You LOSE!\nGAME OVER\n')
elseif (gB(3) == 'X' && gB(9) == 'X') && gB(6) ~= 'O'
    compPlay = 6; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    fprintf('You LOSE!\nGAME OVER\n')
elseif (gB(7) == 'X' && gB(9) == 'X') && gB(8) ~= 'O'
    compPlay = 8; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    fprintf('You LOSE!\nGAME OVER\n')    
elseif (gB(1) == 'X' && gB(9) == 'X') || (gB(3) == 'X' && gB(7) == 'X') && gB(5) ~= 'O'
    compPlay = 5; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    fprintf('You LOSE!\nGAME OVER\n')
else
    compPlay = numPlay(randi(length(numPlay)));
    fprintf('### Computer plays %i! ###\n\n',compPlay);
    pause(1)
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))    
end