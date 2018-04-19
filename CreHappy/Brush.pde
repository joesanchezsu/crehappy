public class Brush {

  ArrayList<Bristle> bristles;
  Palette palette;
  Boolean isDrawing = false;
  float px;
  float py;
  int mismatch;

  public Brush(Palette palette, int mismatch) {
    this.palette = palette;
    this.mismatch = mismatch;
  }

  public Brush(int numberBristles, int mismatch) {
    bristles = new ArrayList<Bristle>();
    this.mismatch = mismatch;

    for (int i = 0; i < numberBristles; i++) {
      bristles.add(new Bristle(6, palette));
    }

    for (Bristle b : bristles) {
      float jiggle = random(-10, 10);
      b.jiggle = jiggle;
    }
  }

  public void show(PGraphics canvas, float x, float y, Palette palette) {
    for (Bristle b : bristles) {
      b.show(canvas, x, y, isDrawing, palette.getHue());
    }
  }

  public void showLittleBrush(PGraphics canvas, float x, float y) {
    float speed = abs((x-px)+(y-py));
    float sw = map(speed, 0, 300, 1, 8);

    canvas.beginDraw();
    canvas.pushMatrix();
    canvas.translate(x, y - mismatch);
    canvas.popMatrix();
    canvas.stroke(palette.getHue());
    canvas.strokeWeight(sw);
    if (px != 0 && py != 0 && isDrawing) {
      canvas.line(x, y, px, py);
    }
    canvas.endDraw();
    image(canvas, 0, mismatch);
    px = x;
    py = y;
  }
}