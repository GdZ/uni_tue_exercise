function [fixations] = dependece(data)
	%% get a item from data
	IDX_X = 1;
	IDX_Y = 2;
	IDX_DURATION = 3;
	IDX_POS = 4;

	idx_x = [];
	idx_y = [];
	fixations = [];
	rows = [];
	ids = [];

	idx = [100 200 300 400 500];

	% ========================================================================
	x = data(:, IDX_X);
	y = data(:, IDX_Y);
	duration = data(:, IDX_DURATION);

	%% find the row number of the item
	[rows, ids] = find(idx>data(:, IDX_X));
	list_x = sortrows([rows, ids], IDX_X);
	[rows, ids] = find(idx>data(:, IDX_Y));
	list_y = sortrows([rows, ids], IDX_Y);
	%% filter 1st index
	for nr=1:length(data)
		idx_x = [ idx_x min(list_x(find(list_x(:, IDX_X) == nr), IDX_Y))];
		idx_y = [ idx_y min(list_y(find(list_y(:, IDX_X) == nr), IDX_Y))];
	end

	%% find the position in letter
	pos = (idx_x-1)*5+idx_y;

	%% create the new fixations list
	fixations = [ idx_x', idx_y', duration, pos' ];
	%fixations = [ data, pos' ];

	%% when smaller than 150ms, delete this letter
	fixations = fixations(find(data(:,3) > 150),:);
end
