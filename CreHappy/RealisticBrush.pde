class RealisticBrush
{
  public float x, y, w, h, angle;
  public int mismatch;
  public float vel;
  ArrayList<Droop> droops;
  ArrayList<BrushHair> hairs;
  Boolean staticPos = true;
  public float lastAngle = 0;
  Boolean isDrawing = false;
  float px;
  float py;
  PGraphics lastCanvas;
  Boolean prevIsDrawing = false;

  float angleChange;

  public RealisticBrush(float w, float h, int mismatch, color col)
  {
    this.w = w;
    this.h = h;
    this.mismatch = mismatch;
    droops = new ArrayList<Droop>();
    hairs = new ArrayList<BrushHair>();
    reset(0, col);
  }

  void reset(float intensity, color col)
  {
    //angleChange = 0; //atan2((pmouseY - y), (pmouseX - x)); //(0-1+random(2))/(TWO_PI*10);
    //atan2((pmouseY - y), (pmouseX - x)); //

    x = 0;
    y = 0;
    px = 0;
    py = 0;

    //vel = 1 + random(10);
    //(pmouseX - mouseX ) + (pmouseY - mouseY);//

    w = 10*intensity; //10 + random(20);
    h = 10*intensity; //5 + random(20);

    this.angle = lastAngle; // 90 + atan2((pmouseY - y), (pmouseX - x)); //random(TWO_PI/4);

    hairs.clear();
    for (int i=0; i < w; i++)
    {
      for (int j =0; j < h; j++)
      {
        hairs.add(new BrushHair(i, j, intensity, col));
      }
    }
  }  

  void show(PGraphics canvas, float x, float y, float z, Palette palette)
  {
    float intensity = map(z, 0, 100, 0, 5);
    println(intensity);
    float cumulativeSaturation = 10;
    if (py - y != 0 || py - x != 0) {
      this.angle = 20 + atan2((py - y), (px - x)); //random(TWO_PI/4);
    }

    canvas.beginDraw();
    //todo : contaminate brush strokes running through one another
    canvas.pushMatrix();
    canvas.translate(x, y - mismatch);
    canvas.rotate(angle);

    if (isDrawing) {
      hairs.clear();
      for (int i=0; i < w; i++)
      {
        for (int j =0; j < h; j++)
        {
          hairs.add(new BrushHair(i, j, intensity, palette.getHue()));
        }
      }
      for (BrushHair h : hairs)
      {
        cumulativeSaturation += h.show(canvas);
      }
    }

    canvas.popMatrix();
    canvas.endDraw();

    if (prevIsDrawing != isDrawing) {
      reset(intensity, palette.getHue());
    }
    if (cumulativeSaturation <= 0)
    {
      reset(intensity, palette.getHue());
    }

    //angle += angleChange;
    //angleChange += 0; //((0-1+(random(1)*2))*TWO_PI/4)/1000; //tiny bit of wiggle? it's now too happy to draw turds ... -_o

    lastAngle = angle;
    px = x;
    py = y;
    lastCanvas = canvas;
    prevIsDrawing = isDrawing;

    /*
    //draw a droop?
     if (random(100) > 90)
     {
     droops.add(new Droop(x + cos(angle)*random(this.w), y - mismatch + sin(angle)*random(this.h)));
     }
     for (int i=droops.size(); i > 0; i--)
     {
     Droop drp = droops.get(i-1);
     canvas = drp.draw(canvas);
     if (drp.isDead)
     {
     droops.remove(drp);
     }
     }
     */

    image(canvas, 0, mismatch);
  }
}