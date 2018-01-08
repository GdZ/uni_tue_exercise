clc;
clear;

% global define begin
SELF_GAZE_FILE = 'self-gaze.data';
% end

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

gaze = importdata(SELF_GAZE_FILE);
gaze_data = gaze.data;
eye_left = gaze_data(:, [ TIME LX LY ]);
eye_right = gaze_data(:, [ TIME RX RY ]);


