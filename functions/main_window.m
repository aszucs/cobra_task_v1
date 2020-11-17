%Main menu interface (beginning of the game)

clo(g)

logo=imread('medias/snake_logo_small2.png');
axes('position',[0.4,0.47,0.2,0.05])
imshow(logo)


Practice_Indications = uicontrol('Style','text','String',sprintf(' Welcome to the snake game competition!'), 'units', 'normalized', 'Position',[0.1,0.52,0.8,0.28],'Backgroundcolor', 'k', 'ForegroundColor','w', 'fontname', 'Arial', 'fontsize', 60, 'HorizontalAlignment', 'center');
Practice_Choice_button1 = uicontrol('Style','pushbutton','String','Competition rules', 'Callback', 'practice_ranking','units', 'normalized', 'Position',[0.1,0.25,0.2,0.08],'BackgroundColor','y', 'fontsize', 24);
Practice_Choice_button2 = uicontrol('Style','pushbutton','String','Snake Practice', 'Callback', 'practice_snake','units', 'normalized', 'Position',[0.7,0.25,0.2,0.08],'BackgroundColor','g', 'fontsize', 24); 
Practice_Choice_button3 = uicontrol('Style','pushbutton','String','START', 'Callback', 'ID_page','units', 'normalized', 'Position',[0.4,0.25,0.2,0.08],'BackgroundColor','w', 'fontsize', 24); 



