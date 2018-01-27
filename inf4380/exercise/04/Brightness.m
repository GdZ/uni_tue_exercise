function [out] = Brightness(in)

	WET_BR = 0.2126;
	WET_BG = 0.7152;
	WET_BB = 0.0722;

	IDX_R = 1;
	IDX_G = 2;
	IDX_B = 3;

	out = in(:,:, IDX_R)*WET_BR ...
			+ in(:,:, IDX_G)*WET_BG ...
			+ in(:,:, IDX_B)*WET_BB;

end