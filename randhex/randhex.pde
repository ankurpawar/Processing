
void setup(){

size(500,500);
noStroke();
smooth();
strokeWeight(1);
background(255); 
//noLoop();
frameRate(10);
}

void draw(){
 
 stroke(255);
 int col=floor(random(0,4));
 if(col==0)
  fill(200,143,170,70);
 else if(col==1)
  fill(123,232,123,70);
 else if(col==2)
  fill(25,89,155,70);
 else if(col==3)
  fill(123,245,56,70);
 else
  fill(189,225,98,70); 
 
 float xoff=round(random(0,width/10));
 float yoff=round(random(0,height/10));
 
 if ((xoff*10)%20!=0)
 {
  //yoff+=15;
  translate(10*xoff,30*yoff+15);
 }
 else
 {
  translate(10*xoff,30*yoff);
 }
 //scale(2); 
 hexagon();
 
 
}

void hexagon()
{
 beginShape(QUADS);
 vertex(0,5);
 vertex(10,0);
 vertex(20,5);
 vertex(10,10);
 
 vertex(0,5);
 vertex(0,15);
 vertex(10,20);
 vertex(10,10);
 
 vertex(20,5);
 vertex(20,15);
 vertex(10,20);
 vertex(10,10);
 endShape();
}


