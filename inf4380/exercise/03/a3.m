clc;
clear;
%% global const variables
GL_DATA_FILE_EX1 = 'ex1.txt';
GL_DATA_FILE_EX2 = 'ex2.txt';
GL_DATA_FILE_EX3 = 'ex3.txt';
GL_DATA_IMG_LETTER = 'letter.jpg';
GL_IDX_X = 1;
GL_IDX_Y = 2;
GL_IDX_DURATION = 3;
GL_IDX_POS = 4;

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

letter = 'ABCDEFGHIJKLMNOPQRSTUVWXY';

% =============================================================
%%% exercise 3.4.1 ex1-without-dependece.txt
ex1_without_fixations = nodependece(data_ex1);
ex1_without_dependece = letter(ex1_without_fixations(:, 4)') %'

%%% exercise 3.4.2 ex2-without-dependece.txt
ex2_without_fixations = nodependece(data_ex2);
ex2_without_dependece = letter(ex2_without_fixations(:, 4)') %'

%%% exercise 3.4.3 ex3-without-dependece.txt
ex3_without_fixations = nodependece(data_ex3);
ex3_without_dependece = letter(ex3_without_fixations(:, 4)') %'

%%% exercise 3.4.1 ex1-without-dependece.txt
ex1_with_fixations = dependece(data_ex1);
ex1_with_output = dispLetter(ex1_with_fixations)

%%% exercise 3.4.2 ex2-without-dependece.txt
ex2_with_fixations = dependece(data_ex2);
ex2_with_output = dispLetter(ex2_with_fixations)

%%% exercise 3.4.3 ex3-without-dependece.txt
ex3_with_fixations = dependece(data_ex3);
ex3_with_output = dispLetter(ex3_with_fixations)

% =============================================================
%% exercise 4.2
%%% use ex1/2/3_with_dependece
ex1_with_costs = getCost(ex1_with_output)
ex2_with_costs = getCost(ex2_with_output)
ex3_with_costs = getCost(ex3_with_output)

%% exercise 4.3
ex1_without_costs = getCost(ex1_without_dependece)
ex2_without_costs = getCost(ex2_without_dependece)
ex3_without_costs = getCost(ex3_without_dependece)
diff_1_2 = ex1_without_costs - ex2_without_costs
diff_1_3 = ex1_without_costs - ex3_without_costs
diff_2_3 = ex2_without_costs - ex3_without_costs

%% exercise 4.4
norm_1_2 = max(ex1_with_costs)*length(ex1_with_costs)
norm_1_3 = max(ex2_with_costs)*length(ex2_with_costs)
norm_2_3 = max(ex3_with_costs)*length(ex3_with_costs)
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
scanMatchWithGaps(ex1_with_output, ex2_with_output);
scanMatchWithGaps(ex1_with_output, ex3_with_output);
scanMatchWithGaps(ex2_with_output, ex3_with_output);
