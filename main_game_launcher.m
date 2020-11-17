%% Main window at the beginning of the game
clear all
close all

addpath('functions');

%assign a separate window for the game
g = figure('Visible','on','MenuBar','none','Toolbar', 'none', 'handleVisibility', 'on', 'units','normalized','Position',[0 0 1 1], 'color', 'k', 'Name','Snake Competition','NumberTitle','off');
set(gca,'visible','off');

%starting value of estimated rank
estimated_rank = NaN;

%% loading media files
% opponents (the M of oppM stands for "male", and the F of oppF for "female")
oppEx = imread('medias/anonymous1ex.png');
oppM1 = imread('medias/anonymous2.png');
oppM2 = imread('medias/anonymous3.png');
oppM3 = imread('medias/anonymous4.png');
oppM4 = imread('medias/anonymous5.png');
oppM5 = imread('medias/anonymous6.png');
oppM6 = imread('medias/anonymous7.png');
oppM7 = imread('medias/anonymous8.png');
oppM8 = imread('medias/anonymous9.png');
oppM9 = imread('medias/anonymous14.png');
oppM10 = imread('medias/anonymous15.png');
oppM11 = imread('medias/anonymous16.png');
oppM12 = imread('medias/anonymous17.png');
oppF1 = imread('medias/anonymous2F.png');
oppF2 = imread('medias/anonymous3F.png');
oppF3 = imread('medias/anonymous4F.png');
oppF4 = imread('medias/anonymous5F.png');
oppF5 = imread('medias/anonymous6F.png');
oppF6 = imread('medias/anonymous7F.png');
oppF7 = imread('medias/anonymous8F.png');
oppF8 = imread('medias/anonymous10F.png');
oppF9 = imread('medias/anonymous14F.png');
oppF10 = imread('medias/anonymous15F.png');
oppF11 = imread('medias/anonymous16F.png');
oppF12 = imread('medias/anonymous17F.png');

%player avatars
playM1 = imread('medias/anonymous10.png');
playM2 = imread('medias/anonymous11.png');
playM3 = imread('medias/anonymous12.png');
playM4 = imread('medias/anonymous13.png');
playF1 = imread('medias/anonymous9F.png');
playF2 = imread('medias/anonymous11F.png');
playF3 = imread('medias/anonymous12F.png');
playF4 = imread('medias/anonymous13F.png');

%apples for the apple-stealing part
apple0 = imread('medias/apples0.png');
apple1 = imread('medias/apples1.png');
apple2 = imread('medias/apples2.png');
apple5 = imread('medias/apples3.png');
apple10 = imread('medias/apples5.png');

%arrows for the rank gain part
arrow5 = imread('medias/arrows5.png');
arrow5v = imread('medias/arrows5v.png');
arrow5vL = imread('medias/arrows5vL.png');
arrow4 = imread('medias/arrows3.png');
arrow4v = imread('medias/arrows3v.png');
arrow4vL = imread('medias/arrows4vL.png');
arrow3 = imread('medias/arrows2.png');
arrow3v = imread('medias/arrows2v.png');
arrow3vL = imread('medias/arrows3vL.png');
arrow2 = imread('medias/arrows1.png');
arrow2v = imread('medias/arrows1v.png');
arrow2vL = imread('medias/arrows2vL.png');
arrow1 = imread('medias/arrows0.png');
arrow1v = imread('medias/arrows0v.png');
arrow1vL = imread('medias/arrows1vL.png');
arrowWreg = imread('medias/arrows1vwhite.png');
arrowLreg = imread('medias/arrows1vLwhite.png');
arrowLmin = imread('medias/arrows1L.png');
arrowL1 = imread('medias/arrows3L.png');
arrowL2 = imread('medias/arrows4L.png');
arrowL3 = imread('medias/arrows5L.png');
arrowLmax = imread('medias/arrowsfullL.png');

%crown image & winning/losing music for the outcome window
crown = imread('medias/crown.png');

[win_music, Fs] = audioread('medias/win.wav');
[lose_music, Fs] = audioread('medias/lose.wav');

%% settings
%game outcomes
outcomes = [1 0 0 1 0 0 0 1 0 1 0 0 1 0 1 0 0 0 1 0 1 0 0 0];
dscore = [20    -3    -2     3    -2     9    -7     1    -9     5     1     1     0    17     5     1    -4     2    18    -9     2    -3     1    -9];
dclose=ismember(dscore, -2:2);
game_length = length(outcomes);

%ranking
names = importdata('names-young.txt')';
ranking_length = length(names);
starting_rank = 100;

%opponents
opponent_names ={'LEE' 'Shirley'    'karen77'    'Ed'    'emma'    'Nate'    'taylor'     'BRAD'    'anthonY'    'linda'    'Vivian'    'mona'    'George'    'matt'    'Carrie'    'ScoTT' 'kev88' 'Janice1' 'rebecca' 'STEVE' 'larry' 'Pam' 'kim' 'branD'};
opponent_ranking = [92     4   132    10    65    24   118   104     2    54   189    98    87   196     7    80    46   114   127    43   189    58   192   185];
opponent_image = {oppM4 oppF1 oppF5 oppM1 oppF3 oppM2 oppF4 oppM7 oppM3 oppF6 oppF2 oppF7 oppM6 oppM5 oppF8 oppM8 oppM9 oppF9 oppF10 oppM10 oppM11 oppF11 oppF12 oppM12};

%apples
stolen_apples = [0 1 2 5 10];
stolen_apples_image = {apple0 apple1 apple2 apple5 apple10};

%rank gain
standard_rgain = 5;
purchased_rgain = [0 1 2 3 5];
choice2_string = {'no booster', 'bronze booster', 'silver booster', 'gold booster', 'platinum booster'};
price = [0 1 2 5 10];

%money gain
endowment = 20;
final_earning = 25;

%% Loads main menu.
main_window