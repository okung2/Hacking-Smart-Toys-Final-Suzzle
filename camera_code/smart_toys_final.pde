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

  textSize(32);
  fill(255);
  stroke(255);
  if (rann < 5) {
    text("can you make a cat?", 10, 40);
  } else if (rann < 10) {
    text("can you make a house?", 10, 40);
  } else if (rann < 15) {
    text("can you make yourself?", 10, 40);
  } else if (rann < 20) {
    text("can you make a triangle?", 10, 40);
  } else if (rann < 25) {
    text("can you make a yellow and blue ghost?", 10, 40);
  } else if (rann < 30) {
    text("can you make a pink carrot?", 10, 40);
  } else if (rann < 35) {
    text("can you make your favorite toy?", 10, 40);
  } else if (rann < 40) {
    text("can you make a tree?", 10, 40);
  } else if (rann < 45) {
    text("can you make a car?", 10, 40);
  } else if (rann < 50) {
    text("can you make a t-rex?", 10, 40);
  }


  //updatePixels();                                    //  must call updatePixels oce were done messing with pixels[]
  //println (frameRate);
}

float rann;
void mouseClicked() {

  rann = random(50);
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
  if (average < 100) {
    if (!file0.isPlaying() && count0 %3 == 0) {
      file0.play();
      //count0++;
      //println(count0);
    }
  }
  if (25 < average && average < 150) {
    if (!file1.isPlaying() && count0%4 == 0) {
      file1.play();
      //count0++;
    }
  }
  if (50 < average && average < 200) {
    if (!file2.isPlaying() && count0%5 == 0) {
      file2.play();
      //count0++;
    }
  }
  if (25 < average && average < 150) {
    if (!file3.isPlaying() && count0%6 == 0) {
      file3.play();
      //count3++;
    }
  }
  if (0 < average && average < 200) {
    if (!file4.isPlaying() && count0%5 == 0) {
      file4.play();
      //count4++;
    }
  }
  if (100 < average && average < 200) {
    if (!file5.isPlaying() && count0%5 == 0) {
      file5.play();
      //count0++;
    }
  }
  count0++;
}
