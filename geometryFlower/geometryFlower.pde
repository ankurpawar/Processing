import processing.pdf.*;

void setup()
{
  size(1000,500);
  beginRecord(PDF, "filename.pdf"); 
  smooth();
  colorMode(HSB,360,100,100);
  background(0,100,0);
  noLoop(); 
}

void draw()
{
  fill(0,0,0,255);
  noStroke();
  translate(width/4,height/2);
  for(int n=0;n<360;n+=10)
  {
    if((n%30)==0)
      fill(n,100,100,100);
    else
      fill(n,10,100,90);
      
      fill(n,100,100,90);
      leaf(0,0,n);
  }
  fill(0,0,0);
  ellipse(0,0,20,20);
  translate(width/3,0);
  for(int n=0;n<360;n+=10)
  {
    if((n%30)==0)
      fill(n,100,100,100);
    else
      fill(n,10,100,90);
  }
  fill(0,0,0);
  endRecord();
}

void leaf(float x,float y,float angle)
{
  pushMatrix(); 
  rotate(radians(angle));
  beginShape();
  vertex(0, 0);
  bezierVertex(50, 0, 100, 50, 100, 100);
  bezierVertex(50, 100, 0, 50, 0, 0);
  endShape();
  popMatrix();
}
  
void leaf2(float x,float y,float angle)
{
  pushMatrix();
  rotate(radians(angle));
  bezier(0,0,100, 0, 100, 100, 0, 0);  
  popMatrix();
}

