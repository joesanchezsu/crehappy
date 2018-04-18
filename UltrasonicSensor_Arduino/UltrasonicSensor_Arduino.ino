/*
 * Read the value of the ultrasonic sensor in orden to synchronize it 
 * with the Processing Sketch
 * By Eric Sanchez
 * CreHappy - computing projet
 * ENSC
 */

// Library AP_Sync for connecting Arduino to Processing
#include <AP_Sync.h>

AP_Sync streamer(Serial);

//Distance sensor
int ecoPin = 13;  
int trigPin = 12;

int duration, distance;

void setup(){
  Serial.begin(9600); 
  pinMode(trigPin, OUTPUT);   // send a ultrasonic signal
  pinMode(ecoPin, INPUT);     // get the ultrasonic signal
}

void loop(){
 // Send and get the ultrasonic signal with a delay of 10 ms
 digitalWrite(trigPin, HIGH);  
 delayMicroseconds(10); 
 digitalWrite(trigPin, LOW); 
 
 duration = pulseIn(ecoPin, HIGH); 
 duration = constrain(duration, 250, 1750); // Ignore values outside 250 & 1750

 distance = microsecondsToCentimeters(duration);
 
 Serial.println(distance);
 // Assing the "distance" arduino variable to "inDataInt" to be used by Processing
 streamer.sync("inDataInt",distance); 
 delay(200);
}


// Transform microsecond to centimeters
int microsecondsToCentimeters(int microseconds){
  
  // The speed of sound at 20º of temperature is 340 m/s or
  // 29 microseconds for centimeter.
  // the signal has to go and come back, so the distance is 
  // located in the middle of the distance covered
  return microseconds / 29 / 2;
}
