function [stereo] = Stereo(in)
    img = in;
    left_delta_s = [ 0 20 ];
    disparity = translate(strel(1), left_delta_s);
    left = imdilate(img, disparity);
    right_delta_s = [ 0 -20 ];
    disparity = translate(strel(1), right_delta_s);
    right = imdilate(img, disparity);
    stereo = stereoAnaglyph(left, right);

end

