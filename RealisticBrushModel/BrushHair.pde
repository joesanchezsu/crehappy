class BrushHair
{
  float thickness; //thickness of the brush hair (might be a bunch together irl)
  float saturation; //how saturated the brush hair is with paint
  float contactLen; //what length of a brush actually contacts the 'canvas'
  float shading; //how much shade effect is passed on lines drawn by this brush hair
  
  float angle; //offset angle
  
  float x, y;
  
  int r, g, b, a;
  
  public BrushHair(float x, float y, int ir, int ig, int ib)
  {
    angle = random(TWO_PI/8);
    this.x=x;
    this.y=y;
    contactLen = 6+ random(10);
    thickness = 1+random(3);
    r = 22+ir;
    g = 22+ig;
    b = 22+ib;
    a = 255;
    shading = random(30);
    saturation = (255 - random(80))/55;
  }
  
  float show()
  {
    if(saturation <= 0) return saturation;
    
    pushMatrix();
    translate(x, y);
    rotate(angle); // Util para el spray de graffiti
    
    strokeWeight(thickness);
    stroke(r - shading, g - shading, b -shading, saturation);
    line(0, 0, 0, contactLen);
    saturation -= (2 + random(12))/300;
    
    popMatrix();
    
    return saturation;
  }
  
}