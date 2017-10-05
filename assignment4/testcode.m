% Initialize 
fprintf(strcat('\nWelcome to Tic-Tac-Toe o'' Doom!\n'));
fprintf('Starting Game'), pause(1) ,fprintf('.'), pause(1), fprintf('.'), pause(1), fprintf('.\n\n');

play = true;

while play == true
    
    % Reset and Initialize Game Board (gB), winning plays for the Computer, and available number of plays.
    clear gB winStart numPlay
    gB = ['123456789'];
    winStart = [1, 3, 7, 9];
    numPlay = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    
    % Show Game Board
    fprintf('\nHere is your playing board.\n\n')
    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
    pause(2)
    
    for i = 1:9
        if mod(i,2) == 1
            % Computer plays to win.
            if i < 5
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
            else
                if (gB(1) == 'X' && gB(3) == 'X') && gB(2) ~= 'O'
                    compPlay = 2; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(1) == 'X' && gB(2) == 'X') && gB(3) ~= 'O'
                    compPlay = 3; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(2) == 'X' && gB(3) == 'X') && gB(1) ~= 'O'
                    compPlay = 1; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(1) == 'X' && gB(7) == 'X') && gB(4) ~= 'O'
                    compPlay = 4; % Computer Wins!
                    gB(compPlay) = 'X';if gB(1) == 'X'
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
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(1) == 'X' && gB(4) == 'X') && gB(7) ~= 'O'
                    compPlay = 7; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(4) == 'X' && gB(7) == 'X') && gB(1) ~= 'O'
                    compPlay = 1; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(3) == 'X' && gB(9) == 'X') && gB(6) ~= 'O'
                    compPlay = 6; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(3) == 'X' && gB(6) == 'X') && gB(9) ~= 'O'
                    compPlay = 9; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(6) == 'X' && gB(9) == 'X') && gB(4) ~= 'O'
                    compPlay = 3; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(7) == 'X' && gB(9) == 'X') && gB(8) ~= 'O'
                    compPlay = 8; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(7) == 'X' && gB(8) == 'X') && gB(9) ~= 'O'
                    compPlay = 9; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(8) == 'X' && gB(9) == 'X') && gB(7) ~= 'O'
                    compPlay = 7; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
                elseif (gB(1) == 'X' && gB(9) == 'X') && gB(5) ~= 'O' || (gB(3) == 'X' && gB(7) == 'X') && gB(5) ~= 'O'
                    compPlay = 5; % Computer Wins!
                    fprintf('### Computer plays %i! ###\n\n',compPlay);
                    pause(1)
                    gB(compPlay) = 'X';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    disp('You LOSE! GAME OVER')
                    break
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
            end
        else
            %Display rules for human choice if first human play.
            humanTest = false;
            while humanTest == false
                humanPlay = input('Type one of the available numbers: ','s');
                % Check input and assign human play
                if any(ismember(numPlay,str2double(humanPlay))) == 1
                    numPlay(ismember(numPlay,humanPlay)) = [];
                    gB(humanPlay) = 'O';
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                    humanTest = true;
                else
                    disp('INVALID PLAY! Choose a valid number.')
                    pause(1)
                    fprintf('_%s_|_%s_|_%s_\n',gB(1),gB(2),gB(3))
                    fprintf('_%s_|_%s_|_%s_\n',gB(4),gB(5),gB(6))
                    fprintf(' %s | %s | %s \n\n',gB(7),gB(8),gB(9))
                end
            end
        end
    end
    
    % Test if player wants to keep playing. Throws an error if the answer
    % is innapropriate. (WORKING)
    test = true;
    while test == true
        playAgain = input('Play again? (y/n): ','s');
        % Possible correct answers
        if strcmp(playAgain,'y') == 1 || strcmp(playAgain,'Y') == 1
           test = false;
           continue
        elseif strcmp(playAgain,'n') == 1 || strcmp(playAgain,'N') == 1
            test = false;
            play = false;
        else
            disp('Invalid answer.')
            pause(1)
        end
    end
end

disp('Thank you for playing! :)')
