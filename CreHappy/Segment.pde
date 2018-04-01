class Segment {
  
  PVector a;
  float angle = 0;
  float len;
  PVector b = new PVector();
  Segment parent = null;
  Segment child;
  float sw = 0;
  
  Segment(float x, float y, float len_, float i){
    a = new PVector(x,y);
    sw = map(i, 0, 20, 0.5, 3);
    len = len_; 
    calculateB();
  }
  
  Segment(Segment parent_, float len_, float i){
    parent = parent_;
    a = parent.b.copy();
    sw = map(i, 0, 15, 0.5, 3);
    len = len_;
    calculateB();
  }
  
  void follow(){
    float targetX = child.a.x;
    float targetY = child.a.y;
    follow(targetX, targetY);
    
  }
  
  void follow(float tx, float ty){
    PVector target = new PVector(tx, ty);
    PVector dir = PVector.sub(target, a);
    angle = dir.heading();
    
    dir.setMag(len);
    dir.mult(-1);
    
    a = PVector.add(target, dir);
  }
  
  void calculateB(){
    float dx = len * cos(angle);
    float dy = len * sin(angle);
    b.set(a.x+dx, a.y+dy); //instead of create a new vector in each iteration
  }
  
  void update(){
    calculateB();
  }
  
  void show(color c){
    stroke(c);
    strokeWeight(sw);
    line(a.x, a.y, b.x, b.y);
    strokeWeight(1);
  }
  
  PGraphics paint(PGraphics canvas, color col){
    canvas.beginDraw();
    canvas.stroke(col);
    canvas.strokeWeight(sw);
    canvas.line(a.x, a.y, b.x, b.y);
    canvas.endDraw();
    return canvas;
  }

}