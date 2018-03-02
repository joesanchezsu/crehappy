import apsync.*;
import processing.serial.*;

AP_Sync streamer;
Serial port; // defines Object Serial
public int valor;
float amp;
float lastValue = 0;

void setup(){
  //println(Serial.list());
  //port = new Serial(this, Serial.list()[1], 9600); // starts the serial communication
  //port.bufferUntil('\n');
  streamer = new AP_Sync(this, Serial.list()[1], 9600);
  size(800, 400);
}

void draw(){
  /*if(port.available() > 0) // si hay algún dato disponible en el puerto
   {
     valor=port.read(); //Lee el dato y lo almacena en la variable "valor"
   }*/
  println(valor);
  float val = float(valor);
  if(abs(lastValue-val)>30 && lastValue <= 30){
    val = lastValue;
  }
  
  val = constrain(val, 0, 30);
  amp = map(val, 0, 30, 0, 300);
  println(val);
  float green = map(val, 0, 30, 0, 255);
  background(20,green,50);
  fill(40,255-green, 30);
  ellipse(400, 200, amp, amp); 
  fill(46, 209, 2);
  text(val, 70, 175);
  
  lastValue = val;
}