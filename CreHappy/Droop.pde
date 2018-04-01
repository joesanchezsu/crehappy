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
  
  public void draw()
  {
    if(mass <= 0) isDead = true;
    ellipseMode(CENTER);
    noStroke();
    fill(r, g, b, 128);
    ellipse(xp, yp, mass, mass);
    mass *= 0.8;
    yp += mass/3;
  }
}