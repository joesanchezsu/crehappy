import de.voidplus.leapmotion.*;

public class ControllerLayer{
  
  LeapMotion leap;
  DisplayLayer display;
  PImage bg;
  
  // Fingers
  Finger index;
  float indexX = 0;
  float indexY = 0;
  float indexZ = 0;
  Boolean indexActive = true;
  
  public ControllerLayer(){
    display = new DisplayLayer();
    bg = loadImage("palette.jpg");
    bg.resize(width, height);
  }
  
  public ControllerLayer(LeapMotion leap_){ 
    leap = leap_;
    display = new DisplayLayer();
    bg = loadImage("palette.jpg");
    bg.resize(width, height);
  }
  
  // Tests with the mouse position
  public void updateControls_(){
    background(bg);
    indexX = mouseX;
    indexY = mouseY;
    if(mousePressed) indexActive = false;
    else indexActive = true;
    
    display.updatePaint(this);
    
  }
  
  public void updateControls(){
    for(Hand hand : leap.getHands ()){

      index = hand.getIndexFinger();
      
      if(index.isValid()){
        background(bg);
        PVector tip = index.getPositionOfJointTip();
        indexX = tip.x;
        indexY = tip.y;
        indexZ = tip.z;
        //println("x:"+indexX + "  y:"+indexY + "  z:"+indexZ);
        
        if(!index.isExtended()){
          indexActive = false;
        } else{
          indexActive = true;
        }
        
        display.updatePaint(this);
      } 

      
      /*
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