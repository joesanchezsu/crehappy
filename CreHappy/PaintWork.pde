import de.voidplus.leapmotion.*;

public class PaintWork {

  Palette palette;
  Brush brush;
  Brush littleBrush;
  RealisticBrush realBrush;
  BrushStains stains;

  PGraphics canvas;
  int id = 0;
  int mismatch = 50;
  float colorPalette;
  float lastValueDistSensor = 0;
  float sensorDist;
  float posPalette;

  PaintWork() {
    palette = new Palette();
    canvas = createGraphics(width - palette.thickness, height - mismatch);
    canvas.beginDraw();
    canvas.background(255);
    canvas.endDraw();
    brush = new Brush(15, mismatch);
    littleBrush = new Brush(palette, mismatch);
    realBrush = new RealisticBrush(10+random(40), 5 + random(50), mismatch, palette.getHue());
    stains = new BrushStains(mismatch);
  }

  void showPalette(int sensorDistance) {
    if (sensorDistance != 0) {
      sensorDist = float(sensorDistance);
      if (abs(lastValueDistSensor-sensorDist)>30 && lastValueDistSensor <= 30) {
        sensorDist = lastValueDistSensor;
      }

      sensorDist = constrain(sensorDist, 0, 30);
      posPalette = map(sensorDist, 4, 30, 0, height);
      lastValueDistSensor = sensorDist;
      palette.drawPointer(posPalette);
    } else {
      palette.drawPointer(mouseY);
    }
  }

  void showIndex(Boolean indexActive) {
    if (!indexActive) {
      brush.isDrawing = false;
      stroke(0, 40);
    } else {
      brush.isDrawing = true;
      stroke(0, 170);
    }
  }

  void showIndex(Finger index, Finger middle, Boolean indexActive, Boolean middleActive, Boolean ringActive) {
    if(indexActive && middleActive && ringActive){
      stains.isDrawing = true;
      realBrush.isDrawing = false;
      brush.isDrawing = false;
    } else if (indexActive && middleActive) {
      brush.isDrawing = true;
      stains.isDrawing = false;
      realBrush.isDrawing = false;
    } else if (indexActive) {
      realBrush.isDrawing = true;
      brush.isDrawing = false;
      stains.isDrawing = false;
    } else{
      stains.isDrawing = false;
      brush.isDrawing = false;
      realBrush.isDrawing = false;
    }
    /*
    if (!indexActive) {
     brush.isDrawing = false;
     stroke(0, 40);
     } else {
     brush.isDrawing = true;
     stroke(0, 170);
     }
     
     index.getBone(0).draw();
     index.getBone(1).draw();
     index.getBone(2).draw();*/
  }

  void showMiddle(Finger middle, Boolean middleActive) {
    if (!middleActive) {
      stains.isDrawing = false;
      stroke(0, 40);
    } else {
      stains.isDrawing = true;
      stroke(0, 170);
    }

    middle.getBone(0).draw();
    middle.getBone(1).draw();
    middle.getBone(2).draw();
  }

  void showRing(Finger ring, Boolean ringActive) {
    if (!ringActive) {
      stroke(0, 40);
    } else {
      stroke(0, 170);
    }

    ring.getBone(0).draw();
    ring.getBone(1).draw();
    ring.getBone(2).draw();
  }

  void showPinky(Finger pinky, Boolean pinkyActive) {
    if (!pinkyActive) {
      littleBrush.isDrawing = false;
      stroke(0, 40);
    } else {
      littleBrush.isDrawing = true;
      stroke(0, 170);
    }
    
    //pinky.getBone(0).draw();
    //pinky.getBone(1).draw();
    //pinky.getBone(2).draw();
  }

  void showTool(float indexX, float indexY, float indexZ, float middleX, float middleY, float middleZ, 
    float ringX, float ringY, float ringZ, float pinkyX, float pinkyY, float pinkyZ) {
    if (keyPressed) {
      if (key == BACKSPACE) {
        canvas.beginDraw();
        canvas.background(255);
        canvas.endDraw();
        image(canvas, 0, mismatch);
        delay(500);
      }

      if (key == ENTER) {
        //String path = sketchPath("/Paintworks");
        //String[] filenames = listFileNames(path);
        //printArray(filenames);

        canvas.save("Paintworks/screenshot"+id+".jpg");
        id++;
      }
    }


    //brush.show(canvas, indexX, indexY, palette);


    if (stains.isDrawing) {
      stains.show(canvas, middleX, middleY, palette.getHue());
    } else if (brush.isDrawing) {
      brush.show(canvas, indexX, indexY, palette);
    } else if (realBrush.isDrawing) {
      realBrush.show(canvas, indexX, indexY, indexZ, palette);
    } else {
      littleBrush.showLittleBrush(canvas, pinkyX, pinkyY);
    }
  }
}