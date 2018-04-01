
Brush testBrush;

ArrayList<Droop> droops;

void setup()
{
  background(255);
  //size(500,500);
  fullScreen();
  //smooth();
  droops = new ArrayList<Droop>();
  testBrush = new Brush(10+random(40), 5 + random(50)); //what are "realistic" brush sizs? //do more than square brushes?
  //saveFrame("palette.jpg");
}

void draw()
{
  //frameRate(10);
  //palette.showHue();
  testBrush.show(mouseX, mouseY);
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