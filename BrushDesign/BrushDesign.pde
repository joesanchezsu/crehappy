PImage brush;
float prevMouseX = 0;
float prevMouseY = 0;
PImage fondo;

void setup() {
  size(900,518,P2D);
  //size(1280,720,P2D);
  imageMode(CENTER);
  brush = loadImage("white.png");
  fondo = loadImage("paisaje.jpg");
  background(0);
}

void draw() {
  
}

void mousePressed(){
  prevMouseX = mouseX;
  prevMouseY = mouseY;
}

void mouseDragged(){
  float brushAngle = atan2(mouseX - prevMouseX, mouseY - prevMouseY);
  
  for(int i = 0; i < 5; i++){
    float jiggleColor = random(-80, 80);
    tint(40, 150 + jiggleColor, 120 + jiggleColor);
    //color c = fondo.get(int(mouseX),int(mouseY));
    //tint(c);
    pushMatrix();
    float jiggle = random(-10,10);
    translate(mouseX + jiggle, mouseY + jiggle);
    float jiggleAngle = random(-20, 20);
    rotate(brushAngle+(radians(-90 + jiggleAngle)));
    float jiggleScale = random(-0.008, 0.008);
    scale(0.01 + jiggleScale);
    image(brush,0,0);
    popMatrix();
  }
  
  
  prevMouseX = mouseX;
  prevMouseY = mouseY;
}