class BrushStains {

  PImage brush;
  int maxBrushSize = 120;
  color canvasColor = color(255);
  float alphaVal = 10;
  Boolean isDrawing = false;
  float prevPointerX = 0;
  float prevPointerY = 0;
  int mismatch;

  BrushStains(int mismatch) {
    brush = loadImage("white.png");
    this.mismatch = mismatch;
  }

  void show(PGraphics canvas, float x, float y, color col) {
    canvas.beginDraw();
    float brushAngle = atan2(x - prevPointerX, y - prevPointerY);

    for (int i = 0; i < 2; i++) {
      float jiggleColor = random(-80, 80);
      float redValue = red(col)+jiggleColor;
      float greenValue = green(col)+jiggleColor;
      float blueValue = blue(col)+jiggleColor;
      canvas.tint(redValue, greenValue, blueValue);

      canvas.pushMatrix();
      float jiggle = random(-10, 10);
      canvas.translate(x + jiggle, y + jiggle - mismatch);
      float jiggleAngle = random(-10, 10);
      canvas.rotate(brushAngle+(radians(90+jiggleAngle)));
      float jiggleScale = random(-0.008, 0.008);
      canvas.scale(0.01 + jiggleScale); 
      canvas.image(brush, 0, 0);
      canvas.popMatrix();
    }
    canvas.endDraw();

    prevPointerX = x;
    prevPointerY = y;

    image(canvas, 0, mismatch); //Draw canvas to screen
  }
}