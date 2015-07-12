import processing.pdf.*;

//2,19;
void setup()
{
 size(500,500);
 beginRecord(PDF, "MurerRose.pdf"); 

 colorMode(HSB,2*PI,100,100);
 background(0,0,100);
 smooth();
 ellipseMode(CENTER);
 PVector p=new PVector(0,0);
 PVector c=new PVector(0,0);
 float n=2;
 float d=radians(31);

 float sca=20;
 translate(width/2,height/2);
 
 strokeWeight(0.1);
// fill(10);

 for(int k=0;k<=360;k++) 
 {
   float theta=k*d;
   float r=sin(n*d*k);
   c.x=250*r*cos(theta);
   c.y=250*r*sin(theta);
   float phi=atan2(c.x-p.x,c.y-p.y);
   stroke(PI+phi,100,100,90);
   fill(PI+phi,100,100,90);
   line(c.x,c.y,p.x,p.y);
   ellipse(p.x,p.y,2.5,2.5);
   //ellipse(c.x,c.y,2,2);
   p.x=c.x;
   p.y=c.y;
 }
 endRecord();

}

