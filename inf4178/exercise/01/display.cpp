//============================================================================
// Name        : display.cpp
// Author      : gdz
// Version     :
// Copyright   : Your copyright notice
// Description : Hello World in C++, Ansi-style
//============================================================================

#include <iostream>
#include <opencv2/opencv.hpp>
#include <opencv2/imgcodecs.hpp>
#include <stdio.h>

using namespace std;
using namespace cv;

void correctGamma(Mat &src, Mat &dst, float gamma);

// self define area --begin
#define CHK_FALSE(in)	CV_Assert((in))
#define BLUE 0
#define GREEN 1
#define RED 2
// end

/**
 * function: correctGamma
 * @param: src, dst, gamma
 */
void correctGamma(Mat &src, Mat &dst, float gamma)
{
	CHK_FALSE(src.data);
	// check if data is uchar
	CHK_FALSE(src.depth() != sizeof(uchar));

	// create a tab
	unsigned char tab[256];
	for (int i=0; i<256; i++) {
		tab[i] = saturate_cast<uchar>(pow((float)(i/255.0), gamma)*255.0f);
	}

	// copy src data to dst
	dst = src.clone();

	// get channels from new dst
	const int channels = dst.channels();
	printf("this image have %d channels.\n", channels);

	switch(channels){
		case 1: {
			MatIterator_<uchar> item, end;
			for (item=dst.begin<uchar>(), end=dst.end<uchar>(); item!=end; item++){
				*item = tab[(*item)];
			}
			break;
		}
		case 3: {
			MatIterator_<Vec3b> item, end;
			for (item=dst.begin<Vec3b>(), end=dst.end<Vec3b>(); item!=end; item++) {
				(*item)[BLUE] = tab[((*item)[BLUE])];
				(*item)[GREEN] = tab[((*item)[GREEN])];
				(*item)[RED] = tab[((*item)[RED])];
			}

			break;
		}
	}
}

void lutByGamma(Mat &in, Mat &out, float gamma)
{
	int dim(256);
	Mat lut(1, &dim, CV_8U);
	for(int i=0; i<256; i++){
		lut.at<uchar>(i) = pow((float)(i/255.0), gamma)*255.0f;
	}
	LUT(in, lut, out);
	printf("dim: %d\n", dim);
}

int main(int argc, char** argv)
{
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!

	Mat in, out, diff;
	char* out_file = "res/test_img_out.png";
	char* diff_file = "res/test_img_diff.png";

	in = imread(argv[1], IMREAD_COLOR);
	printf("argv[1]: %s\n", argv[1]);
	if(argc !=2 || !in.data) {
		printf("No image data.\n");
		return -1;
	} else {
		printf("argc: %d\n", argc);
	}

	namedWindow("Display Image", CV_WINDOW_AUTOSIZE);
	imshow("Display Image", in);

	// set gamma to 0.5f
	float gamma = 0.5f;
	// create out with gamma
//	correctGamma(in, out, gamma);
	lutByGamma(in, out, gamma);
	if(!imwrite(out_file, out)){
		printf("write [%s] fail, write to gamma.png\n", out_file);
		imwrite("gamma.png", out);
	}
	// show out
	imshow("Display Image", out);

	// absdiff
	absdiff(in, out, diff);
	if(!imwrite(diff_file, diff)){
		printf("write [%s] fail, write to diff.png\n", diff_file);
		imwrite("diff.png", diff);
	}

	waitKey(0);
	return 0;
}
