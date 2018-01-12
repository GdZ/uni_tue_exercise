function [fixations] = dependece(data)
	%% get a item from data

	idx = [100 200 300 400 500];
	idx_x = [];
	idx_y = [];

	for j=1:length(data)
		%% if this item belongs to the letter from letter list
		cur = data(j,:);
		%% save the idx of x
		for i=1:length(idx)
			if cur(1) < idx(i) && cur(3) > 150
				idx_x = [idx_x i];
				break;
			end
		end
		%% save the idx of y
		for i=1:length(idx)
			if cur(1) < idx(i) && cur(3) > 150
				idx_y = [idx_y i];
				break;
			end
		end
	end
	%% fixation
	%%% 4.2 ex3-without-dependece.txt
	pos = (idx_x-1)*5+idx_y;
	fixations = [ idx_x' idx_y' pos'];

end
