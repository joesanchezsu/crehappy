//import com.leapmotion.leap.*;
import de.voidplus.leapmotion.*;

int maxBrushSize = 120;
color canvasColor = color(255);
float alphaVal = 10;

float prevPointerX = 0;
float prevPointerY = 0;

LeapMotion leap;
ControllerLayer controller;

PImage brush;


void setup()
{
   //frameRate(100);
   //size(1000, 700, P2D);
   fullScreen(P2D);
   leap = new LeapMotion(this);
   //controller = new ControllerLayer();
   controller = new ControllerLayer(leap);
   
   brush = loadImage("white.png");
   background(255);
   //stroke(0x00ffffff);  
}


void draw(){
  controller.updateControls();
  //display.updatePaint(controller);  
}


// Stains - manchas
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
  
  image(canvas, 0, 0); //Draw canvas to screen
}