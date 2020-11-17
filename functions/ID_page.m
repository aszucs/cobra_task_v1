f=g;
clo(f)

%%Identification page
temp_window9 = figure('Visible', 'off');
bg = uibuttongroup(g, 'Visible','off','units','normalized','Position',[0 0 1 1], 'backgroundcolor', 'k', 'Position',[0 0 1 1], 'SelectedObject', []);

ID_Title = uicontrol('Parent', bg, 'Style','text','String','Registration page','units', 'normalized', 'Position',[0.3,0.85,0.4,0.1],'Backgroundcolor','k', 'Foregroundcolor', 'g', 'fontname', 'Arial', 'fontsize', 40);

ID_Instructions0 = uicontrol('Parent', bg, 'Style','text','String', sprintf('Number of rounds:'), 'units', 'normalized', 'Position',[0.1,0.72,0.4,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Instructions1 = uicontrol('Parent', bg, 'Style','text','String', sprintf('Player ID:'), 'units', 'normalized', 'Position',[0.1,0.62,0.4,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Instructions2 = uicontrol('Parent', bg, 'Style','text','String', sprintf('Player name:'), 'units', 'normalized', 'Position',[0.1,0.52,0.4,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Instructions3 = uicontrol('Parent', bg, 'Style','text','String', sprintf('Video game experience:'), 'units', 'normalized', 'Position',[0.1,0.42,0.4,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Instructions4 = uicontrol('Parent', bg, 'Style','text','String', sprintf('Gender:'), 'units', 'normalized', 'Position',[0.1,0.26,0.15,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Instructions5 = uicontrol('Parent', bg, 'Style','text','String', sprintf('Age:'), 'units', 'normalized', 'Position',[0.5,0.26,0.15,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);

tot_round_choice = {1,3,16,24};
ID_Popup1 = uicontrol('Parent', bg, 'Style','popupmenu', 'string', tot_round_choice, 'units', 'normalized', 'Position',[0.5,0.72,0.1,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Edit1 = uicontrol('Parent', bg, 'Style','edit','units', 'normalized', 'Position',[0.5,0.62,0.3,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Edit2 = uicontrol('Parent', bg, 'Style','edit','units', 'normalized', 'Position',[0.5,0.52,0.3,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Edit3 = uicontrol('Parent', bg, 'Style','edit','units', 'normalized', 'Position',[0.7,0.26,0.1,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
ID_Popup2 = uicontrol('Parent', bg, 'Style','popupmenu', 'string', {'played < 5 times/lifetime', 'played > 5 times/lifetime but last time > 10 years ago', 'plays 1-5 times/year', 'plays > 5 times/year but not weekly', 'plays weekly'}, 'units', 'normalized', 'Position',[0.5,0.42,0.3,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);


ID_gender1 = uicontrol('Parent', bg, 'Style', 'radiobutton', 'String', 'F', 'units', 'normalized', 'Position', [0.25, 0.26, 0.05, 0.08], 'backgroundcolor', 'k', 'foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30);
ID_gender2 = uicontrol('Parent', bg, 'Style', 'radiobutton', 'String', 'M', 'units', 'normalized', 'Position', [0.35, 0.26, 0.05, 0.08], 'backgroundcolor', 'k', 'foregroundcolor', 'y', 'fontname', 'Arial', 'fontsize', 30);

set(bg, 'SelectedObject', [ ], 'Visible', 'on')

ID_OK_button = uicontrol('Parent', bg, 'Style','pushbutton','String','Next','Callback', 'close(temp_window9)', 'units', 'normalized', 'Position',[0.4,0.1,0.2,0.1],'BackgroundColor','w', 'Foregroundcolor', 'k', 'fontsize', 24); 

waitfor(temp_window9)
try
    player_ID = get(ID_Edit1,'String');
    player_name = get(ID_Edit2,'String');
    player_age = get(ID_Edit3,'String'); 
    chosen_gender = {getfield(bg.SelectedObject,'String')};
    game_exp = getfield(ID_Popup2, 'Value');
    if getfield(ID_Popup1, 'Value')== 1
    tot_rounds = 1;
    elseif getfield(ID_Popup1, 'Value') == 2
    tot_rounds = 3;
    elseif getfield(ID_Popup1, 'Value') == 3
    tot_rounds = 16;
    elseif getfield(ID_Popup1, 'Value') == 4
    tot_rounds = 24;
    end
catch
    ID_page
end

if chosen_gender{1} == 'M'
    player_gender = 1;
elseif chosen_gender{1} == 'F'
    player_gender = 2;
end

%%Prepares the .csv files with headers (file name = patient ID)
fmain = fopen(sprintf('%s.csv', player_ID),'w');
fprintf(fmain,'"ID";name;gender;age;gameExp;rankEstim1;avatarChoice;consentChoice;snakeLevel;excited1;upset1;scared1;hostile1;proud1;irritable1;alert1;ashamed1;nervous1;determined1;trial;score;oppScore;scoreDiff;win;close;oppName;oppRank;rankStart;rankEnd;appleChoice;rankChoice;excited2;upset2;scared2;hostile2;proud2;irritable2;alert2;ashamed2;nervous2;determined2;mot1;mot2;mot3;mot4;mot5;mot6;mot7;mot8;enjoyed;satisfied;fair;credible;rankEstim2');



%% Interface to choose an avatar (increases game credibility)

clo(f)

bg1 = uibuttongroup(f, 'Visible','off','units','normalized','Position',[0 0 1 1], 'backgroundcolor', 'k', 'Position',[0 0 1 1], 'SelectedObject', []);
avatar_Instructions1 = uicontrol('Parent', bg1, 'Style','text','String', sprintf('Now, please choose an avatar from the following ones:'), 'units', 'normalized', 'Position',[0.1,0.85,0.8,0.08],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
av_axes1 = axes('parent', bg1, 'position',[0.15,0.57,0.1,0.25], 'visible', 'off');
av_axes2 = axes('parent', bg1, 'position',[0.35,0.57,0.1,0.25], 'visible', 'off');
av_axes3 = axes('Parent',bg1, 'position',[0.55,0.57,0.1,0.25], 'visible', 'off');
av_axes4 = axes('Parent',bg1, 'position',[0.75,0.57,0.1,0.25], 'visible', 'off');
if player_gender == 2
    imshow(playF1, 'Parent', av_axes1)
    imshow(playF2, 'Parent', av_axes2)
    imshow(playF3, 'Parent', av_axes3)
    imshow(playF4, 'Parent', av_axes4)
else
    imshow(playM1, 'Parent', av_axes1)
    imshow(playM2, 'Parent', av_axes2)
    imshow(playM3, 'Parent', av_axes3)
    imshow(playM4, 'Parent', av_axes4)
end
own_avatar1 = uicontrol(bg1, 'Style', 'togglebutton', 'String', '1', 'units', 'normalized', 'Position', [0.18, 0.48, 0.04, 0.08], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
own_avatar2 = uicontrol(bg1, 'Style', 'togglebutton', 'String', '2', 'units', 'normalized', 'Position', [0.38, 0.48, 0.04, 0.08], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
own_avatar3 = uicontrol(bg1, 'Style', 'togglebutton', 'String', '3', 'units', 'normalized', 'Position', [0.58, 0.48, 0.04, 0.08], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
own_avatar4 = uicontrol(bg1, 'Style', 'togglebutton', 'String', '4', 'units', 'normalized', 'Position', [0.78, 0.48, 0.04, 0.08], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
set(bg1, 'SelectedObject', [ ], 'Visible', 'on')

avatar_Instructions2 = uicontrol(f, 'Style','text','String', sprintf('Would you allow us to add your performance to the ranking for subsequent participants?'), 'units', 'normalized', 'Position',[0.1,0.3,0.8,0.15],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30);
avatar_consentY = uicontrol('Style', 'togglebutton', 'String', 'yes', 'Callback', 'set(ID_button, ''Visible'', ''on'')', 'units', 'normalized', 'Position', [0.38, 0.23, 0.06, 0.06], 'backgroundcolor', 'w', 'foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 24);
avatar_consentN = uicontrol('Style', 'togglebutton', 'String', ' no ', 'Callback', 'set(ID_button, ''Visible'', ''on'')', 'units', 'normalized', 'Position', [0.58, 0.23, 0.06, 0.06], 'backgroundcolor', '0.4,0.4,0.4', 'foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 24);

ID_button = uicontrol(f, 'Visible', 'off', 'Style', 'pushbutton', 'string', sprintf('Next'), 'Callback', 'round_counter', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.425,0.06,0.15,0.1], 'backgroundcolor', 'g', 'HorizontalAlignment', 'center');
