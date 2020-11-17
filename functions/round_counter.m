%% Counts the number of rounds and loads the corresponding interface

% Determines chosen avatar and stores data about chosen avatar and consent in the ID_other.csv file
chosen_avatar = getfield(bg1.SelectedObject,'String');

if player_gender == 1
    if chosen_avatar == '1' 
        player_avatar = playM1;
    elseif chosen_avatar == '2'
        player_avatar = playM2;
    elseif chosen_avatar == '3'
        player_avatar = playM3;
    elseif chosen_avatar == '4'
        player_avatar = playM4;
    end
elseif player_gender == 2
    if chosen_avatar == '1' 
        player_avatar = playF1;
    elseif chosen_avatar == '2'
        player_avatar = playF2;
    elseif chosen_avatar == '3'
        player_avatar = playF3;
    elseif chosen_avatar == '4'
        player_avatar = playF4;
    end
end   

if get(avatar_consentY, 'Value') == 1
    consent_choice = 1;
else
    consent_choice = 0;
end

% Defines parameters: predefined outcomes, money gains, opponent names, challenge price 
clo(f) 

% Sets up a loop for the total number of rounds, with the PANAS affective scale at the beginning and at the end of the game
for i = 0:tot_rounds-1
   rounds = i+1;
   temp_window2 = figure('Visible','off','HandleVisibility','off');
   if rounds == 1
        panas_count = 1;
        names(1,100) = {'> YOU <'};
        ranks = 1:length(names);
        current_ranking = starting_rank;
        affective_scale
        waitfor(PANAS_figure)
        panas_count = 2;
   end
   clo(f)
   ranking1
   waitfor(temp_window2)
   if rounds == tot_rounds
       clo(f)
       affective_scale
       waitfor(PANAS_figure)
   end
end

fprintf(fmain, ';%d;%d;%d;%d;%d;%d;%d;%d;%d;%d', panas_rating2);


% End-game window with final results.
temp_window_end = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('        Game completed.\n\n\n  Your rank:          %d.\n   You earned:       $ %.2f.\n\n     Congratulations!',current_ranking, final_earning),'units', 'normalized', 'Position',[0.05,0.42,0.9,0.48],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
OK_button4 = uicontrol('Style','pushbutton','String','To the end-game questions', 'Callback', 'close(temp_window_end)','units', 'normalized', 'Position',[0.3,0.2,0.4,0.1],'BackgroundColor','g', 'fontsize', 24);
waitfor(temp_window_end)

%motivation questions
clo(f)
mot_questions = {'I wanted to perform as well as I possibly could on the task.', 'Maximizing my personal record of apples eaten was important to me.', 'I wanted to perform better than everyone else on the task.', 'I did not want to perform more poorly than everyone else on the task.', 'Attaining the highest rank among all the competitors was important to me.', 'I wanted to take revenge on people who defeated me.', 'I wanted to avoid performing less than my best on the task.', 'I wanted to ensure that I win.'};

mot_figure = figure ('Visible','off', 'HandleVisibility','on');
mot_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0.01, 0.4, 0.98, 0.1], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', [0.2, 0.2, 0.2]); 
mot_rating = ones(5, 8);
mot_item = zeros(1,8);

mot_Instructions = uicontrol(f, 'Style', 'text', 'string', sprintf('       Please, answer the following questions:\n\n'), 'fontname', 'Arial', 'fontsize', 28, 'units','normalized','Position',[0.1, 0.68, 0.8, 0.15], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'HorizontalAlignment', 'center');

for i = 1:8
    mot_figure2 = figure('visible','off');
    mot_item(i) = uicontrol(f, 'Style', 'text', 'string', sprintf('%s', mot_questions{i}),'units','normalized','Position',[0.02, 0.58 0.96 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 26, 'fontweight','bold', 'backgroundcolor', '0.3 0.3 0.3', 'foregroundcolor', 'y');  
    mot_choice1 = uicontrol('parent', mot_bg, 'Style', 'togglebutton','Callback', 'close(mot_figure2)', 'string', sprintf('Strongly disagree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.005, 0.1, 0.2, 0.8], 'backgroundcolor', 'w');
    mot_choice2 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(mot_figure2)', 'string', sprintf('Disagree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.207, 0.1, 0.16, 0.8], 'backgroundcolor', 'w');
    mot_choice3 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(mot_figure2)', 'string', sprintf('Neither agree nor disagree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized', 'Position',[0.369, 0.1, 0.262, 0.8], 'backgroundcolor', 'w');
    mot_choice4 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(mot_figure2)', 'string', sprintf('Agree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.633, 0.1, 0.16, 0.8], 'backgroundcolor', 'w');
    mot_choice5 = uicontrol('parent', mot_bg, 'Style', 'togglebutton', 'Callback', 'close(mot_figure2)', 'string', sprintf('Strongly agree'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.795, 0.1, 0.2, 0.8], 'backgroundcolor', 'w');
    waitfor(mot_figure2)
    mot_rating(:,i) = [get(mot_choice1, 'Value'); get(mot_choice2, 'Value'); get(mot_choice3, 'Value');get(mot_choice4, 'Value');get(mot_choice5, 'Value')];
end

mot_factor = ones(5,8);
score_factor = ones(5,8);
for n = 1:5
score_factor(n,:) = n;
end

mot_rating = mot_rating.*score_factor;
motivation = sum(mot_rating);

%store motivation scale in fmain .csv file
fprintf(fmain, ';%d;%d;%d;%d;%d;%d;%d;%d', motivation);

%% other questions
% question 1: enjoyability
temp_window_end2 = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('How much did you enjoy playing?'),'units', 'normalized', 'Position',[0.1,0.7,0.8,0.1],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

endQ_label = uicontrol('Style','text','String',sprintf('Not at all.'),'units', 'normalized', 'Position',[0.225,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
endQ_label2 = uicontrol('Style','text','String',sprintf('Extremely.'),'units', 'normalized', 'Position',[0.625,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

slider_button = uicontrol('Style','slider', 'SliderStep', [1, 0.1], 'units', 'normalized', 'Position',[0.3,0.4,0.4,0.07],'BackgroundColor',[0.30 0.30 0.30]);
confirm_button = uicontrol('Style','pushbutton','String','Confirm','units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'Callback','close(temp_window_end2)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_end2)
enjoyed = round(get(slider_button,'Value').*10);

% question 2: satisfaction with own performance
temp_window_end3 = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('How well do you think you played?'),'units', 'normalized', 'Position',[0.1,0.7,0.8,0.1],'Backgroundcolor', 'k', 'ForegroundColor','y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

endQ_label = uicontrol('Style','text','String',sprintf('Not at all.'),'units', 'normalized', 'Position',[0.225,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
endQ_label2 = uicontrol('Style','text','String',sprintf('Extremely.'),'units', 'normalized', 'Position',[0.625,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

slider_button2 = uicontrol('Style','slider', 'SliderStep', [1, 0.1], 'units', 'normalized', 'Position',[0.3,0.4,0.4,0.07],'BackgroundColor',[0.30 0.30 0.30]);
confirm_button = uicontrol('Style','pushbutton','String','Confirm','units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'Callback','close(temp_window_end3)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_end3)
satisfied = round(get(slider_button2,'Value').*10);

% question 3: opponents' fairness
temp_window_end4 = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('On average, how fair did your opponents play?'),'units', 'normalized', 'Position',[0.1,0.7,0.8,0.1],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

endQ_label = uicontrol('Style','text','String',sprintf('Not at all.'),'units', 'normalized', 'Position',[0.225,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
endQ_label2 = uicontrol('Style','text','String',sprintf('Extremely.'),'units', 'normalized', 'Position',[0.625,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

slider_button3 = uicontrol('Style','slider', 'SliderStep', [1, 0.1], 'units', 'normalized', 'Position',[0.3,0.4,0.4,0.07],'BackgroundColor',[0.30 0.30 0.30]);
confirm_button = uicontrol('Style','pushbutton','String','Confirm','units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'Callback','close(temp_window_end4)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_end4)
fair = round(get(slider_button3,'Value').*10);

% question 4: opponents' fairness
temp_window_end5 = figure('Visible','off','HandleVisibility','off');
clo(f)
end_Indications = uicontrol('Style','text','String',sprintf('To what extent did your actions influence the outcome of the game?'),'units', 'normalized', 'Position',[0.1,0.7,0.8,0.2],'Backgroundcolor', 'k', 'ForegroundColor','y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

endQ_label = uicontrol('Style','text','String',sprintf('Not at all.'),'units', 'normalized', 'Position',[0.225,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
endQ_label2 = uicontrol('Style','text','String',sprintf('Extremely.'),'units', 'normalized', 'Position',[0.625,0.5,0.15,0.1],'BackgroundColor','k', 'Foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');

slider_button3 = uicontrol('Style','slider', 'SliderStep', [1, 0.1], 'units', 'normalized', 'Position',[0.3,0.4,0.4,0.07],'BackgroundColor',[0.30 0.30 0.30]);
confirm_button = uicontrol('Style','pushbutton','String','Confirm','units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'Callback','close(temp_window_end5)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_end5)
credible = round(get(slider_button3,'Value').*10);


% question 5: deserved rank
temp_window_end6 = figure('Visible','off','HandleVisibility','off');
clo(f)

placeholder_window3 = uicontrol(f, 'Style', 'text', 'string', sprintf('I should be at\n    rank 200  \n   out of 200'), 'units', 'normalized', 'Position',[0.4,0.4,0.25,0.2], 'Backgroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'fontweight','bold');
Practice_ranking_Indications = uicontrol(f, 'Style','text','String',sprintf('According to you, what should have been your final rank? Top player has rank 1.'),'units', 'normalized', 'Position',[0.05,0.7,0.9,0.15],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
Practice_OK_button3 = uicontrol(f, 'Style','pushbutton','String','Confirm','Callback', 'close(temp_window_end6)', 'units', 'normalized', 'Position',[0.435,0.1,0.15,0.1],'BackgroundColor','w', 'Foregroundcolor', 'k', 'fontsize', 24); 
slider_button4 = uicontrol(f, 'Style','slider', 'SliderStep', [0.005, 0.1], 'units', 'normalized', 'Position',[0.3,0.2,0.05,0.5],'BackgroundColor','g','callback', @Slider_value3);
slider_output3 = addlistener(slider_button4,'ContinuousValueChange', @Slider_value3);

waitfor(temp_window_end6)

estimated_rank = 203-round((get(slider_button4,'Value')+0.01)*200);
if estimated_rank > 200
        estimated_rank = 200;
end


fprintf(fmain, ';%d;%d;%d;%d;%d', enjoyed, satisfied, fair, credible, estimated_rank);
fclose(fmain);

%quit task
clo(f)
set(f, 'HandleVisibility', 'on')

mot_ThankYou = uicontrol(f, 'Style', 'text', 'string', sprintf('Thank you for playing!'), 'fontname', 'Arial', 'fontsize', 28, 'units','normalized','Position',[0.3, 0.5, 0.4, 0.1], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'HorizontalAlignment', 'center');
mot_OKbutton = uicontrol(f, 'Style', 'pushbutton', 'string', sprintf('Quit'), 'Callback', 'close all', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.4,0.2,0.2,0.1], 'backgroundcolor', 'g', 'HorizontalAlignment', 'center');
