% Slide 06: Computational Models of Visual

GL_IMG_EXAMPLE = 'example.png';
GL_IMG_GRAY = 'gray.png';
GL_IMG_NORMALIZE = 'normalized.png';

IDX_R = 1;
IDX_G = 2;
IDX_B = 3;

%% load GL_IMG_EXAMPLE
img_example = imread(GL_IMG_EXAMPLE);

gray_scale = [];
intensity = [];
normalize = [];
min_gray = 0;
max_gray = 0;

gray_scale = zeros(size(img_example));
sz_example = size(img_example);
red = img_example(:,:, IDX_R);
green = img_example(:,:, IDX_G);
blue = img_example(:,:, IDX_B);
gray_scale = (red+green+blue)/3;

gray_scale = double(gray_scale);
min_gray = min(gray_scale(:));
max_gray = max(gray_scale(:));
for i=1:length(gray_scale(:))
	gray_scale(i) = (gray_scale(i)-min_gray)/(max_gray-min_gray);
end
%% exercise 2: output
imwrite(gray_scale, GL_IMG_NORMALIZE);

%% =========================================
% exercise 3
WET_BR = 0.2126;
WET_BG = 0.7152;
WET_BB = 0.0722;
GL_IMG_BRIGHTNESS = 'brightness.png';
GL_IMG_CONTRAST = 'contrast.png';
GL_IMG_CONTRAST_R = 'contrast_r.png';
GL_IMG_CONTRAST_G = 'contrast_g.png';
GL_IMG_CONTRAST_B = 'contrast_b.png';
brightness = [];
c_x = [ -1 0 1 -1 1 -1 0 1 ];
c_y = [ -1 -1 -1 0 0 1 1 1 ];

%%% exercise 03.02
brightness = img_example(:,:, IDX_R)*WET_BR ...
			+ img_example(:,:, IDX_G)*WET_BG ...
			+ img_example(:,:, IDX_B)*WET_BB;
%% exercise 3: output
imwrite(brightness, GL_IMG_BRIGHTNESS);

%%% exercise 03.03-04
contrast = Contrast(gray_scale);
%% exercise 03.03-04: output
imwrite(contrast, GL_IMG_CONTRAST)
%%% exercise 03.05
contrast_r = Contrast(img_example(:,:,IDX_R));
contrast_g = Contrast(img_example(:,:,IDX_G));
contrast_b = Contrast(img_example(:,:,IDX_B));
%%% exercise 03.06
diff_r = Norminalize(img_example(:,:,IDX_R) - max(img_example(:,:,IDX_G), img_example(:,:,IDX_B)));
diff_g = Norminalize(img_example(:,:,IDX_G) - max(img_example(:,:,IDX_R), img_example(:,:,IDX_B)));
diff_b = Norminalize(img_example(:,:,IDX_B) - max(img_example(:,:,IDX_G), img_example(:,:,IDX_R)));
img_diff = zeros(size(img_example));
img_diff(:,:,IDX_R) = diff_r;
img_diff(:,:,IDX_G) = diff_g;
img_diff(:,:,IDX_B) = diff_b;
%%% exercise 03.07
contrast_diff_r = Contrast(diff_r);
contrast_diff_g = Contrast(diff_g);
contrast_diff_b = Contrast(diff_b);
img_contrast_diff = zeros(size(img_example));
img_contrast_diff(:,:,IDX_R) = contrast_diff_r;
img_contrast_diff(:,:,IDX_G) = contrast_diff_g;
img_contrast_diff(:,:,IDX_B) = contrast_diff_b;


%% =========================================
% exercise 4
