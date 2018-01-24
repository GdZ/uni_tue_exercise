function [out] = Norminalize(in)
	temp = double(in);
	min_gray = min(temp(:));
	max_gray = max(temp(:));
	for i=1:length(temp(:))
		temp(i) = (temp(i)-min_gray)/(max_gray-min_gray);
	end
	out = temp;
end