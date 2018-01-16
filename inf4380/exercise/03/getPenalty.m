function [penalty] = getPenalty(c1, c2)

	penalty = [];
	letter = 'ABCDEFGHIJKLMNOPQRSTUVWXY';
	letter_tabs = [];

	%[c1 ':' c2]

	%size(LETTER_TABS)

	for x=1:5
		for y=1:5
			letter_tabs = [letter_tabs; [x y]];
		end
	end
	%letter_tabs

	%% init
	idx1 = find(letter == c1);
	pos1 = letter_tabs(idx1,:);
	idx2 = find(letter == c2);
	pos2 = letter_tabs(idx2,:);

	[pos1; pos2];

	if c1 == c2
		penalty = 1;
	else
		penalty = 0;
	end

end