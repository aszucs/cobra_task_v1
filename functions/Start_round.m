%% Stores opponent choice and launches the snake game and gives the player's score at the end; calls back "ranking1" afterwards.
%%Glossary for the Snake game parameters:
%%'--n_apples', dest='num_apples',type=int, default=3, 'Enter the number of apples to appear on screen'
%%'--ppa', dest='points_per_apple',type=int, default=1, 'Enter the points gained for each apple acquired'
%%'--t', dest='game_time',type=int, default=40000, 'Enter the duration of the game (in miliseconds)'
%%'--bonus_mvmt', dest='mvmnt_bonus',type=int, default=0,'Bonus given to play for just moving'
%%'--speed', dest='speed_mod',type=int, default=0, 'How fast the snake will move 1 - slower 5 - fastest '
%%'--state', dest='dest='state_end',type=int, default=0,'What to show in the last 10s of the game (0 = you''re losing, 1 = you''re close, 2 = you''re ahead', 3 = None

chosenButton = {getfield(bg.SelectedObject,'String')};
if strcmp(chosenButton{1},'do not remove apples')
     choice(rounds) = 1;
else
    choice(rounds) = find(stolen_apples==sscanf(chosenButton{1},'%*s %*s %d %*s'));
end

choice_apple = stolen_apples_image{choice(rounds)};


% displaying opponent's picture during round
clo(f)

startRound_instructions = uicontrol('Style','text','String','Your opponent:','units', 'normalized', 'Position',[0.7,0.8,0.28,0.1],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24);
opp_axes = axes('Parent',f,'position',[0.7,0.35,0.27,0.4], 'visible', 'off');
imshow(opponent_image{rounds}, 'parent', opp_axes)
startRound_instructions2 = uicontrol('Style','text','String',sprintf('%s\nrank %d',opponent_names{rounds}, opponent_ranking(rounds)),'units', 'normalized', 'Position',[0.7,0.22,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

apple_axes = axes('Parent',f,'position',[0.7,0.08,0.27,0.12], 'visible', 'off');
imshow(choice_apple, 'parent', apple_axes);

pause(1) 

% launches the Snake game with the right adjustments, and goes back to "ranking1" when done.
score = NaN;

try
    if snake_level == 2
        if outcomes(rounds) == 1
            if dscore(rounds) < -2
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 0');
            elseif dclose(rounds) == 1
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 1');
            else
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 2');
            end
        else
            if dscore(rounds) < -2
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 0');
            elseif dclose(rounds) == 1
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 1');
            else
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 2');
            end
        end
    elseif snake_level == 3
        if outcomes(rounds) == 1
             if dscore(rounds) < -2
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 5 --state 0');
             elseif dclose(rounds) == 1
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 5 --state 1');
             else
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 5 --state 2');
             end
        else
             if dscore(rounds) < -2
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 5 --state 0');
             elseif dclose(rounds) == 1
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 5 --state 1');
             else
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 5 --state 2');
             end
        end
    elseif snake_level == 1
        if outcomes(rounds) == 1
             if dscore(rounds) < -2
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 1 --state 0');
             elseif dclose(rounds) == 1
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 1 --state 1');
             else
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 1 --state 2');
             end
        else
             if dscore(rounds) < -2
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 1 --state 0');
             elseif dclose(rounds) == 1
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 1 --state 1');
             else
                 score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 1 --state 2');
             end
        end
    end
    
catch
    snake_level = 2;
        if outcomes(rounds) == 1
            if dscore(rounds) < -2
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 0');
            elseif dclose(rounds) == 1
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 1');
            else
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 80 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 2');
            end
        else
            if dscore(rounds) < -2
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 0');
            elseif dclose(rounds) == 1
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 1');
            else
                score = system('C:\python27\python.exe functions/snake4.py --n_apples 60 --ppa 1 --t 20000 --bonus_mvmt 0 --speed 3 --state 2');
            end
        end
end

score_true = score;
score = score + choice(rounds);
close(temp_window)