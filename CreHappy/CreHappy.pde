//import com.leapmotion.leap.*;
import de.voidplus.leapmotion.*;

int maxBrushSize = 120;
color canvasColor = 0xffffff;
float alphaVal = 10;
PGraphics canvas;
Boolean isDrawing = true;
float prevPointerX = 0;
float prevPointerY = 0;

LeapMotion leap;
DataLayer dataLeap;
//PImage brush;
Palette palette;
Segment tentacle;

void setup()
{
   //frameRate();
   size(1000, 700, P2D);
   leap = new LeapMotion(this);
   dataLeap = new DataLayer(leap);
   //brush = loadImage("white.png");
   palette = new Palette();
   canvas = createGraphics(900, 700);
   background(canvasColor);
   stroke(0x00ffffff);
   
   Segment current = new Segment(300, 200, 20, 0);
  
   for(int i = 0; i < 5; i++){
    Segment next = new Segment(current, 20, i);
    current.child = next;
    current = next;
   }
   tentacle = current;
}


void draw(){
  for(Hand hand : leap.getHands ()){
    Finger pointer = hand.getIndexFinger();
    
    if(pointer.isValid()){
      
      background(canvasColor);
      if(mouseY-pmouseY > 0){
        palette.showHue(mouseY);
        delay(500);
      }
      
  
      //color frontColor = color( 255, 0, 0, alphaVal );
      //color backColor  = color( 0, 0, 255, alphaVal );
  
      //InteractionBox iBox = frame.interactionBox();
      //Vector tip = iBox.normalizePoint(pointer.tipPosition());
      PVector tip = pointer.getPositionOfJointTip();
      float x = tip.x; // * width;
      float y = tip.y;//height - tip.getY() * height;
      //float brushSize = maxBrushSize - maxBrushSize * tip.z;
      
      tentacle.follow(x, y);
      tentacle.update();
      tentacle.show(palette.getHue());
      if(isDrawing) image(tentacle.paint(canvas, palette.getHue()),0,0);
      Segment next = tentacle.parent;
      
      while(next != null){
        next.follow();
        next.update();
        next.show(palette.getHue());
        if(isDrawing) canvas = next.paint(canvas, palette.getHue());
        next = next.parent;
      }
      
      
      if(isDrawing){
        //brushPaint(canvas, x, y, palette.getHue());
      }
      image(canvas, 0, 0); //Draw canvas to screen
  
      noFill();
      
      //ellipse( x, y, 20, 20); // draw cursor
      if(!pointer.isExtended()){
        isDrawing = false;
        stroke(0, 40);
      } else{
        isDrawing = true;
        stroke(0, 170);
        ellipse( x, y, 15, 15); // draw cursor
      }
      pointer.getBone(0).draw();
      pointer.getBone(1).draw();
      pointer.getBone(2).draw();
      
      
    }
    
  }
  /*Frame frame = leapJava.frame();
  FingerList indexFingerList = frame.fingers().fingerType(Finger.Type.TYPE_INDEX);
  Finger pointer = indexFingerList.get(0);
  */
  
  //Pointable pointer = frame.pointables().frontmost();
  
  
  
}

void brushPaint(PGraphics canvas, float x, float y, color col){
  canvas.beginDraw();
  float brushAngle = atan2(x - prevPointerX, y - prevPointerY);
          
  for(int i = 0; i < 2; i++){
    float jiggleColor = random(-80, 80);
    //canvas.colorMode(HSB);
    //canvas.tint(40, 150 + jiggleColor, 100 + jiggleColor);
    //color c = fondo.get(int(mouseX),int(mouseY));
    float redValue = red(col)+jiggleColor;
    float greenValue = green(col)+jiggleColor;
    float blueValue = blue(col)+jiggleColor;
    canvas.tint(redValue, greenValue, blueValue);
    float disX = x - prevPointerX;
    float disY = y - prevPointerY;
    //float brushSize = 120 - 120*z;
    float avDist = (disX + disY)/2;
    
    canvas.pushMatrix();
    float jiggle = random(-10,10);
    canvas.translate(x + jiggle, y + jiggle);
    float jiggleAngle = random(-10, 10);
    canvas.rotate(brushAngle+(radians(90+jiggleAngle)));
    float jiggleScale = random(-0.008, 0.008);
    canvas.scale(0.01 + jiggleScale); //0.02
    //canvas.image(brush,0,0);
    canvas.popMatrix();
  }
  canvas.endDraw();
  
  prevPointerX = x;
  prevPointerY = y;
}