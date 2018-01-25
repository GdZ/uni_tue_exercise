function [out] = Cornsweet(stim, positions, size, ppd, contrast, ramp_width, exponent, mean_lum)

	% ramp_width = 3;
	% exponent = 2.75;
	% mean_lum = 0.5;

    stim = double(stim);
    for i=1:length(positions(:))
        pos = positions(i);
	    dist = 1:ramp_width+1;
	    dist = 2*atand(dist/2./ppd*2*tan(0.5));
	    dist = dist/ramp_width;
	    dist(find(dist>1)) = 1;
	    profile = (1 - dist).^exponent * mean_lum*contrast/2;
        left = sum(stim(:, pos-ramp_width:pos));
        right = sum(stim(:, pos+1:pos+1+ramp_width));
        if (left > right)
            %% do increase
    	    stim(:, pos-ramp_width:pos) = stim(:,pos-ramp_width:pos) + fliplr(profile);
            %% do decrease
	        stim(:, pos+1:pos+ramp_width+1) = stim(:, pos+1:pos+1+ramp_width) - profile;
        else
            %% do decrease
    	    stim(:, pos-ramp_width:pos) = stim(:,pos-ramp_width:pos) - fliplr(profile);
            %% do increase
	        stim(:, pos+1:pos+ramp_width+1) = stim(:, pos+1:pos+1+ramp_width) + profile;
        end
    end
    out = uint8(stim);
    %out = stim;
end

