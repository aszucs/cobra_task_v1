%% Affective_scale for the beginning and the end of the game
PANAS_affects = {'Excited', 'Upset', 'Scared', 'Hostile', 'Proud', 'Irritable', 'Alert', 'Ashamed', 'Nervous', 'Determined'};

PANAS_figure = figure ('Visible','off', 'HandleVisibility','on');
PANAS_bg = uibuttongroup (f, 'visible', 'on', 'units','normalized','Position',[0.05, 0.4, 0.9, 0.08], 'HandleVisibility', 'on', 'SelectedObject', [ ], 'backgroundcolor', [0.2, 0.2, 0.2]); 
PANAS_rating = ones(5, 10);
PANAS_item = zeros(1,10);

PANAS_Instructions = uicontrol(f, 'Style', 'text', 'string', sprintf('       Indicate to what extent you feel in the following way right now:\n\n'), 'fontname', 'Arial', 'fontsize', 28, 'units','normalized','Position',[0.1, 0.68, 0.8, 0.15], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'HorizontalAlignment', 'center');



for i = 1:10
    PANAS_figure2 = figure('visible','off');
    PANAS_item(i) = uicontrol(f, 'Style', 'text', 'string', sprintf('%s', PANAS_affects{i}),'units','normalized','Position',[0.40, 0.58 0.2 0.06], 'HorizontalAlignment', 'center', 'fontname', 'Arial', 'fontsize', 28, 'fontweight','bold', 'backgroundcolor', 'y');  
    PANAS_choice1 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton','Callback', 'close(PANAS_figure2)', 'string', sprintf('Very slightly / Not at all'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.005, 0.1, 0.22, 0.8], 'backgroundcolor', 'w');
    PANAS_choice2 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton', 'Callback', 'close(PANAS_figure2)', 'string', sprintf('A little'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.235, 0.1, 0.18, 0.8], 'backgroundcolor', 'w');
    PANAS_choice3 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton', 'Callback', 'close(PANAS_figure2)', 'string', sprintf('Moderately'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.425, 0.1, 0.18, 0.8], 'backgroundcolor', 'w');
    PANAS_choice4 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton', 'Callback', 'close(PANAS_figure2)', 'string', sprintf('Quite a bit'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.615, 0.1, 0.19, 0.8], 'backgroundcolor', 'w');
    PANAS_choice5 = uicontrol('parent', PANAS_bg, 'Style', 'togglebutton', 'Callback', 'close(PANAS_figure2)', 'string', sprintf('Extremely'), 'fontname', 'Arial', 'fontsize', 18, 'units','normalized','Position',[0.815, 0.1, 0.18, 0.8], 'backgroundcolor', 'w');
    waitfor(PANAS_figure2)
    PANAS_rating(:,i) = [get(PANAS_choice1, 'Value'); get(PANAS_choice2, 'Value'); get(PANAS_choice3, 'Value');get(PANAS_choice4, 'Value');get(PANAS_choice5, 'Value')];
end

score_factor = ones(5,10);
for n = 1:5
score_factor(n,:) = n;
end

PANAS_rating = PANAS_rating.*score_factor;
if panas_count == 1
panas_rating1 = sum(PANAS_rating);
elseif panas_count == 2
panas_rating2 = sum(PANAS_rating);
end

PANAS_ThankYou = uicontrol(f, 'Style', 'text', 'string', sprintf('Thank you!'), 'fontname', 'Arial', 'fontsize', 28, 'units','normalized','Position',[0.3, 0.25, 0.4, 0.1], 'backgroundcolor', 'k', 'foregroundcolor', 'w', 'HorizontalAlignment', 'center');
PANAS_OKbutton = uicontrol(f, 'Style', 'pushbutton', 'string', sprintf('Press to continue'), 'Callback', 'close(PANAS_figure)', 'fontname', 'Arial', 'fontsize', 24, 'units','normalized','Position',[0.4,0.1,0.2,0.1], 'backgroundcolor', 'g', 'HorizontalAlignment', 'center');
    

