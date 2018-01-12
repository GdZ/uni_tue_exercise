function [fixations] = dependece(data)
	%% get a item from data

	idx = [100 200 300 400 500];
	idx_x = [];
	idx_y = [];
	x = data(:,1);
	y = data(:,2);
	duration = data(:, 3);

	%% idx_x
	rows = [];
	ids = [];

	[rows, ids] = find(idx>data(:,1));
	list_x = sortrows([rows, ids], 1);
	[rows, ids] = find(idx>data(:,2));
	list_y = sortrows([rows, ids], 2);
	for nr=1:length(data)
		idx_x = [ idx_x min(list_x(find(list_x(:,1) == nr),2))];
		idx_y = [ idx_y min(list_y(find(list_y(:,1) == nr),2))];
	end
	pos = (idx_x-1)*5+idx_y;
	fixations = [ idx_x', idx_y', pos'];
	fixations = fixations(find(data(:,3) > 150),:);
end
