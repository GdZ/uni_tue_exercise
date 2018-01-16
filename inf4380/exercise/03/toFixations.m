function [fixations] = toFixations()
	fixations = [];
	idx_txt = 1:5;
	for idx_x=1:5
		for idx_y=1:5
			fixations = [fixations; [ idx_txt(idx_x) idx_txt(idx_y) ]];
		end
	end
end