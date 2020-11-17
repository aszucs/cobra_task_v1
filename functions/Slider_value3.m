function Slider_value3(src,~)
    %displays slider value for the player's estimation of his performance before the game.
    rank_answer = 203-round((get(src,'Value')+0.01)*200);
    if rank_answer > 200
        rank_answer = 200;
    end
    amount_window = uicontrol('Style', 'text', 'units', 'normalized', 'Position',[0.4,0.4,0.25,0.2], 'BackgroundColor', 'w', 'fontname', 'Arial', 'fontsize', 30, 'fontweight','bold');
    set(amount_window, 'string', sprintf('  I can reach\n     rank %d   \n   out of 200',rank_answer))

end