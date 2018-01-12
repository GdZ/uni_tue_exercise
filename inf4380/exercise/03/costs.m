function [values] = costs(fixations)
	values = [];
	idx_x = fixations(:, 1);
	idx_y = fixations(:, 2);
	v = zeros(length(fixations),25);

	ids = (idx_x-1)*5 + idx_y;

	%% get one point
	b = 1;
	for one=b:length(fixations)
		vv = zeros(5,5);
		%% fetch one fixation
		y_flag = idx_y(one);
		x_flag = idx_x(one);
		[x_flag y_flag];

		%% compute the current row
		for y=y_flag-1:-1:1
			vv(idx_x(one), y) = vv(idx_x(one), y+1)-1;
		end
		for y=y_flag+1:5
			vv(idx_x(one), y) = vv(idx_x(one), y-1) -1;
		end

		%% compute other columns
		for y=1:5
			%% compute current column
			item = vv(x_flag, :); % all values of this row

			c = item(y); % get one item from this row
			% x change
			for x=x_flag-1:-1:1
				[x y vv(x,y)];
				vv(x, y) = vv(x+1,y)-1;
			end
			for x=x_flag+1:5
				[x y vv(x,y)];
				vv(x, y) = vv(x-1,y)-1;
			end
		end
		values = [ values abs(sum(sum(vv)))];
	end
	%%values
end