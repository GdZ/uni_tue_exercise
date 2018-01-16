function [values] = getCost(letter)

	GL_LETTER = 'ABCDEFGHIJKLMNOPQRSTUVWXY';
	values = [];

	cost_tabs = costs(toFixations());

	for i=1:length(letter)
		item = letter(i);
		idx = find(item == GL_LETTER);
		values = [ values cost_tabs(idx)];
	end

end