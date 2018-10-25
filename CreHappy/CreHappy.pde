/*
 * CreHappy : Application for Digital Painting using a LeapMotion sensor and a ultrasonic sensor liked by the library AP_Sync
 * Developped by John Eric Sanchez Suarez
 * Individual computing project ENSC 
 * Version 1
 * 16/05/18
 */

import de.voidplus.leapmotion.*;
import apsync.*;
import processing.serial.*;

private LeapMotion leap;
private ControllerLayer controller;
private AP_Sync streamer;
public int inDataInt;

void setup()
{
  frameRate(100); //To test in a more powerful computer
  fullScreen(P2D);
  leap = new LeapMotion(this);
  streamer = new AP_Sync(this, Serial.list()[1], 9600);
  controller = new ControllerLayer(leap);
  background(255);
}

void draw() {
  controller.updateControls(inDataInt);
}
