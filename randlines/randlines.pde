import processing.pdf.*;


float direction = 1;
PVector speed = new PVector(0,1);
PVector oldp;
PVector prepoint;
float pointX;
float pointY;
float change;
float len=5.0;
float lim=50.0;

void setup(){
  size(500,500);
   pointX = width/2;
   pointY = height/2;
   oldp=new PVector(pointX,pointY);
   prepoint=new PVector(pointX,pointY);
   smooth();
   ellipseMode(CENTER);
   background(256,256,256);
   beginRecord(PDF, "everything.pdf");

}

void draw(){
  
  
  change = round(random(1,10));
  if(change ==3){
  direction = round(random(0,8));  
   noStroke();
   float dis=dist(oldp.x,oldp.y,(float)pointX,(float)pointY);
  fill(32,130,237,50);
  ellipse(oldp.x,oldp.y,dis/2,dis/2);
   oldp.x=pointX;
   oldp.y=pointY;
  }
   if(direction == 1){
   speed.set(0,-len,0);
   }
   if(direction == 2){
   speed.set(len,0,0); 
   }
   if(direction == 3){
  speed.set(0,len,0); 
   }
   if(direction == 4){
  speed.set(-len,0,0); 
   }
   if(direction == 5){
   speed.set(-len,-len,0);
   }
   if(direction == 6){
   speed.set(len,len,0); 
   }
   if(direction == 7){
  speed.set(-len,len,0); 
   }
   if(direction == 8){
  speed.set(len,-len,0); 
   }
   if(pointX >= width-lim){
  pointX = width-lim; 
   }
   if(pointX <= lim){
  pointX = lim; 
   }
   if(pointY >= height-lim){
  pointY = height-lim; 
   }
   if(pointY <= lim){
  pointY = lim;
   } 
   pointX = pointX+speed.x;
   pointY = pointY+speed.y;
   stroke(0);
   line(pointX, pointY,prepoint.x,prepoint.y);
   prepoint.x=pointX;
   prepoint.y=pointY;
   
   
   if(change ==3)
   {
     noStroke();
     fill(223,125,18);
     ellipse(oldp.x,oldp.y,5,5); 
   }
}
//void mousePressed() {
//  exit();
//}
void keyPressed() {
  if (key == CODED)
  if (keyCode == UP) {
    direction = 1;
  }
  if (keyCode == RIGHT) {
    direction = 2;
  }
  if (keyCode == DOWN) {
    direction = 3;
  }
  if (keyCode == LEFT) {
    direction = 4;
  }
  if (keyCode == ESC) {
    endRecord();
    saveFrame("lines.png");
    exit();
  }
}
