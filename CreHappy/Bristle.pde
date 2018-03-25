public class Bristle {

  Segment head;
  Boolean isDrawing = true;
  Palette palette;

  Bristle(float len, Palette palette_) {
    
    palette = palette_;
    Segment current = new Segment(0, 0, 10, 0);
    for (int i = 0; i < len; i++) {
      Segment next = new Segment(current, 10, i);
      current.child = next;
      current = next;
    }
    head = current;
  }

  void show(PGraphics canvas_, float x, float y) {
    PGraphics canvas = canvas_;
    head.follow(x, y);
    head.update();
    head.show(palette.getHue());
    if (isDrawing) image(head.paint(canvas, palette.getHue()), 0, 0);
    Segment next = head.parent;

    while (next != null) {
      next.follow();
      next.update();
      next.show(palette.getHue());
      if (isDrawing) canvas = next.paint(canvas, palette.getHue());
      next = next.parent;
    }
    image(canvas, 0, 0);
    noFill();
  }
}