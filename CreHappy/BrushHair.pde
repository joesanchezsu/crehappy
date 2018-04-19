class BrushHair
{
  float thickness; //thickness of the brush hair (might be a bunch together irl)
  float saturation; //how saturated the brush hair is with paint
  float contactLen; //what length of a brush actually contacts the 'canvas'
  float shading; //how much shade effect is passed on lines drawn by this brush hair

  float angle; //offset angle

  float x, y;
  color col;
  float intensity;

  public BrushHair(float x, float y, float intensity, color col)
  {
    angle = random(TWO_PI/8);
    this.x = x;
    this.y = y;
    this.intensity = intensity;
    contactLen = intensity*6 + random(10);
    thickness = 1+random(3);
    this.col = col;
    shading = random(15);
    saturation = intensity*3;
  }

  float show(PGraphics canvas)
  {
    if (saturation <= 0) return saturation;

    canvas.pushMatrix();
    canvas.translate(x, y);
    canvas.rotate(angle); // Useful for a future spray effect

    canvas.strokeWeight(thickness);
    canvas.stroke(red(col) - shading, green(col) - shading, blue(col) - shading, saturation);
    canvas.line(0, 0, 0, contactLen);
    saturation -= (2 + random(12))/60;

    canvas.popMatrix();

    return saturation;
  }
}