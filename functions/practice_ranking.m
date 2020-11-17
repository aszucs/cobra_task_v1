%%Instructions to the game task.
%% Indication 1 - Whole task
clo(g)
temp_window4 = figure('Visible', 'off');

Practice_ranking_Indications = uicontrol(g, 'Style','text','String',sprintf('In this task, you will be playing a competitive game called Snake on the computer. In this game, you will direct a snake around a screen to eat (run into) as many apples (red dots) as you can.\n\nEach apple eaten will earn you one point, and you win the round by eating more apples than your opponent.\n                                 You will play %d rounds in total.', length(outcomes)),'units', 'normalized', 'Position',[0.05,0.25,0.9,0.65],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
Practice_OK_button3 = uicontrol(g, 'Style','pushbutton','String','Continue','Callback', 'close(temp_window4)', 'units', 'normalized', 'Position',[0.425,0.13,0.15,0.1],'BackgroundColor','w', 'Foregroundcolor', 'k', 'fontsize', 24); 

waitfor(temp_window4)

%% Indication 2 - Snake ranking
clo(g)
temp_window4a = figure('Visible', 'off');

Practice_ranking_Indications = uicontrol(g, 'Style','text','String',sprintf('Each participant who has completed the game has been ranked in order of performance. To determine your rank, you will compete against previous participants whose scores have been pre-recorded.\n\n                            You will start at rank %d out of %d.', starting_rank, ranking_length),'units', 'normalized', 'Position',[0.05,0.25,0.9,0.65],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
Practice_OK_button3 = uicontrol(g, 'Style','pushbutton','String','Continue','Callback', 'close(temp_window4a)', 'units', 'normalized', 'Position',[0.425,0.13,0.15,0.1],'BackgroundColor','w', 'Foregroundcolor', 'k', 'fontsize', 24); 

waitfor(temp_window4a)

%% Indication 2b - Snake ranking
clo(g)
temp_window4c = figure('Visible', 'off');

Practice_ranking_Indications = uicontrol(g, 'Style','text','String',sprintf('On each round, your score will be compared to your opponent''s:\n\n- If you win the round, you will move up %d ranks.\n\n- If you lose the round, you will move down %d ranks.', standard_rgain, standard_rgain),'units', 'normalized', 'Position',[0.05,0.4,0.9,0.4],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
Practice_OK_button3 = uicontrol(g, 'Style','pushbutton','String','Continue','Callback', 'close(temp_window4c)', 'units', 'normalized', 'Position',[0.425,0.28,0.15,0.1],'BackgroundColor','w', 'Foregroundcolor', 'k', 'fontsize', 24); 

waitfor(temp_window4c)

%% Indications 3 - Snake ranking
clo(g)
temp_window4b = figure('Visible', 'off');

Practice_ranking_Indications = uicontrol(g, 'Style','text','String',sprintf('Beware! Many players steal apples from their opponent to help increase their own chance of victory. Before starting a round, you will be asked how many apples, if any, you would like to take from your opponent.\n\nIn the end, the final apple counts will be displayed without indicating if any were stolen. Note that the apples you take are not added to your own score, just removed from your opponent''s score.'),'units', 'normalized', 'Position',[0.05,0.25,0.9,0.65],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
Practice_OK_button3 = uicontrol(g, 'Style','pushbutton','String','Continue','Callback', 'close(temp_window4b)', 'units', 'normalized', 'Position',[0.425,0.13,0.15,0.1],'BackgroundColor','w', 'Foregroundcolor', 'k', 'fontsize', 24); 

waitfor(temp_window4b)

%% Indication 4b - Snake ranking2
clo(g)

Practice_ranking_Indications = uicontrol(g, 'Style','text','String',sprintf('If, after completing a round, you would like to improve your rank, you will be given the opportunity to do so by purchasing boosters.\n\nOn each round, you will have up to $ %.2f to keep or spend on boosters. At the end of the game, your actual reward for participating in this game will be calculated based on the remaining money from three randomly selected rounds.', endowment),'units', 'normalized', 'Position',[0.05,0.25,0.9,0.65],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
Practice_OK_button3 = uicontrol(g, 'Style','pushbutton','String','Got it!','Callback', 'main_window', 'units', 'normalized', 'Position',[0.425,0.13,0.15,0.1],'BackgroundColor','g', 'Foregroundcolor', 'k', 'fontsize', 24);
