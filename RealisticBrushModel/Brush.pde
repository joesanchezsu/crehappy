class Brush
{
  public float x, y, w, h, angle;
  
  public float vel;
  
  ArrayList<BrushHair> hairs;
  
  int r, g,b;
  
  float angleChange;
  
  public Brush(float w, float h)
  {
    this.w = w;
    this.h = h;
    
    reset();
  }
  
  void reset()
  {
    angleChange = 0; //atan2((pmouseY - y), (pmouseX - x)); //(0-1+random(2))/(TWO_PI*10);
    //atan2((pmouseY - y), (pmouseX - x)); //
    
    x = mouseX;
    y = mouseY;
    
    r = 22+(int)random(233);
    g = 22+(int)random(233);
    b = 22+(int)random(233);
    
    vel = 1 + random(10);
    //(pmouseX - mouseX ) + (pmouseY - mouseY);//
    
    w = 10 + random(20);
    h = 5 + random(20);
    
    this.angle = 90 + atan2((pmouseY - y), (pmouseX - x)); //random(TWO_PI/4);
    
    hairs = new ArrayList<BrushHair>();
    
    for(int i=0; i < w; i++)
    {
      for(int j =0; j < h; j++)
      {
        hairs.add(new BrushHair(i, j, r,g,b));
      }
    }
  }
  
  void show(float x, float y)
  {
    //todo : contaminate brush strokes running through one another
    for(int i=0; i < 3; i++)
    {
      pushMatrix();
      translate(x, y);
      rotate(angle);
      
      float cumulativeSaturation =0;
      
      for(BrushHair h : hairs)
      {
        cumulativeSaturation += h.show();
      }
      
      popMatrix();
      
      if(cumulativeSaturation <= 0)
      {
        reset();
      }
      
      angle += angleChange;
      angleChange += ((0-1+(random(1)*2))*TWO_PI/4)/1000; //tiny bit of wiggle? it's now too happy to draw turds ... -_o
      
      //draw a droop?
      if(random(100) > 90)
      {
        droops.add(new Droop(this.x + cos(angle)*random(this.w), this.y + sin(angle)*random(this.h)));
      }
      
    }
  }
  
}