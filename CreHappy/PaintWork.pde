import de.voidplus.leapmotion.*;

public class PaintWork {

  Palette palette;
  Bristle bristle;
  PGraphics canvas;

  PaintWork() {
    palette = new Palette();
    canvas = createGraphics(900, 700);
    bristle = new Bristle(10, palette);
  }
  
  void showPalette(){
    if(mouseY-pmouseY > 0){
        palette.showHue(mouseY);
        delay(600);
    }
  }
  
  void showIndex(Finger index, Boolean indexActive){
    if(!indexActive){
      bristle.isDrawing = false;
      stroke(0, 40);
    } else {
      bristle.isDrawing = true;
      stroke(0, 170);
      //ellipse(x,y,15,15); // draw cursor
    }
    
    index.getBone(0).draw();
    index.getBone(1).draw();
    index.getBone(2).draw();
  }
  
  void showTool(float x, float y){
    bristle.show(canvas, x, y);
  }
  
  
}