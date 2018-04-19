import de.voidplus.leapmotion.*;

public class ControllerLayer {

  LeapMotion leap;
  DisplayLayer display;
  PImage bg;

  // Fingers
  Finger index;
  Finger middle;
  Finger ring;
  Finger pinky;

  float indexX = 0;
  float indexY = 0;
  float indexZ = 0;

  float middleX = 0;
  float middleY = 0;
  float middleZ = 0;

  float ringX = 0;
  float ringY = 0;
  float ringZ = 0;

  float pinkyX = 0;
  float pinkyY = 0;
  float pinkyZ = 0;

  Boolean indexActive = true;
  Boolean middleActive = true;
  Boolean ringActive = true;
  Boolean pinkyActive = true;

  int sensorDistance = 0;

  public ControllerLayer() {
    display = new DisplayLayer();
    bg = loadImage("palette.jpg");
    bg.resize(width, height);
  }

  public ControllerLayer(LeapMotion leap_) { 
    leap = leap_;
    display = new DisplayLayer();
    bg = loadImage("palette.jpg");
    bg.resize(width, height);
  }

  // Tests with the mouse position
  public void updateControls_() {
    background(bg);
    indexX = mouseX;
    indexY = mouseY;
    if (mousePressed) indexActive = false;
    else indexActive = true;

    display.updatePaint(this);
  }

  public void updateControls(int inDataInt) {
    sensorDistance = inDataInt;
    for (Hand hand : leap.getHands ()) {

      index = hand.getIndexFinger();
      middle = hand.getMiddleFinger();
      ring = hand.getRingFinger();
      pinky = hand.getPinkyFinger();

      if (index.isValid() || middle.isValid() || ring.isValid()) {
        background(bg);

        // Index
        PVector tipI = index.getPositionOfJointTip();
        indexX = tipI.x;
        indexY = tipI.y;
        indexZ = tipI.z;

        if (!index.isExtended()) {
          indexActive = false;
        } else {
          indexActive = true;
        }

        // Middle
        PVector tipM = middle.getPositionOfJointTip();
        middleX = tipM.x;
        middleY = tipM.y;
        middleZ = tipM.z;

        if (!middle.isExtended()) {
          middleActive = false;
        } else {
          middleActive = true;
        }

        // Ring
        PVector tipR = ring.getPositionOfJointTip();
        ringX = tipR.x;
        ringY = tipR.y;
        ringZ = tipR.z;

        if (!ring.isExtended()) {
          ringActive = false;
        } else {
          ringActive = true;
        }

        // Pinky
        PVector tipP = pinky.getPositionOfJointTip();
        pinkyX = tipP.x;
        pinkyY = tipP.y;
        pinkyZ = tipP.z;

        if (!pinky.isExtended()) {
          pinkyActive = false;
        } else {
          pinkyActive = true;
        }

        display.updatePaint(this);
      } 


      /*
      Hier all data which can be read of the LeapMotion 
      // Hand
       
       int     handId             = hand.getId();
       PVector handPosition       = hand.getPosition();
       PVector handStabilized     = hand.getStabilizedPosition();
       PVector handDirection      = hand.getDirection();
       PVector handDynamics       = hand.getDynamics();
       float   handRoll           = hand.getRoll();
       float   handPitch          = hand.getPitch();
       float   handYaw            = hand.getYaw();
       boolean handIsLeft         = hand.isLeft();
       boolean handIsRight        = hand.isRight();
       float   handGrab           = hand.getGrabStrength();
       float   handPinch          = hand.getPinchStrength();
       float   handTime           = hand.getTimeVisible();
       PVector spherePosition     = hand.getSpherePosition();
       float   sphereRadius       = hand.getSphereRadius();
       
       
       // Arm
       
       if (hand.hasArm()) {
       Arm     arm              = hand.getArm();
       float   armWidth         = arm.getWidth();
       PVector armWristPos      = arm.getWristPosition();
       PVector armElbowPos      = arm.getElbowPosition();
       }
       
       
       // Finger
       
       Finger  fingerThumb        = hand.getThumb();
       Finger  fingerIndex        = hand.getIndexFinger();
       Finger  fingerMiddle       = hand.getMiddleFinger();
       Finger  fingerRing         = hand.getRingFinger();
       Finger  fingerPink         = hand.getPinkyFinger();
       
       for (Finger finger : hand.getFingers()) {
       
       int     fingerId         = finger.getId();
       PVector fingerPosition   = finger.getPosition();
       PVector fingerStabilized = finger.getStabilizedPosition();
       PVector fingerVelocity   = finger.getVelocity();
       PVector fingerDirection  = finger.getDirection();
       float   fingerTime       = finger.getTimeVisible();
       
       stroke(0,100, 0);
       finger.getBone(0).draw();
       finger.getBone(1).draw();
       finger.getBone(2).draw();
       
       // ------------------------------------------------
       // Drawing
       
       // Drawing:
       //finger.draw();  // Executes drawBones() and drawJoints()
       //finger.drawBones();
       //finger.drawJoints();
       
       
       // Bones
       // --------
       // https://developer.leapmotion.com/documentation/java/devguide/Leap_Overview.html#Layer_1
       
       Bone    boneDistal       = finger.getDistalBone();
       Bone    boneIntermediate = finger.getIntermediateBone();
       Bone    boneProximal     = finger.getProximalBone();
       Bone    boneMetacarpal   = finger.getMetacarpalBone();
       */
    }
  }
}