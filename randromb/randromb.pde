
void setup(){

size(200,200);
noStroke();
smooth();
strokeWeight(1);
background(0); 
//noLoop();
frameRate(10);
}

void draw(){
 
 stroke(255,70);

 
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
 //scale(2); 

 int col=floor(random(0,4));
 if(col==0)
 {
   fill(191,149,135,70);
   romb1();
 } 
 else if(col==1)
 {
  fill(255,226,215,70);
  romb2();
 }
 else 
 {
  fill(159,98,77,70);
  romb3();
 }
 
}

void romb1()
{
 beginShape(QUADS);
 vertex(0,15);
 vertex(30,0);
 vertex(60,15);
 vertex(30,30);
 endShape();
}
void romb2()
{
  beginShape(QUADS);
 vertex(0,15);
 vertex(0,45);
 vertex(30,60);
 vertex(30,30);
 endShape();
}

void romb3()
{
 beginShape(QUADS);
 vertex(60,15);
 vertex(60,45);
 vertex(30,60);
 vertex(30,30);
 endShape();
}


