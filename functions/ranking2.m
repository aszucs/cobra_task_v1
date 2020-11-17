%% outcome window3

chosenButton = {getfield(bg2.SelectedObject,'String')};
if strcmp(chosenButton{1},'standard')
     choice2(rounds) = 1;
else
    choice2(rounds) = find(price==sscanf(chosenButton{1},'%*s %*s %*s %f'));
end
 
clo(f)

if choice2(rounds) == 5 
        names(current_ranking) = [];
        names = [names(1:current_ranking-1-purchased_rgain(5)) '> YOU <' names(current_ranking-purchased_rgain(5) :length(names))];
        choice_arrowW = arrow5v;
elseif choice2(rounds) == 4 
        names(current_ranking) = [];
        names = [names(1:current_ranking-1-purchased_rgain(4)) '> YOU <' names(current_ranking-purchased_rgain(4) :length(names))];
        choice_arrowW = arrow4v;
elseif choice2(rounds) == 3 
        names(current_ranking) = [];
        names = [names(1:current_ranking-1-purchased_rgain(3)) '> YOU <' names(current_ranking-purchased_rgain(3) :length(names))];
        choice_arrowW = arrow3v;
elseif choice2(rounds) == 2 
        names(current_ranking) = [];
        names = [names(1:current_ranking-1-purchased_rgain(2)) '> YOU <' names(current_ranking-purchased_rgain(2) :length(names))];
        choice_arrowW = arrow2v;
elseif choice2(rounds) == 1 
        names(current_ranking) = [];
        names = [names(1:current_ranking-1-purchased_rgain(1)) '> YOU <' names(current_ranking-purchased_rgain(1) :length(names))];
        choice_arrowW = arrow1v;
end 

former_ranking2 = former_ranking;
former_ranking = current_ranking;
current_ranking = find(strncmp(names, '> YOU <', 7));
%current_ranking = strmatch('> YOU <', names);
delta_rank(rounds) = former_ranking2 - current_ranking;



%create ranking in window
for i = 1:length(ranks)
    ranking(i) = {sprintf('%02d. %10s',ranks(i), names{i})};
end 
            

for i = former_ranking2-10:former_ranking2+10
    hopponent(i) = uicontrol('Style','text','String',ranking{i},'units', 'normalized','Position',[0.4,1-(0.04*(i-(former_ranking2-10))+0.1),0.20,0.035], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'FixedWidth', 'fontsize', 18);
end

% highlight the player's box in the ranking & add rank gain arrows
if current_ranking == former_ranking2
    if outcomes(rounds) == 1
        for i = current_ranking+1:former_ranking2
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
        end
    gain_axes = axes('position',[0.36,0.4,0.03,0.6], 'visible', 'off');
    imshow(choice_arrowW, 'Parent', gain_axes)
    else
        for i = current_ranking+1:former_ranking
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
        end
    gain_axes = axes('position',[0.36,0.25,0.03,0.6], 'visible', 'off');
    imshow(choice_arrowW, 'Parent', gain_axes)
    end
    set(hopponent(current_ranking),'BackgroundColor','y', 'Foregroundcolor', 'k', 'fontweight','bold')
elseif current_ranking < former_ranking2
    gain_axes = axes('position',[0.36,0.4,0.03,0.6], 'visible', 'off');
    imshow(choice_arrowW, 'Parent', gain_axes)
    if outcomes(rounds) == 1
        for i = former_ranking:former_ranking2
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
        end
    else
        for i = former_ranking2:former_ranking
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
        end
    end
    set(hopponent(current_ranking), 'BackgroundColor','y', 'Foregroundcolor','k', 'fontweight','bold')
elseif current_ranking > former_ranking2
    gain_axes = axes('position',[0.36,0.25,0.03,0.6], 'visible', 'off');
    if outcomes(rounds) == 1
        for i = former_ranking:former_ranking2
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
        end
    else
        for i = former_ranking2:former_ranking
        set(hopponent(i), 'BackgroundColor','0.30 0.30 0.30')
        end
    end
    set(hopponent(current_ranking), 'BackgroundColor','y', 'Foregroundcolor','k', 'fontweight','bold')
    imshow(choice_arrowW, 'Parent', gain_axes)
end

indication_gain = uicontrol('Style','text','String',sprintf('%s purchased:', choice2_string{choice2(rounds)}),'units','normalized','Position',[0.05,0.35,0.3,0.2], 'Backgroundcolor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 24, 'fontweight', 'bold');

% confirmation button
ranking2_button = uicontrol('Style','pushbutton','String','Next round','units', 'normalized', 'Position',[0.75,0.45,0.2,0.1],'Callback','End_round','BackgroundColor','w', 'fontname', 'Arial', 'fontsize', 24);
