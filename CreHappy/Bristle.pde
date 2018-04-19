public class Bristle {

  Segment head;
  Palette palette;
  float jiggle;

  Bristle(float len, Palette palette_) {
    
    palette = palette_;
    Segment current = new Segment(0, 0, 10, 0);
    for (int i = 0; i < len; i++) {
      Segment next = new Segment(current, 13, i);
      current.child = next;
      current = next;
    }
    head = current;
    jiggle = 0;
  }
  
  void show(PGraphics canvas, float x, float y, Boolean isDrawing, color colorPalette) {
    head.follow(x + jiggle, y + jiggle);
    head.update();
    head.show(colorPalette);
    if (isDrawing) image(head.paint(canvas, colorPalette), 0, 0);
    Segment next = head.parent;

    while (next != null) {
      next.follow();
      next.update();
      next.show(colorPalette);
      if (isDrawing) canvas = next.paint(canvas, colorPalette);
      next = next.parent;
    }
    image(canvas, 0, 0);
    noFill();
  }
}