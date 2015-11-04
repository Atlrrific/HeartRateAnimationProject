/*
THIS PROGRAM WORKS WITH PulseSensorAmped_Arduino-xx ARDUINO CODE
THE PULSE DATA WINDOW IS SCALEABLE WITH SCROLLBAR AT BOTTOM OF SCREEN
PRESS 'S' OR 's' KEY TO SAVE A PICTURE OF THE SCREEN IN SKETCH FOLDER (.jpg)
MADE BY JOEL MURPHY AUGUST, 2012
*/

import de.voidplus.leapmotion.*;
LeapMotion leap;

import processing.serial.*;
PFont font;
Scrollbar scaleBar;

Serial port;     

PVector fingerPos;
int Sensor;      // HOLDS PULSE SENSOR DATA FROM ARDUINO
int IBI;         // HOLDS TIME BETWEN HEARTBEATS FROM ARDUINO
int BPM;         // HOLDS HEART RATE VALUE FROM ARDUINO
int[] RawY;      // HOLDS HEARTBEAT WAVEFORM DATA BEFORE SCALING
int[] ScaledY;   // USED TO POSITION SCALED HEARTBEAT WAVEFORM
int[] rate;      // USED TO POSITION BPM DATA WAVEFORM
float zoom;      // USED WHEN SCALING PULSE WAVEFORM TO PULSE WINDOW
float offset;    // USED WHEN SCALING PULSE WAVEFORM TO PULSE WINDOW
color eggshell = color(0);
int heart = 0;   // This variable times the heart image 'pulse' on screen
//  THESE VARIABLES DETERMINE THE SIZE OF THE DATA WINDOWS
int PulseWindowWidth = 490;
int PulseWindowHeight = 512; 
int BPMWindowWidth = 180;
int BPMWindowHeight = 340;
boolean beat = false;    // set when a heart beat is detected, then cleared when the BPM graph is advanced









void setup() {
  leap = new LeapMotion(this);
  size(1000, 800,OPENGL);  // Stage size
  
  frameRate(100);  
  font = loadFont("Arial-BoldMT-24.vlw");
  textFont(font);
  textAlign(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);  
// Scrollbar constructor inputs: x,y,width,height,minVal,maxVal
  scaleBar = new Scrollbar (400, 575, 180, 12, 0.5, 1.0);  // set parameters for the scale bar
  RawY = new int[PulseWindowWidth];          // initialize raw pulse waveform array
  ScaledY = new int[PulseWindowWidth];       // initialize scaled pulse waveform array
  rate = new int [BPMWindowWidth];           // initialize BPM waveform array
  zoom = 0.75;                               // initialize scale of heartbeat window
    
// set the visualizer lines to 0
 for (int i=0; i<rate.length; i++){
    rate[i] = 555;      // Place BPM graph line at bottom of BPM Window 
   }
 for (int i=0; i<RawY.length; i++){
    RawY[i] = height/2; // initialize the pulse window data line to V/2
 }
   
// GO FIND THE ARDUINO
  println(Serial.list());    // print a list of available serial ports
  // choose the number between the [] that is connected to the Arduino
  port = new Serial(this, Serial.list()[1], 115200);  // make sure Arduino is talking serial at this baud rate
  port.clear();            // flush buffer
  port.bufferUntil('\n');  // set buffer full flag on receipt of carriage return
  
  /*For the heart drawing*/
  strokeWeight(10);
  stroke(255, 0, 125, 125);
}
  
void draw() {
  //background(0);
  //noStroke();
  int var = 30;
  background(255);

  
  
 // (1023 - Sensor) - 212;
  
  
// DRAW OUT THE PULSE WINDOW AND BPM WINDOW RECTANGLES  
  //fill(eggshell);  // color for the window background
  //rect(255,height/2,PulseWindowWidth,PulseWindowHeight);
  //rect(600,385,BPMWindowWidth,BPMWindowHeight);
  
// DRAW THE PULSE WAVEFORM
  // prepare pulse data points    
  //RawY[RawY.length-1] = (1023 - Sensor) - 212;   // place the new raw datapoint at the end of the array
  //zoom = scaleBar.getPos();                      // get current waveform scale value
  //offset = map(zoom,0.5,1,150,0);                // calculate the offset needed at this scale
  //for (int i = 0; i < RawY.length-1; i++) {      // move the pulse waveform by
  //  RawY[i] = RawY[i+1];                         // shifting all raw datapoints one pixel left
  //  float dummy = RawY[i] * zoom + offset;       // adjust the raw data to the selected scale
  //  ScaledY[i] = constrain(int(dummy),44,556);   // transfer the raw data array to the scaled array
  //}
  //stroke(250,0,0);                               // red is a good color for the pulse waveform
  //noFill();
  //beginShape();                                  // using beginShape() renders fast
  //for (int x = 1; x < ScaledY.length-1; x++) {    
  //  vertex(x+10, ScaledY[x]);                    //draw a line connecting the data points
  //}
  //endShape();
  
// DRAW THE BPM WAVE FORM
// first, shift the BPM waveform over to fit then next data point only when a beat is found
 //if (beat == true){   // move the heart rate line over one pixel every time the heart beats 
 //  beat = false;      // clear beat flag (beat flag waset in serialEvent tab)
 //  for (int i=0; i<rate.length-1; i++){
 //    rate[i] = rate[i+1];                  // shift the bpm Y coordinates over one pixel to the left
 //  }
//// then limit and scale the BPM value
 //  BPM = min(BPM,200);                     // limit the highest BPM value to 200
 //  float dummy = map(BPM,0,200,555,215);   // map it to the heart rate window Y
 //  rate[rate.length-1] = int(dummy);       // set the rightmost pixel to the new data point value
 //} 
 //// GRAPH THE HEART RATE WAVEFORM
 //stroke(250,0,0);                          // color of heart rate graph
 //strokeWeight(2);                          // thicker line is easier to read
 //noFill();
 //beginShape();
 //for (int i=0; i < rate.length-1; i++){    // variable 'i' will take the place of pixel x position   
 //  vertex(i+510, rate[i]);                 // display history of heart rate datapoints
 //}
 //endShape();
 
//DRAW THE HEART AND MAYBE MAKE IT BEAT
  //fill(250,0,0);
  //stroke(250,0,0);
  //// the 'heart' variable is set in serialEvent when arduino sees a beat happen
  //heart--;                    // heart is used to time how long the heart graphic swells when your heart beats
  //heart = max(heart,0);       // don't let the heart variable go into negative numbers
  //if (heart > 0){             // if a beat happened recently, 
  // strokeWeight(8);          // make the heart big
  //}
  //smooth();   // draw the heart with two bezier curves
  //bezier(width-100,50, width-20,-20, width,140, width-100,150);
  //bezier(width-100,50, width-190,-20, width-200,140, width-100,150);
  //strokeWeight(1);          // reset the strokeWeight for next time


// PRINT THE DATA AND VARIABLE VALUES
  fill(0);                                       // get ready to print text
  text("IBI " + IBI + "mS",-400,100);                    // print the time between heartbeats in mS
  text(BPM + " BPM",150,500);                           // print the Beats Per Minute
  text(Sensor + " Sensor",150, 585);   
  //text("Pulse Window Scale " + nf(zoom,1,2), 150, 585); // show the current scale of Pulse Window
  
//  DO THE SCROLLBAR THINGS
  //scaleBar.update (mouseX, mouseY);
  //scaleBar.display();
  
//   Leap Motion Stuff
  //leepMotionStuff();
  
  int fps = leap.getFrameRate();


  // ========= HANDS =========

  for (Hand hand : leap.getHands ()) {


    // ----- BASICS -----

    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();
    PVector hand_stabilized  = hand.getStabilizedPosition();
    PVector hand_direction   = hand.getDirection();
    PVector hand_dynamics    = hand.getDynamics();
    float   hand_roll        = hand.getRoll();
    float   hand_pitch       = hand.getPitch();
    float   hand_yaw         = hand.getYaw();
    boolean hand_is_left     = hand.isLeft();
    boolean hand_is_right    = hand.isRight();
    float   hand_grab        = hand.getGrabStrength();
    float   hand_pinch       = hand.getPinchStrength();
    float   hand_time        = hand.getTimeVisible();
    PVector sphere_position  = hand.getSpherePosition();
    float   sphere_radius    = hand.getSphereRadius();


    // ----- SPECIFIC FINGER -----

    Finger  finger_thumb     = hand.getThumb();
    // or                      hand.getFinger("thumb");
    // or                      hand.getFinger(0);

    Finger  finger_index     = hand.getIndexFinger();
    // or                      hand.getFinger("index");
    // or                      hand.getFinger(1);
    fingerPos =  finger_index.getPosition();
    Finger  finger_middle    = hand.getMiddleFinger();
    // or                      hand.getFinger("middle");
    // or                      hand.getFinger(2);

    Finger  finger_ring      = hand.getRingFinger();
    // or                      hand.getFinger("ring");
    // or                      hand.getFinger(3);

    Finger  finger_pink      = hand.getPinkyFinger();
    // or                      hand.getFinger("pinky");
    // or                      hand.getFinger(4);        


    // ----- DRAWING -----

    hand.draw();
    // hand.drawSphere();


    // ========= ARM =========

    if (hand.hasArm()) {
      Arm     arm               = hand.getArm();
      float   arm_width         = arm.getWidth();
      PVector arm_wrist_pos     = arm.getWristPosition();
      PVector arm_elbow_pos     = arm.getElbowPosition();
    }


    // ========= FINGERS =========

    for (Finger finger : hand.getFingers()) {
      // Alternatives:
      // hand.getOutstrechtedFingers();
      // hand.getOutstrechtedFingersByAngle();

      // ----- BASICS -----

      int     finger_id         = finger.getId();
      PVector finger_position   = finger.getPosition();
      PVector finger_stabilized = finger.getStabilizedPosition();
      PVector finger_velocity   = finger.getVelocity();
      PVector finger_direction  = finger.getDirection();
      float   finger_time       = finger.getTimeVisible();


      // ----- SPECIFIC FINGER -----

      switch(finger.getType()) {
      case 0:
        // System.out.println("thumb");
        break;
      case 1:
        // System.out.println("index");
        break;
      case 2:
        // System.out.println("middle");
        break;
      case 3:
        // System.out.println("ring");
        break;
      case 4:
        // System.out.println("pinky");
        break;
      }


      // ----- SPECIFIC BONE -----

      Bone    bone_distal       = finger.getDistalBone();
      // or                       finger.get("distal");
      // or                       finger.getBone(0);

      Bone    bone_intermediate = finger.getIntermediateBone();
      // or                       finger.get("intermediate");
      // or                       finger.getBone(1);

      Bone    bone_proximal     = finger.getProximalBone();
      // or                       finger.get("proximal");
      // or                       finger.getBone(2);

      Bone    bone_metacarpal   = finger.getMetacarpalBone();
      // or                       finger.get("metacarpal");
      // or                       finger.getBone(3);


      // ----- DRAWING -----

      // finger.draw(); // = drawLines()+drawJoints()
      // finger.drawLines();
      // finger.drawJoints();


      // ----- TOUCH EMULATION -----

      int     touch_zone        = finger.getTouchZone();
      float   touch_distance    = finger.getTouchDistance();

      switch(touch_zone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#"+finger_id+"): "+touch_distance);
        break;
      case 1: // Touching
        // println("Touching (#"+finger_id+")");
        break;
      }
    }


    // ========= TOOLS =========

    for (Tool tool : hand.getTools ()) {


      // ----- BASICS -----

      int     tool_id           = tool.getId();
      PVector tool_position     = tool.getPosition();
      PVector tool_stabilized   = tool.getStabilizedPosition();
      PVector tool_velocity     = tool.getVelocity();
      PVector tool_direction    = tool.getDirection();
      float   tool_time         = tool.getTimeVisible();


      // ----- DRAWING -----

      // tool.draw();


      // ----- TOUCH EMULATION -----

      int     touch_zone        = tool.getTouchZone();
      float   touch_distance    = tool.getTouchDistance();

      switch(touch_zone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#"+tool_id+"): "+touch_distance);
        break;
      case 1: // Touching
        // println("Touching (#"+tool_id+")");
        break;
      }
    }
  }


  // ========= DEVICES =========

  for (Device device : leap.getDevices ()) {
    float device_horizontal_view_angle = device.getHorizontalViewAngle();
    float device_verical_view_angle = device.getVerticalViewAngle();
    float device_range = device.getRange();
  }
  
  
  //void leapOnScreenTapGesture(ScreenTapGesture g){
  //  int     id               = g.getId();
  //  Finger  finger           = g.getFinger();
  //  PVector position         = g.getPosition();
  //  PVector direction        = g.getDirection();
  //  long    duration         = g.getDuration();
  //  float   duration_seconds = g.getDurationInSeconds();
  
  //  println("ScreenTapGesture: "+id);
  //}

  strokeWeight(5);
  stroke(Sensor/2, 0, 125, 125);
  
  
  translate(width/2, height/2);
  for (int i = -180; i < 180; i+=3) {
    float angle = sin(radians(-sin(radians(i*map(mouseX, 0, width, 0, 5)))*i+Sensor*(var/30)))*50; 
    float x = sin(radians(i))*(50-angle/3);
    float y = cos(radians(i))*(50-angle/3);
    float x2 = sin(radians(i))*(150-angle);
    float y2 = cos(radians(Sensor+i))*(150-angle);
    line(x, y, x2, y2);
  }
  
  
  // PRINT THE DATA AND VARIABLE VALUES
  fill(0);                                       // get ready to print text
  //text("IBI " + IBI + "mS",-400,100);                    // print the time between heartbeats in mS
  text(BPM + " BPM",150,500);                           // print the Beats Per Minute
  text(Sensor + " Sensor",150, 585);   
  if(fingerPos!=null){
    text("Printing Finger ", 150,700);
    text(fingerPos.x +  " XPosition" + fingerPos.y + " YPosition",   150, 620);
  
  }
  
  
}  //end of draw loop


// ========= CALLBACKS =========

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}

//void leepMotionStuff(){

//}