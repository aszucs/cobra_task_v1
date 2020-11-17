%% Contains all the interface for the beginning and the end of each Snake round

% starting window for 1st round
clo(f)
if rounds == 1
    temp_window_outcome3 = figure('Visible','off','HandleVisibility','off');
    
    for i = 1:length(ranks)
    ranking(i) = {sprintf('%02d. %10s',ranks(i), names{i})};
    end 
            
    for i = current_ranking-10:current_ranking+10
        hopponent(i) = uicontrol('parent',f,'Style','text','String',ranking{i},'units', 'normalized','Position',[0.4,1-(0.04*(i-(current_ranking-10))+0.1),0.20,0.035], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'FixedWidth', 'fontsize', 18);
    end
    set(hopponent(current_ranking), 'BackgroundColor','y', 'Foregroundcolor','k', 'fontweight','bold')
    
    indication_rank = uicontrol('parent', f, 'Style','text','String',sprintf('You start at rank 100 from 200.\n        You have $ %.2f.\n\n           Good Luck!', endowment),'units','normalized','Position',[0.02,0.4,0.36,0.2], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24);
    ranking1_button = uicontrol('Style','pushbutton','String','START','units', 'normalized', 'Position',[0.75,0.45,0.2,0.1],'Callback','close(temp_window_outcome3)','BackgroundColor','g', 'fontname', 'Arial', 'fontsize', 24);  
waitfor(temp_window_outcome3)
end
    
%% showing 1st opponent followed by apple choice
clo(f)

indication_apples = uicontrol('parent', f, 'Style','text','String','Next opponent:','units','normalized','Position',[0.4,0.85,0.2,0.08], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24);

opp_axes = axes('Parent',f,'position',[0.365,0.35,0.27,0.4], 'visible', 'off');
imshow(opponent_image{rounds})
ranking_instructions1 = uicontrol('Style','text','String',sprintf('%s, rank %d',opponent_names{rounds}, opponent_ranking(rounds)),'units', 'normalized', 'Position',[0.365,0.18,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

pause(3)

% apple-buying window
clo(f)
% create a button-group and instructions
bg = uibuttongroup(f, 'Visible','on','units','normalized','Position',[0 0 1 1], 'backgroundcolor', 'k', 'Position',[0 0 1 1], 'SelectedObject', []);

indication_apples = uicontrol('parent', bg, 'Style','text','String','Lower opponent''s score:','units','normalized','Position',[0.2,0.85,0.4,0.08], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');

% create the buttons (and the rest of the interface) for the player's choice
choiceButton(5) = uicontrol('parent', bg, 'Style','togglebutton','Value', 0,'Callback','Start_round','String', sprintf('take away %d apple', stolen_apples(5)),'units','normalized','Position',[0.25,0.75,0.3,0.1], 'Backgroundcolor','y', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
choiceButton(4) = uicontrol('parent', bg, 'Style','togglebutton','Value', 0,'Callback','Start_round','String', sprintf('take away %d apples', stolen_apples(4)),'units','normalized','Position',[0.25,0.6,0.3,0.1], 'Backgroundcolor','1,1,0.3', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
choiceButton(3) = uicontrol('parent', bg, 'Style','togglebutton','Value', 0, 'Callback', 'Start_round', 'String',sprintf('take away %d apples', stolen_apples(3)),'units','normalized','Position',[0.25,0.45,0.3,0.1], 'Backgroundcolor','1,1,0.5', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
choiceButton(2) = uicontrol('parent', bg, 'Style','togglebutton','Value', 0, 'Callback', 'Start_round','String', sprintf('take away %d apple', stolen_apples(2)),'units','normalized','Position',[0.25,0.3,0.3,0.1], 'Backgroundcolor','1,1,0.8', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
choiceButton(1) = uicontrol('parent', bg, 'Style','togglebutton','Value', 0, 'Callback', 'Start_round','String', 'do not remove apples','units','normalized','Position',[0.25,0.15,0.3,0.1], 'Backgroundcolor','w', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');

set(bg, 'SelectedObject', [ ], 'Visible', 'on') 
    gain0_axes = axes('Parent', bg, 'position',[0.6,0.75,0.2,0.1], 'visible', 'off');
    imshow(apple10, 'Parent', gain0_axes)
    gain1_axes = axes('Parent', bg, 'position',[0.6,0.60,0.2,0.1], 'visible', 'off');
    imshow(apple5, 'Parent', gain1_axes)
    gain2_axes = axes('Parent', bg, 'position',[0.6,0.45,0.2,0.1], 'visible', 'off');
    imshow(apple2, 'Parent', gain2_axes)
    gain3_axes = axes('Parent', bg, 'position',[0.6,0.30,0.2,0.1], 'visible', 'off');
    imshow(apple1, 'Parent', gain3_axes)
    gain4_axes = axes('Parent', bg, 'position',[0.6,0.15,0.2,0.1], 'visible', 'off');
    imshow(apple0, 'Parent', gain4_axes)
    
%add a hidden window in order to make the script wait for the function to finish (window will be closed by function at that point).

temp_window = figure('Visible','off');

waitfor(temp_window)

clo(f)
Wait_window = uicontrol('Style','text','String',sprintf('          Round is over.\n   Evaluating your performance.\n\n\n           Please wait.'),'units', 'normalized', 'Position',[0.25,0.3,0.5,0.5],'Backgroundcolor','k', 'foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
  
%% Displays results at the end of the Snake round, with player's performance compared to opponent's, monetary gain and rank gain. 

% wait before displaying results for more credibility (jittered waiting times)   
pause(randperm(4,1)) 
clo(f)
temp_window_outcome1 = figure('Visible','off','HandleVisibility','off');

% display results
pict_axes_crown_player = axes('Parent',f,'position',[0.09,0.82,0.16,0.12], 'visible', 'off');
pict_axes_crown_opp = axes('Parent',f,'position',[0.755,0.82,0.16,0.12], 'visible', 'off');
pict_axes_player = axes('Parent',f,'position',[0.03,0.35,0.3,0.4], 'visible', 'off');
pict_axes_opp = axes('Parent',f,'position',[0.7,0.35,0.27,0.4], 'visible', 'off');
stat_axes = axes('Parent', f, 'position',[0.375,0.35,0.25,0.35], 'visible', 'off');

if outcomes(rounds) == 0 && dscore(rounds) > -1
    score_opp = round(score + 1 + dscore(rounds)./2);
elseif outcomes(rounds) == 0 && dscore(rounds) <= -1
    score_opp = round(score + 1 - dscore(rounds)./2);
elseif outcomes(rounds) == 1
   score_opp = round(score - 1 - dscore(rounds)./2);
end

if score_opp < 1
    score_opp = 0;
end  


if outcomes(rounds) ==  1
   axes(stat_axes)
   bar([score, 0],'Parent', stat_axes, 'FaceColor', 'g', 'BarWidth', 0.5, 'EdgeColor','w','LineWidth',4);
   hold on
   bar([0, score_opp], 'Parent', stat_axes, 'FaceColor', [0.6, 0.6, 0.6], 'BarWidth', 0.5, 'EdgeColor',[0.6, 0.6, 0.6],'LineWidth',4)
   set(stat_axes, 'Color', 'k', 'AmbientLightColor', 'none', 'Ytick', [], 'Xtick', [1 2], 'XtickLabel', {'You', opponent_names{rounds}}, 'FontSize', 20, 'FontName', 'FixedWidth', 'XColor', 'w', 'box', 'off')
   title(stat_axes, 'Apples total', 'FontWeight', 'bold', 'FontSize', 24, 'FontName', 'FixedWidth', 'Color', 'w')
   Outcome_window1 = uicontrol('Style','text','String',sprintf('Victory!'),'units', 'normalized', 'Position',[0.35,0.8,0.3,0.15],'Backgroundcolor','k', 'foregroundcolor', 'g', 'fontname', 'Arial', 'fontsize', 60, 'fontweight', 'bold', 'HorizontalAlignment', 'center');  
   axes(pict_axes_crown_player)
   imshow(crown)
   axes(pict_axes_opp)
   set(pict_axes_opp, 'Position', [0.7,0.25,0.27,0.4])
   imshow(opponent_image{rounds})
   axes(pict_axes_player)
   set(pict_axes_player, 'Position', [0.03,0.4,0.27,0.4])
   imshow(player_avatar)
   name_tag_opp = uicontrol('Style','text','String',sprintf('%s',opponent_names{rounds}),'units', 'normalized', 'Position',[0.7,0.08,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
   name_tag_player = uicontrol('Style','text','String',sprintf('YOU'),'units', 'normalized', 'Position',[0.03,0.23,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
   sound(win_music, Fs)
else
    axes(stat_axes)
    bar([score, 0],'Parent', stat_axes, 'FaceColor', [0.6, 0.6, 0.6], 'BarWidth', 0.5, 'EdgeColor',[0.6, 0.6, 0.6],'LineWidth',4);
    hold on
    bar([0, score_opp], 'Parent', stat_axes, 'FaceColor', 'r', 'BarWidth', 0.5, 'EdgeColor',[0.6, 0.6, 0.6],'LineWidth',4)
    set(stat_axes, 'Color', 'k', 'AmbientLightColor', 'none', 'Ytick', [], 'Xtick', [1 2], 'XtickLabel', {'You', opponent_names{rounds}}, 'FontSize', 20, 'FontName', 'FixedWidth', 'XColor', 'w', 'box', 'off')
    title(stat_axes, 'Apples total', 'FontWeight', 'bold', 'FontSize', 24, 'FontName', 'FixedWidth', 'Color', 'w')
    Outcome_window1 = uicontrol('Style','text','String',sprintf('Defeat!'),'units', 'normalized', 'Position',[0.35,0.8,0.3,0.15],'Backgroundcolor','k', 'foregroundcolor', 'r', 'fontname', 'Arial', 'fontsize', 60, 'fontweight', 'bold', 'HorizontalAlignment', 'center');
    axes(pict_axes_crown_opp)
    imshow(crown)
    axes(pict_axes_player)
    set(pict_axes_player, 'Position', [0.03,0.25,0.27,0.4])
    imshow(player_avatar)
    axes(pict_axes_opp)
    set(pict_axes_opp, 'Position', [0.7,0.4,0.27,0.4])
    imshow(opponent_image{rounds})
    name_tag_opp = uicontrol('Style','text','String',sprintf('%s',opponent_names{rounds}),'units', 'normalized', 'Position',[0.7,0.23,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
    name_tag_player = uicontrol('Style','text','String',sprintf('YOU'),'units', 'normalized', 'Position',[0.03,0.08,0.27,0.12],'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');
    sound(lose_music, Fs)
end

OK_button3 = uicontrol('Style','pushbutton','String','Continue','units', 'normalized', 'Position',[0.425,0.14,0.15,0.1],'Callback','close(temp_window_outcome1)','BackgroundColor','w', 'fontname', 'Arial', 'fontsize', 24);

waitfor(temp_window_outcome1)

%% 2nd choice window: ranking
clo(f)
temp_window_outcome2 = figure('Visible','off','HandleVisibility','off');
names{opponent_ranking(rounds)} = opponent_names{rounds};

if outcomes(rounds) == 1
    names(current_ranking) = [];
    names = [names(1:current_ranking-1-standard_rgain) '> YOU <' names(current_ranking-standard_rgain :length(names))];
    former_ranking = current_ranking;
    current_ranking = find(strncmp(names, '> YOU <', 7));
elseif outcomes(rounds) == 0
    names(current_ranking) = [];
    names = [names(1:current_ranking-1+standard_rgain) '> YOU <' names(current_ranking+standard_rgain :length(names))];
    former_ranking = current_ranking;
    current_ranking = find(strncmp(names, '> YOU <', 7));
end
    
bg2 = uibuttongroup(f, 'Visible','on','units','normalized','Position',[0 0 1 1], 'backgroundcolor', 'k', 'Position',[0 0 1 1], 'SelectedObject', []);
    
% create ranking in window
for i = 1:length(ranks)
    ranking(i) = {sprintf('%02d. %10s',ranks(i), names{i})};
end 
            

for i = former_ranking-10:former_ranking+10
    hopponent(i) = uicontrol('parent',bg2,'Style','text','String',ranking{i},'units', 'normalized','Position',[0.1,1-(0.04*(i-(former_ranking-10))+0.1),0.20,0.035], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'FixedWidth', 'fontsize', 18);
end   
    
% highlight the player's box in the ranking & add rank gain arrows
if current_ranking < former_ranking
    gain_axes = axes('parent', bg2, 'position',[0.32,0.4,0.03,0.6], 'visible', 'off');
    set(hopponent(current_ranking), 'BackgroundColor','y', 'Foregroundcolor','k', 'fontweight','bold')
    for i = current_ranking+1:former_ranking
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
    end
    imshow(arrowWreg, 'Parent', gain_axes)
elseif current_ranking > former_ranking
    gain_axes = axes('parent', bg2, 'position',[0.32,0.02,0.03,0.6], 'visible', 'off');
    set(hopponent(current_ranking), 'BackgroundColor','y', 'Foregroundcolor','k', 'fontweight','bold')
    for i = former_ranking:current_ranking-1
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
    end
    imshow(arrowLreg, 'Parent', gain_axes)
end

% create buttons for the second choice
pause(1)
    choiceButton2(5) = uicontrol('parent', bg2, 'Style','togglebutton','Value', 0,'Callback','ranking2','String',sprintf('platinum booster  $ %.2f',price(5)), 'units','normalized','Position',[0.4,0.7,0.25,0.1], 'Backgroundcolor','0,1,0', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
    choiceButton2(4) = uicontrol('parent', bg2, 'Style','togglebutton','Value', 0,'Callback','ranking2','String',sprintf('gold booster  $ %.2f',price(4)), 'units','normalized','Position',[0.4,0.55,0.25,0.1], 'Backgroundcolor','0.3,1,0.3', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
    choiceButton2(3) = uicontrol('parent', bg2, 'Style','togglebutton','Value', 0, 'Callback', 'ranking2', 'String',sprintf('silver booster  $ %.2f',price(3)),'units','normalized','Position',[0.4,0.4,0.25,0.1], 'Backgroundcolor','0.5,1,0.5', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
    choiceButton2(2) = uicontrol('parent', bg2, 'Style','togglebutton','Value', 0, 'Callback', 'ranking2','String',sprintf('bronze booster  $ %.2f',price(2)),'units','normalized','Position',[0.4,0.25,0.25,0.1], 'Backgroundcolor','0.8,1,0.8', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
    choiceButton2(1) = uicontrol('parent', bg2, 'Style','togglebutton','Value', 0, 'Callback', 'ranking2','String','standard','units','normalized','Position',[0.4,0.1,0.25,0.1], 'Backgroundcolor','w', 'Foregroundcolor', 'k', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
    
        indication_gain = uicontrol('Style','text','String','extra rank gain','units','normalized','Position',[0.7,0.85,0.2,0.08], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 20, 'fontweight', 'bold');
    
    set(bg2, 'SelectedObject', [ ], 'Visible', 'on') 
    gain0_axes = axes('Parent', bg2, 'position',[0.7,0.73,0.15,0.05], 'visible', 'off');
    imshow(arrow5, 'Parent', gain0_axes)
    gain1_axes = axes('Parent', bg2, 'position',[0.7,0.58,0.15,0.05], 'visible', 'off');
    imshow(arrow4, 'Parent', gain1_axes)
    gain2_axes = axes('Parent', bg2, 'position',[0.7,0.43,0.15,0.05], 'visible', 'off');
    imshow(arrow3, 'Parent', gain2_axes)
    gain3_axes = axes('Parent', bg2, 'position',[0.7,0.28,0.15,0.05], 'visible', 'off');
    imshow(arrow2, 'Parent', gain3_axes)