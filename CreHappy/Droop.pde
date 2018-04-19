class Droop
{
  float mass;
  float r, g, b;
  boolean isDead;
  float xp, yp;
  public Droop(float x, float y)
  {
    xp = x;
    yp = y;
    mass = 3+random(5);
    color dcol = get((int)x, (int)y);
    r = red(dcol);
    g = green(dcol);
    b = blue(dcol);
  }

  public PGraphics draw(PGraphics canvas)
  {
    if (mass <= 0) isDead = true;
    //canvas.beginDraw();
    canvas.ellipseMode(CENTER);
    canvas.noStroke();
    canvas.fill(r, g, b, 128);
    canvas.ellipse(xp, yp, mass, mass);
    //canvas.endDraw();
    mass *= 0.8;
    yp += mass/3;
    return canvas;
  }
}