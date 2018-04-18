import de.voidplus.leapmotion.*;

public class DisplayLayer{
  
  PaintWork pw;
  
  DisplayLayer(){
    pw = new PaintWork();
  }
  
  void updatePaint(ControllerLayer c){
    pw.showPalette(c.sensorDistance);
    //pw.showIndex(c.indexActive);
    
    pw.showTool(c.indexX, c.indexY, c.indexZ);
    pw.showIndex(c.index, c.indexActive);
  }

}