


import de.voidplus.leapmotion.*;
import apsync.*;
import processing.serial.*;

LeapMotion leap;
ControllerLayer controller;
AP_Sync streamer;
public int inDataInt;


void setup()
{
   //frameRate(100);
   size(1000, 700, P2D);
   //fullScreen(P2D);
   leap = new LeapMotion(this);
   streamer = new AP_Sync(this, Serial.list()[1], 9600);
   controller = new ControllerLayer(leap);
   background(255);
}


void draw(){
  controller.updateControls(inDataInt); 
}