clc;
clear;
%% global const variables
GL_DATA_FILE_EX1 = 'ex1.txt';
GL_DATA_FILE_EX2 = 'ex2.txt';
GL_DATA_FILE_EX3 = 'ex3.txt';
GL_DATA_IMG_LETTER = 'letter.jpg';

%%% import area -------------
data_ex1 = [];
data_ex2 = [];
data_ex3 = [];

%%% result area -------------
ex1_without_dependece = [];
ex2_without_dependece = [];
ex3_without_dependece = [];
ex1_with_dependece = [];
ex2_with_dependece = [];
ex3_with_dependece = [];

%% read fixations from local files
data_ex1 = read_fixation_list(GL_DATA_FILE_EX1);
data_ex2 = read_fixation_list(GL_DATA_FILE_EX2);
data_ex3 = read_fixation_list(GL_DATA_FILE_EX3);

idx = [100 200 300 400 500];
letter = 'ABCDEFGHIJKLMNOPQRSTUVWXY';

idx_txt = [50 150 250 350 450];
idx_letter = {0,100,400,500; 100,200,400,500; 200,300,400,500; 300,400,400,500; 400,500,400,500;...
			0,100,300,400; 100,200,300,400; 200,300,300,400; 300,400,300,400; 400,500,300,400; ...
			0,100,200,300; 100,200,200,300; 200,300,200,300; 300,400,200,300; 400,500,200,300; ...
			0,100,100,200; 100,200,100,200; 200,300,200,300; 300,400,100,200; 400,500,100,200; ...
			  0,100,0,100;   100,200,0,100;   200,300,0,100;   300,400,0,100;   400,500,0,100};

% =============================================================
%%% exercise 3.4.1 ex1-without-dependece.txt
ex1_without_fixations = nodependece(data_ex1);
ex1_without_dependece = letter(ex1_without_fixations(:,3)')

%%% exercise 3.4.2 ex2-without-dependece.txt
ex2_without_fixations = nodependece(data_ex2);
ex2_without_dependece = letter(ex2_without_fixations(:,3)')

%%% exercise 3.4.3 ex3-without-dependece.txt
ex3_without_fixations = nodependece(data_ex3);
ex3_without_dependece = letter(ex3_without_fixations(:,3)')

%%% exercise 3.4.1 ex1-without-dependece.txt
ex1_with_fixations = dependece(data_ex1);
ex1_with_dependece = letter(ex1_with_fixations(:,3)')

%%% exercise 3.4.2 ex2-without-dependece.txt
ex2_with_fixations = dependece(data_ex2);
ex2_with_dependece = letter(ex2_with_fixations(:,3)')

%%% exercise 3.4.3 ex3-without-dependece.txt
ex3_with_fixations = dependece(data_ex3);
ex3_with_dependece = letter(ex3_with_fixations(:,3)')

% =============================================================
%% exercise 4.2
%%% use ex1/2/3_with_dependece
ex1_with_costs = costs(ex1_with_fixations)
ex2_with_costs = costs(ex2_with_fixations)
ex3_with_costs = costs(ex3_with_fixations)

%% exercise 4.3
ex1_without_costs = costs(ex1_without_fixations)
ex2_without_costs = costs(ex2_without_fixations)
ex3_without_costs = costs(ex3_without_fixations)
diff_1_2 = ex1_without_costs - ex2_without_costs
diff_1_3 = ex1_without_costs - ex3_without_costs
diff_2_3 = ex2_without_costs - ex3_without_costs

%% exercise 4.4
max(ex1_with_costs)*length(ex1_with_costs)
max(ex2_with_costs)*length(ex2_with_costs)
max(ex3_with_costs)*length(ex3_with_costs)
%norm(ex1_with_costs,1)
%norm(ex2_with_costs,1)
%norm(ex3_with_costs,1)

% =============================================================
%% exercise 5
%% use the string with duration dependence here
%% Needleman-Wunsch algorithm
%%   a. use the mean of all negative cost entries in the cost tables as gap
%% cost(-3.2).
%%   b. Create matrix with size(m+1, n+1) where m is the length of the first
%% string and n the length of the second string.
%%   c. Initialize matrix as shown in Figure 3.
%%   d. Start in the top left empty cell.
%%   e. Calculate:
%%      i. Matrix[i-1, j] + gap
%% 		ii. Matrix[i, j-1] + gap
