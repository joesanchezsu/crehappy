import de.voidplus.leapmotion.*;

public class DisplayLayer{
  
  PaintWork pw;
  
  DisplayLayer(){
    pw = new PaintWork();
  }
  
  void updatePaint(ControllerLayer c){
    //c.updateControls();
    pw.showPalette();
    pw.showIndex(c.index, c.indexActive);
    pw.showTool(c.indexX, c.indexY);
    //noFill();
    
  }

}