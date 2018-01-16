function [output] = dispLetter(fixations)
	letter = 'ABCDEFGHIJKLMNOPQRSTUVWXY';
	output = [];
	%% if x times than 150ms, repeat x times of this letter
	for i=1:length(fixations)
		item = fixations(i,:);
		output = [output letter(item(4))];
		times = floor(item(3)/150);
		if 1 < times
			for j=2:times
				%output = [output, letter(item(4))];
			end
		end
	end
end