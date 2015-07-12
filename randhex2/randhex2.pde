

void setup(){
size(800,800,P2D);

noStroke();
smooth();
strokeWeight(1.5);
background(100); 
//noLoop();
frameRate(10);


}

void draw(){

 stroke(255,80);
 int col=floor(random(0,4));
 if(col==0)
  fill(191,149,135,70);
 else if(col==1)
  fill(255,226,215,70);
 else 
  fill(159,98,77,70);
 
 float xoff=round(random(0,width/30));
 float yoff=round(random(0,height/30));
 
 if ((xoff*10)%20!=0)
 {
  //yoff+=15;
  translate(30*xoff,30*yoff+45);
 }
 else
 {
  translate(30*xoff,30*yoff);
 }
 //scale(3);
 hexagon();
 
 
}

void hexagon()
{
 beginShape(QUADS);
 vertex(0,15);
 vertex(30,0);
 vertex(60,15);
 vertex(30,30);
 
 vertex(0,15);
 vertex(0,45);
 vertex(30,60);
 vertex(30,30);
 
 vertex(60,15);
 vertex(60,45);
 vertex(30,60);
 vertex(30,30);
 endShape();
}

void keyPressed() {
  if (key == ESC) {
    saveFrame("hex1.png");
    exit();
  }
}

