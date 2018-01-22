function [out] = Saliency(i1, j1, img)
	i2 = -25:25;
	j2 = -25:25;
	saliency = [];
	win = double(img);
	sz_win = size(win);
	for i=1:51
		items = [];
		for j=1:51
			data = win(i1+i2(i), j1+j2(j));
			euclidean = sqrt(i2(i)*i2(i)+j2(j)*j2(j));
			if 1 > euclidean
				euclidean = 1.0;
			end
			items = [items data/euclidean];
		end
		saliency = [ saliency; items ];
	end
	out = sum(saliency(:));
end
