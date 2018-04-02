import de.voidplus.leapmotion.*;

public class PaintWork {

  Palette palette;
  Brush brush;
  Brush littleBrush;
  RealisticBrush realBrush;
  PGraphics canvas;
  int id = 0;
  int mismatch = 50;

  PaintWork() {
    palette = new Palette();
    canvas = createGraphics(width - palette.thickness, height - mismatch);
    brush = new Brush(15, palette);
    littleBrush = new Brush(palette);
    realBrush = new RealisticBrush(10+random(40), 5 + random(50), mismatch, palette.getHue());
  }
  
  void showPalette(){
     palette.drawPointer(mouseY);
  }
  
  void showIndex(Boolean indexActive){
    if(!indexActive){
      brush.isDrawing = false;
      stroke(0, 40);
    } else {
      brush.isDrawing = true;
      stroke(0, 170);
      //ellipse(x,y,15,15); // draw cursor
    }
  }
  
  void showIndex(Finger index, Boolean indexActive){
    if(!indexActive){
      realBrush.isDrawing = false;
      stroke(0, 40);
    } else {
      realBrush.isDrawing = true;
      stroke(0, 170);
      //ellipse(x,y,15,15); // draw cursor
    }
    
    //index.getBone(0).draw();
    //index.getBone(1).draw();
    //index.getBone(2).draw();
  }
  
  void showTool(float x, float y){
    if(keyPressed){
      if(key == BACKSPACE){
        canvas.beginDraw();
        canvas.background(255);
        canvas.endDraw();
      }
      
      if(key == ENTER){
        //String path = sketchPath("/Paintworks");
        //String[] filenames = listFileNames(path);
        //printArray(filenames);
        
        canvas.save("Paintworks/screenshot"+id+".jpg");
        id++;
      }
    }
    //brush.show(canvas, x, y);
    //littleBrush.showLittleBrush(canvas, x, y);
    realBrush.show(canvas, x, y, palette.getHue());
  }
  
  // This function returns all the files in a directory as an array of Strings  
  String[] listFileNames(String dir) {
    File file = new File(dir);
    if (file.isDirectory()) {
      String names[] = file.list();
      return names;
    } else {
      // If it's not a directory
      return null;
    }
  }

  
  
}