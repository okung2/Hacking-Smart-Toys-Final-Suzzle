// The world pixel by pixel 2019
// Daniel Rozin
// Posterizing the colors of a live video
import processing.video.*;
import processing.sound.*;
SoundFile file0;
int count0 = 0;
SoundFile file1;
int count1 = 0;
SoundFile file2;
int count2 = 0;
SoundFile file3;
int count3 = 0;
SoundFile file4;
int count4 = 0;
SoundFile file5;
int count5 = 0;

Capture ourVideo;                                 // variable to hold the video object
void setup() {
  size(1280, 720);
  frameRate(60);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    ourVideo = new Capture(this, width, height, cameras[0]);
    ourVideo.start();     
  }      
  
  file0 = new SoundFile(this, "falling.wav");
  file1 = new SoundFile(this, "pig.wav");
  file2 = new SoundFile(this, "whistle.wav");
  file3 = new SoundFile(this, "alien.wav");
  file4 = new SoundFile(this, "yay.wav");
  file5 = new SoundFile(this, "goat.wav");
  
  //ourVideo = new Capture(this, width, height);    // open the capture in the size of the window
  //ourVideo.start();                               // start the video
}

int totalColors;
int R, G, B, A;          // you must have these global varables to use the PxPGetPixel()

void draw() {
  if (ourVideo.available())  ourVideo.read();   // get a fresh frame as often as we can
  image(ourVideo, 0, 0);
  ourVideo.loadPixels();                     // load the pixels array of the video 
  loadPixels();                              // load the pixels array of the window  
  for (int x = 0; x<width; x++) {
    for (int y = 0; y<height; y++) {
      PxPGetPixel(x, y, ourVideo.pixels, width);     // get the RGB of our pixel and place in RGB globals
      totalColors = R + G + B;
    }
  }
  
  if (frameCount % 30 == 0) {
      println(totalColors / 3);
      colorRange(totalColors);
  }
  //updatePixels();                                    //  must call updatePixels oce were done messing with pixels[]
  //println (frameRate);
}


void PxPGetPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
  int thisPixel=pixelArray[x+y*pixelsWidth];     // getting the colors as an int from the pixels[]
  A = (thisPixel >> 24) & 0xFF;                  // we need to shift and mask to get each component alone
  R = (thisPixel >> 16) & 0xFF;                  // this is faster than calling red(), green() , blue()
  G = (thisPixel >> 8) & 0xFF;   
  B = thisPixel & 0xFF;
}

void colorRange(int totalColors) {
  int average = totalColors / 3;
  if (average < 20) {
    if (!file0.isPlaying() && count0 == 0) {
          file0.play();
          count0++;
    }
  }
  if (20 < average && average < 60) {
     if (!file1.isPlaying() && count1 == 0) {
          file1.play();
          count1++;
    }
  }
  if (60 < average && average < 100) {
    if (!file2.isPlaying() && count2 == 0) {
          file2.play();
          count2++;
    }
  }
  if (100 < average && average < 140) {
    if (!file3.isPlaying() && count3 == 0) {
          file3.play();
          count3++;
    }
  }
  if (140 < average && average < 180) {
    if (!file4.isPlaying() && count4 == 0) {
          file4.play();
          count4++;
    }
  }
  if (180 < average && average < 200) {
    if (!file5.isPlaying() && count5 == 0) {
          file5.play();
          count5++;
    }
  }
}
