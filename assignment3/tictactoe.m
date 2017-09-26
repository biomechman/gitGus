%% Tic-Tac-Toe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment 3: Matlab Tic-Tac-Toe withouth Loops (!@#!@%$!@#!@%!@#!@)
%
% Submitted by: Gustavo Sandri Heidner
%
% Due: September 26, 2017
%
% Instructions: 
%
% You will create a Matlab script to play Tic Tac Toe. You will need to automatically
% generate the computer player’s moves.
%
% Requirements:
%
% 1.) Comment section at the top with your name, date and a short description of
% what your code does.
% 2.) Welcome message for the user.
% 3.) Show game board.
% 4.) Prompt user for move.
% 5.) Display updated game board.
% 6.) Generate computer move.
% 7.) Keep going until there is a winner or no more available moves.
% 8.) Show final prompt with game result and a finishing message.
% 9.) You may NOT use loops.
% 10.) Once a space is taken, another player cannot move to that spot.
%
% Bonus Requirements Challenge (Worth extra points if correct):
%
% 1.) Allow computer to go first (5 bonus points)
% 2.) Make computer impossible to beat (tie every time). (10 bonus points)
%
% This script lets you play Tic-Tac-Toe of DOOM against the computer. 
% You shall not win!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



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

% Computer plays again (2nd).

if gB(1) == 'X'
    compPlay = 9;
elseif gB(3) == 'X'
    compPlay = 7;
elseif gB(7) == 'X'
    compPlay = 3;
else
    compPlay = 1;
end

if any(ismember(numPlay,compPlay)) == 1
    numPlay(ismember(numPlay,compPlay)) = [];
else
    compPlay = winStart(randi(length(winStart)));
    numPlay(ismember(numPlay,compPlay)) = [];
end
fprintf('### Computer plays %i! ###\n\n',compPlay);
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
    error('You LOSE! GAME OVER')  
elseif (gB(1) == 'X' && gB(7) == 'X') && gB(4) ~= 'O'
    compPlay = 4; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(3) == 'X' && gB(9) == 'X') && gB(6) ~= 'O'
    compPlay = 6; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(7) == 'X' && gB(9) == 'X') && gB(8) ~= 'O'
    compPlay = 8; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')     
elseif (gB(1) == 'X' && gB(9) == 'X') && gB(5) ~= 'O' || (gB(3) == 'X' && gB(7) == 'X') && gB(5) ~= 'O'
    compPlay = 5; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER') 
else
    if (gB(2) == 'O' && gB(5) == 'O')
        compPlay = 8;
    elseif (gB(4) == 'O' && gB(5) == 'O')
        compPlay = 6;
    elseif (gB(8) == 'O' && gB(5) == 'O')
        compPlay = 2;
    elseif (gB(6) == 'O' && gB(5) == 'O')
        compPlay = 4;
    elseif (gB(1) == 'O' && gB(5) == 'O')
        compPlay = 9;
    elseif (gB(3) == 'O' && gB(5) == 'O')
        compPlay = 7;
    elseif (gB(7) == 'O' && gB(5) == 'O')
        compPlay = 3;
    elseif (gB(9) == 'O' && gB(5) == 'O')
        compPlay = 1;
    else
        compPlay = numPlay(randi(length(numPlay)));
    end
    
    if any(ismember(numPlay,compPlay)) == 1
        numPlay(ismember(numPlay,compPlay)) = [];
    else
        compPlay = numPlay(randi(length(numPlay)));
        numPlay(ismember(numPlay,compPlay)) = [];
    end
    fprintf('### Computer plays %i! ###\n\n',compPlay);
    pause(1)
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
end

% Human's 3rd Play
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

% Coputer Plays 4th Time

if (gB(1) == 'X' && gB(3) == 'X') && gB(2) ~= 'O'
    compPlay = 2; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(1) == 'X' && gB(2) == 'X') && gB(3) ~= 'O'
    compPlay = 3; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(2) == 'X' && gB(3) == 'X') && gB(1) ~= 'O'
    compPlay = 1; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(1) == 'X' && gB(7) == 'X') && gB(4) ~= 'O'
    compPlay = 4; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(1) == 'X' && gB(4) == 'X') && gB(7) ~= 'O'
    compPlay = 7; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(4) == 'X' && gB(7) == 'X') && gB(1) ~= 'O'
    compPlay = 1; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER') 
elseif (gB(3) == 'X' && gB(9) == 'X') && gB(6) ~= 'O'
    compPlay = 6; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER') 
elseif (gB(3) == 'X' && gB(6) == 'X') && gB(9) ~= 'O'
    compPlay = 9; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(6) == 'X' && gB(9) == 'X') && gB(4) ~= 'O'
    compPlay = 3; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(7) == 'X' && gB(9) == 'X') && gB(8) ~= 'O'
    compPlay = 8; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER') 
elseif (gB(7) == 'X' && gB(8) == 'X') && gB(9) ~= 'O'
    compPlay = 9; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
elseif (gB(8) == 'X' && gB(9) == 'X') && gB(7) ~= 'O'
    compPlay = 7; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')     
elseif (gB(1) == 'X' && gB(9) == 'X') && gB(5) ~= 'O' || (gB(3) == 'X' && gB(7) == 'X') && gB(5) ~= 'O'
    compPlay = 5; % Computer Wins!
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3)) 
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    error('You LOSE! GAME OVER')  
else
    if (gB(2) == 'O' && gB(5) == 'O') && gB(7) ~= 'X'
        compPlay = 8;
    elseif (gB(4) == 'O' && gB(5) == 'O')  && gB(6) ~= 'X'
        compPlay = 6;
    elseif (gB(8) == 'O' && gB(5) == 'O') && gB(2) ~= 'X'
        compPlay = 2;
    elseif (gB(6) == 'O' && gB(5) == 'O') && gB(4) ~= 'X'
        compPlay = 4;
    elseif (gB(1) == 'O' && gB(5) == 'O') && gB(9) ~= 'X'
        compPlay = 9;
    elseif (gB(3) == 'O' && gB(5) == 'O') && gB(7) ~= 'X'
        compPlay = 7;
    elseif (gB(7) == 'O' && gB(5) == 'O') && gB(3) ~= 'X'
        compPlay = 3;
    elseif (gB(9) == 'O' && gB(5) == 'O') && gB(1) ~= 'X'
        compPlay = 1;
    else
        compPlay = numPlay(randi(length(numPlay)));
    end
    
    if any(ismember(numPlay,compPlay)) == 1
        numPlay(ismember(numPlay,compPlay)) = [];
    else
        compPlay = numPlay(randi(length(numPlay)));
        numPlay(ismember(numPlay,compPlay)) = [];
    end
    fprintf('### Computer plays %i! ###\n\n',compPlay);
    pause(1)
    gB(compPlay) = 'X';
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
end

% Human's 4rd Play
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

% Computer last play
compPlay = numPlay;
fprintf('### Computer plays %i! ###\n\n',compPlay);
pause(1)
gB(compPlay) = 'X';
fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))

% Display end-game message:
if (gB(1) == 'X' && gB(2) == 'X' && gB(3) == 'X') || (gB(4) == 'X' && gB(5) == 'X' && gB(6) == 'X') || (gB(7) == 'X' && gB(8) == 'X' && gB(9) == 'X') || (gB(1) == 'X' && gB(4) == 'X' && gB(7) == 'X') || (gB(2) == 'X' && gB(5) == 'X' && gB(8) == 'X') || (gB(3) == 'X' && gB(6) == 'X' && gB(9) == 'X') || (gB(1) == 'X' && gB(5) == 'X' && gB(9) == 'X') || (gB(3) == 'X' && gB(5) == 'X' && gB(7) == 'X')
    fprintf('Game Over\n')
    fprintf('Computer Wins!\n')
    fprintf('Better luck next time!\n')
else
    fprintf('Game Over\n')
    fprintf('It''s a tie!\n')
    fprintf('Better luck next time!\n')
end