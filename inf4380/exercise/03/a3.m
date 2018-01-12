clc;
clear;
%% global const variables
GL_DATA_FILE_EX1 = 'ex1.txt';
GL_DATA_FILE_EX2 = 'ex2.txt';
GL_DATA_FILE_EX3 = 'ex3.txt';
GL_DATA_IMG_LETTER = 'letter.jpg';

data_ex1 = [];
data_ex2 = [];
data_ex3 = [];

data_ex1 = read_fixation_list(GL_DATA_FILE_EX1);
data_ex2 = read_fixation_list(GL_DATA_FILE_EX2);
data_ex3 = read_fixation_list(GL_DATA_FILE_EX3);

idx = [100 200 300 400 500];
idx_txt = [50 150 250 350 450];
letter = 'ABCDEFGHIJKLMNOPQRSTUVWXY';
idx_letter = {0,100,400,500; 100,200,400,500; 200,300,400,500; 300,400,400,500; 400,500,400,500;...
			0,100,300,400; 100,200,300,400; 200,300,300,400; 300,400,300,400; 400,500,300,400; ...
			0,100,200,300; 100,200,200,300; 200,300,200,300; 300,400,200,300; 400,500,200,300; ...
			0,100,100,200; 100,200,100,200; 200,300,200,300; 300,400,100,200; 400,500,100,200; ...
			  0,100,0,100;   100,200,0,100;   200,300,0,100;   300,400,0,100;   400,500,0,100};

%% 3.1
%figure(1);
%hold on;
% x-line
%for x=1:length(idx)
%	line([idx(x),idx(x)],[1,500], 'LineWidth', 5.0, 'color', 'black');
%end
% y-line
%for y=1:length(idx)
%	line([1,500],[idx(y),idx(y)], 'LineWidth', 5.0, 'color', 'black');
%end

%% 3.2
% draw text
for i=1:length(idx_txt)
	for j=1:length(idx_txt)
		[i j (i-1)*5+j];
		%idx_cur = (i-1)*5+j;
		%text = letter[idx_cur];
	end
end

%%% exercise 3.4.1 ex1-without-dependece.txt
fixations = nodependece(data_ex1);
ex1_without_dependece = letter(fixations(:,4)')

%%% exercise 3.4.2 ex2-without-dependece.txt
fixations = nodependece(data_ex2);
ex2_without_dependece = letter(fixations(:,4)')

%%% exercise 3.4.3 ex3-without-dependece.txt
fixations = nodependece(data_ex3);
ex3_without_dependece = letter(fixations(:,4)')

%%% exercise 3.4.1 ex1-without-dependece.txt
fixations = dependece(data_ex1);
ex1_with_dependece = letter(fixations(:,3)')

%%% exercise 3.4.2 ex2-without-dependece.txt
fixations = dependece(data_ex2);
ex2_with_dependece = letter(fixations(:,3)')

%%% exercise 3.4.3 ex3-without-dependece.txt
fixations = dependece(data_ex3);
ex3_with_dependece = letter(fixations(:,3)')

