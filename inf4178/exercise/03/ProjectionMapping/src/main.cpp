/*
 * main.cpp
 *
 *  Created on: Nov 7, 2016
 *      Author: Jens Schindel
 */

// OpenCV
#include "opencv2/highgui.hpp"
// Only needed when using the Point Grey cameras from the lab.
// Remember to make sure to work on a PC that has the application
// "FlyCap2" installed - this means the flycap lib also has to be installed.
#include "PGCapture.hpp"
#include <iostream>

using namespace cv;
using namespace std;

int main( int argc, const char** argv )
{
	// New instance for Point Grey Camera class
     PGCapture* cam = new PGCapture();

     // Retrieve image from camera
     Mat test = cam->getImage();

     // Manually delete camera when not used anymore.
     // IMPORTANT: When another instance of this class exists,
     // connecting to the camera again is not possible.
     // So it's crucial to either pass a PGCapture pointer around,
     // or manually deleting the pointer and instantiating elsewhere again,
     // or when not using as a pointer, use PGCapture _more_ carefully.
     // You could also rewrite the code and make the private init and disconnect
     // function public - who am I to judge you.
     delete cam;

     // Check if image is valid
     if (test.empty())
     {
          cout << "Error : Image cannot be loaded..!!" << endl;
          return -1;
     }

     namedWindow("PointGrey Camera Test", CV_WINDOW_FULLSCREEN);
     imshow("PointGrey Camera Test", test);

     //wait infinite time for a keypress
     waitKey(0);

     destroyWindow("PointGrey Camera Test");

     return 0;
}


