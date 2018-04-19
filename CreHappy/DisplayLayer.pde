import de.voidplus.leapmotion.*;

public class DisplayLayer{
  
  PaintWork pw;
  
  DisplayLayer(){
    pw = new PaintWork();
  }
  
  void updatePaint(ControllerLayer c){
    pw.showPalette(c.sensorDistance);
    
    //pw.showIndex(c.indexActive);
    
    pw.showTool(c.indexX, c.indexY, c.indexZ, c.middleX, c.middleY, c.middleZ, c.ringX, c.ringY, c.ringZ, c.pinkyX, c.pinkyY, c.pinkyZ);
    pw.showIndex(c.index, c.middle, c.indexActive, c.middleActive, c.ringActive);
    //pw.showMiddle(c.middle, c.middleActive);
    //pw.showRing(c.ring, c.ringActive);
    pw.showPinky(c.pinky, c.pinkyActive);
    
  }

}