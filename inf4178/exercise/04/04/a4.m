clc;
clear;

GL_IMG_A01 = 'a01.jpg';
GL_IMG_A02 = 'a02.jpg';

GL_IMG_TONEMAPPED = 'tonemapped.jpg';
GL_IMG_ENHANCED = 'enhanced.jpg';

GL_IMG_HDR = 'DONE_IMG_8480_HDR.jpg';

IDX_R = 1;
IDX_G = 2;
IDX_B = 3;

img_a01 = imread(GL_IMG_A02);
channel_red = img_a01(:,:,IDX_R);
contrast_red = Contrast(channel_red);
lum_a1 = Luminant(img_a01);

% test
%lum_sz = size(lum_a1);
%ppd = 61;
%contrast = 0.8;
%ramp_width = 10;
%exponent = 2.75;
%lum_mean = 0.5;
%% real
lum_a1_d = double(lum_a1);
lum_sz = size(lum_a1_d)
ppd = 61;
lum_mean = sum(lum_a1_d(:))/length(lum_a1_d(:));
contrast = (max(lum_a1_d(:))-min(lum_a1_d(:)))/lum_mean;
ramp_width = 10;
exponent = 2.75;
i=250;
%figure, plot(1:lum_sz(1), lum_a1_d(i,:));
[ lum_sz ppd contrast ramp_width exponent lum_mean ]
stim = Cornsweet(lum_a1_d(i,:), lum_sz, ppd, contrast, ramp_width, exponent, lum_mean);
figure,plot(1:length(stim(:)), stim(:));
grid on;

