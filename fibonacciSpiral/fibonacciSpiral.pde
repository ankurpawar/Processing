import processing.pdf.*;

int numLevel=16;
float phi=0.5*(1+sqrt(5)); // 1.618 golden ratio 
void setup()
{
  size(760,760);
  beginRecord(PDF, "fibbSpiral.pdf"); 
  colorMode(HSB,360,100,100);
  rectMode(CORNER);
  ellipseMode(CORNER);
  noFill();
  background(0,0,100);
  stroke(0);
  strokeWeight(0.25);
  translate(width/2,height/2);
  drawSquare(numLevel,0,0,height/2-10,0);
  endRecord();
}

void drawSquare(int n,float x,float y,float len,float angle)
{
  
  if ( n > 0 )
  {
     noStroke();
     fill(map(angle,0,2*PI,0,360),100,100);
     rect(x-len,y,len,len);
     noFill();
     //fill(0);
     stroke(0,0,100);
     arc(x-len,y-len,2*len,2*len,PI/2,PI);
     stroke(0,0,0);
     //noFill();
     rotate(-PI/2);
     translate(-len+len/phi,0);
     drawSquare(n-1,x,y,len/phi,(angle+PI/5)%(2*PI));
  }
}
