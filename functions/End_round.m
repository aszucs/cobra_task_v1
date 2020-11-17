%% Stores player's choice in .csv file, makes transition between rounds

% saves information about the round in the player.csv file.
fprintf(fmain,'\n%s;%s;%d;%s;%d;%d;%s;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%d;%s;%d;%d;%d;%d;%d', player_ID, player_name, player_gender, player_age, game_exp, estimated_rank, chosen_avatar, consent_choice, snake_level, panas_rating1, rounds, score_true, score_opp, dscore(rounds), outcomes(rounds), dclose(rounds), opponent_names{rounds}, opponent_ranking(rounds), former_ranking, current_ranking, choice(rounds), choice2(rounds));

% sends the player back to the loop of "round_counter" to begin next round.
clo(f)
set(temp_window2, 'HandleVisibility','on')
if rounds == tot_rounds
 nextround_text = uicontrol('Style','text','String',sprintf('Game completed.\n  Please wait.'),'units', 'normalized', 'Position',[0.25,0.35,0.5,0.4],'BackgroundColor','k', 'Foregroundcolor', 'g', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
else   
 nextround_text = uicontrol('Style','text','String',sprintf('Loading the next round.\n\nYou start with $ %.2f.', endowment),'units', 'normalized', 'Position',[0.25,0.35,0.5,0.4],'BackgroundColor','k', 'Foregroundcolor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'HorizontalAlignment', 'center');
end
pause(randperm(3,1))

close(temp_window2)