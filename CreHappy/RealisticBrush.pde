class RealisticBrush
{
  public float x, y, w, h, angle;
  public int mismatch;
  public float vel;
  ArrayList<Droop> droops;
  ArrayList<BrushHair> hairs;
  
  float angleChange;
  
  public RealisticBrush(float w, float h, int mismatch, color col)
  {
    this.w = w;
    this.h = h;
    this.mismatch = mismatch;
    droops = new ArrayList<Droop>();
    reset(col);
  }
  
  void reset(color col)
  {
    angleChange = 0; //atan2((pmouseY - y), (pmouseX - x)); //(0-1+random(2))/(TWO_PI*10);
    //atan2((pmouseY - y), (pmouseX - x)); //
    
    x = 0;
    y = 0;
    
    vel = 1 + random(10);
    //(pmouseX - mouseX ) + (pmouseY - mouseY);//
    
    w = 20; //10 + random(20);
    h = 20; //5 + random(20);
    
    this.angle = 0; // 90 + atan2((pmouseY - y), (pmouseX - x)); //random(TWO_PI/4);
    
    hairs = new ArrayList<BrushHair>();
    
    for(int i=0; i < w; i++)
    {
      for(int j =0; j < h; j++)
      {
        hairs.add(new BrushHair(i, j, col));
      }
    }
  }
  
  void show(PGraphics canvas, float x, float y, color col)
  {
    float cumulativeSaturation =0;
    this.angle = 20 + atan2((pmouseY - y), (pmouseX - x)); //random(TWO_PI/4);
    canvas.beginDraw();
    //todo : contaminate brush strokes running through one another
    canvas.pushMatrix();
    canvas.translate(x, y - mismatch);
    canvas.rotate(angle);
    
    for(BrushHair h : hairs)
    {
      cumulativeSaturation += h.show(canvas);
    }
    
    canvas.popMatrix();
    canvas.endDraw();
    image(canvas, 0, mismatch);
    
    if(cumulativeSaturation <= 0)
    {
      reset(col);
    }
    
    angle += angleChange;
    angleChange += 0; //((0-1+(random(1)*2))*TWO_PI/4)/1000; //tiny bit of wiggle? it's now too happy to draw turds ... -_o
    
    //draw a droop?
    if(random(100) > 90)
    {
      droops.add(new Droop(this.x + cos(angle)*random(this.w), this.y + sin(angle)*random(this.h)));
    }
    for(int i=droops.size(); i > 0; i--)
    {
      Droop drp = droops.get(i-1);
      drp.draw();
      if(drp.isDead)
      {
        droops.remove(drp);
      }
    }
  }
  
}