function [matrixScores] = scanMatchWithGaps(str1, str2)
	costs = [];
	results = [];
	alignments = [];
	gap = -3.2;

	%% a. use the mean of all negative cost entries in the cost tables as gap cost(-3.2)
	%% b. create matrixScores with size(m+1, n+1)
	nr_x = length(str1)+1;
	nr_y = length(str2)+1;
	matrixScores = zeros(nr_x, nr_y);
	matrixTrack = zeros(nr_x, nr_y);

	for y=1:length(matrixScores(1,:))
		matrixScores(1,y) = (y-1)*gap;
	end
	for x=1:length(matrixScores(:,1))
		matrixScores(x,1) = (x-1)*gap;
	end
	%matrixScores(1,:)
	%matrixScores(:,1)

	%% e. calculate:
	%%% i. matrixScores[i-1,j]+gap
	%%% ii. matrixScores[i,j-1]+gap
	%%% iii. matrixScores[i-1,j-1] + difference costs of letters from first
	%%%    string letter cost table
	for x=2:nr_x %% second string
		for y=2:nr_y %% first string
			i1j = matrixScores(x-1,y)+gap;
			ij1 = matrixScores(x,y-1)*gap;
			diff = getPenalty(str1(x-1), str2(y-1));
			i1j1 = matrixScores(x-1,y-1)+diff;
			max_value = max([i1j ij1 i1j1]);
			matrixScores(x,y) = max_value;
		end
	end

end