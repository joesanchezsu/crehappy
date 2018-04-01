public class Brush{

  ArrayList<Bristle> bristles;
  Palette palette;
  Boolean isDrawing = false;
  
  public Brush(Palette palette_){
    palette = palette_;
  }
  
  public Brush(int numberBristles, Palette palette_){
    bristles = new ArrayList<Bristle>();
    palette = palette_;
    
    for(int i = 0; i < numberBristles; i++){
      bristles.add(new Bristle(6, palette));
    }
    
    for(Bristle b : bristles){
      float jiggle = random(-10, 10);
      b.jiggle = jiggle;
    }
  }
  
  public void show(PGraphics canvas, float x, float y){
    for(Bristle b : bristles){
      b.show(canvas, x, y, isDrawing);
    }
  }
  
  public void showLittleBrush(PGraphics canvas, float x, float y){
    float speed = abs((x-pmouseX)+(y-pmouseY));
    //println(speed);
    float sw = map(speed, 0, 300, 1, 8);
    
    canvas.beginDraw();
    canvas.stroke(palette.getHue());
    canvas.strokeWeight(sw);
    canvas.line(x,y, pmouseX, pmouseY);
    canvas.endDraw();
    image(canvas, 0, 0);
  }

}