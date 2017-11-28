clc;
clear;

%% global file variables
GL_DATA_FILE = 'data.csv';
GL_IMAGE_FILE = 'stimuli.jpg';
GL_IMG_OUT_FILE = 'eyes-overlay.jpg';
GL_RATIO_OUT_FILE = 'ratio.txt';
GL_ANGLE_OUT_FILE = 'angle.txt';
GL_VERGENCE_OUT_FILE = 'vergence.txt';

%% useful const variable
%%% 2.2
TIME = 1;
LX = 2;
LY = 3;
FLAG_LVALID = 6;
RX = 7;
RY = 8;
FLAG_RVALID = 11;

%%% 2.3.
WIDTH = 500;
HEIGTH = 300;

%% exercise 02
%%% import data
orgData = importdata(GL_DATA_FILE);

%%% import image
img = imread(GL_IMAGE_FILE);
img_size = size(img);
img_row_size = img_size(1,1);
img_col_size = img_size(1,2);

%%% deal with data
data = orgData.data;
left_data = data;
right_data = data;

%%% 2.3 begin
disp('exericse 2.3 ......');
ratio_width =  WIDTH / img_col_size;
radio_height = HEIGTH / img_row_size;
fprintf('ratio_width: %f pixel/mm, ratio_height: %f pixel/mm\n', ratio_width, radio_height);
disp('exericse 2.3 finished......');
%%% end

%%% 2.4 begin
disp('exericse 2.4 ......');
% angle = 2*atand((1000/ratio_width)/(2*600));
angle = 2*atand(1000/(ratio_width*2*600));
fprintf('angle:%f\n', angle);
disp('exericse 2.4 finished......');
%%% end

%%% E2.2
%%%% delete not valid data, store new data in left_data
left_ids = find(0==left_data(:,FLAG_LVALID));
left_data(left_ids, :) = [];
left_size = size(left_data);
left_row_size = left_size(1,1);
left_col_size = left_size(1,2);

%%%% delete not valid data, store new data in right_data
right_ids = (0==right_data(:,FLAG_RVALID));
right_data(right_ids, :) = [];
right_size = size(right_data);
right_row_size = right_size(1,1);
right_col_size = right_size(1,2);

%% ------------------------------------------------------------
%%%% all of the output is in here
%%%% exercise 2.2
disp('exericse 2.2 begin to draw image....');
tic;
%%%% show base photo
imshow(img);
%%% beginn to draw eyes track
hold on;
%%%% display left
l_s = scatter(left_data(:, LX), left_data(:, LY));
l_s.LineWidth = 0.6;
l_s.MarkerEdgeColor = 'b';
l_s.MarkerFaceColor = [0 .5 .5];
%%%% display right
r_s = scatter(right_data(:, RX), right_data(:, RY));
r_s.LineWidth = 0.6;
r_s.MarkerEdgeColor = 'r';
r_s.MarkerFaceColor = [0 .5 .5];

disp('exericse 2.2 finished....');
hold off;
toc;
% imsave;
%%%% exercise 2.3
%%%% exercise 2.4
%%%% exercise 2.5
disp('exericse 2.5 begin.....');
AB = 64;
CE = 600;
DF = 10;
vergence = (AB*CE)/(AB+DF);
fprintf('vergence:%f\n', vergence);
disp('exericse 2.5 finished.....');
