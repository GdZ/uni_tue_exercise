function [out] = Cornsweet(stim, size, ppd, contrast, ramp_width, exponent, mean_lum)

	% ramp_width = 3;
	% exponent = 2.75;
	% mean_lum = 0.5;

	%stim = ones(size) * mean_lum;
    positions = [113 140 400 420 ];
    for i=1:length(positions(:))
        pos = positions(i);
        %figure, plot(1:size(1), stim);
        %grid on;
	    dist = 1:ramp_width+1;
	    dist = 2*atand(dist/2./ppd*2*tan(0.5))
	    dist = dist/ramp_width
	    dist(find(dist>1)) = 1;
	    profile = (1 - dist).^exponent * mean_lum*contrast/2;
        %plot(1:length(profile(:)), profile);
	    %stim(:, 1:size(2)/2) = stim(:,1:size(2)/2) + fliplr(profile);
	    %stim(:, size(2)/2+1:size(2)) = stim(:, size(2)/2+1:size(2)) - profile;
    	stim(:, pos-ramp_width:pos) = stim(:,pos-ramp_width:pos) + fliplr(profile);
	    stim(:, pos+1:pos+ramp_width+1) = stim(:, pos+1:pos+1+ramp_width) - profile;
    end
    out = stim;
end

