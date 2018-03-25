float position;
private int thickness;

class Palette{
  Palette(){
    position = 0;
    thickness = width/30;
  }
  
  void showHue(float pos){
    position = pos;
    colorMode(HSB, height, width, 100);
    for(int i = width-thickness; i < width; i++){
      for(int j = 0; j < height; j++){
        stroke(j,i,100);
        point(i,j);
      }
    }
    drawPointer();
  }
  
  void drawPointer(){
    stroke(0);
    line(width-thickness, position, width, position);
    noStroke();
    fill(0);
    beginShape(TRIANGLES);
    vertex(width-thickness-10, position-3);
    vertex(width-thickness-10, position+3);
    vertex(width-thickness, position);
    endShape();
  }
  
  color getHue(){
    colorMode(HSB, height, 100, 100);
    return color(position, 100, 100);
  }
  
}