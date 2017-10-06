//Let's put stars in the background at some point


import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

//PeasyCam automatically adds mouse interaction to your 3D image
Planet sun;

PeasyCam cam;


PImage sunTexture;
PImage [] textures = new PImage[6];


void setup () {
  //Renders animation in processing's 3D generating software
  size(600, 600, P3D);
  sunTexture = loadImage("sun.jpg");
  textures[0] = loadImage("neptune.jpg");
  textures[1] = loadImage("earth.jpg");
  textures[2] = loadImage("mars.jpg");
  textures[3] = loadImage("planet.jpeg");
  textures[4] = loadImage("bright.jpeg");
  textures[5] = loadImage("tyedye.jpeg");
  //tells camera to look at center of world from 100 units away
  cam = new PeasyCam(this, 400); 
  sun = new Planet(50, 0, 0, sunTexture);
  sun.spawnMoons(4, 1);
}

void draw() {
   background(0);
   spotLight(100, 102, 126, 80, 80, 40, -1, 0, 0, PI/2, -10);
   ambientLight(15, 15, 15);
   //spotLight(100, 102, 126, 80, 80, 40, -1, 0, 0, PI/2, -10);
   //lights(); //helps give 3D look to canvas (adds generic wash of light)
   //pointLight(110, 110, 110, 0, 0, 0);
   //translate(width/2, height/2); don't need translation with peasy cam
   sun.show();
   sun.orbit();
}