function [out] = Contrast(channel)
	c_x = [ -1 0 1 -1 1 -1 0 1 ];
	c_y = [ -1 -1 -1 0 0 1 1 1 ];

	c = double(channel);
	for x=2:length(c(:,1))-1
		for y=2:length(c(1,:))-1
			N1 = c(x+c_x(1), y+c_y(1));
			N2 = c(x+c_x(2), y+c_y(2));
			N3 = c(x+c_x(3), y+c_y(3));
			N4 = c(x+c_x(4), y+c_y(4));
			N5 = c(x+c_x(5), y+c_y(5));
			N6 = c(x+c_x(6), y+c_y(6));
			N7 = c(x+c_x(7), y+c_y(7));
			N8 = c(x+c_x(8), y+c_y(8));
			[ x y ];
			N = [ N1 N2 N3 N4 N5 N6 N7 N8];
			ave = sum(N)/8.0;
			c(x,y) = ave;
		end
	end
	out = Norminalize(c);
end