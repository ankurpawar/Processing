import processing.pdf.*;

//a=-1,b=-6,c=2;
//a=-0.5,b=-2,c=5;
//a=1.5,b=-2.5,c=1.5;
//a=0.5,b=-2.5,c=5;
//a=0.5,b=3.0,c=-2.0;
//a=1.5;b=-3.0;c=1.0;
//a=-2.0,b=-4.5,c=3.0;
//a=-1.0,b=2.0,c=4.0;
//a=-1.0,b=0.5,c=-3.5
//a=0.5,b=-2.5,c=-1.5;
//a=0.5,b=1.0,c=-1.5;
//a=-1.0,b=-3.5,c=2.0;
//a=-1.0,b=3.0,c=-2.5;
//a=0.75,b=2.25,c=-3.0;
//a=2.25,b=-3.75,c=4.5;
//a=-1.5,b=2.25,c=-3.75;
//a=0.75,b=-2.25,c=4.5;
//a=-0.75,b=0.75,c=-2.25;
//a=2.25,b=4.5,c=-4.5


void setup()
{
 size(1200,500);
 beginRecord(PDF, "filename.pdf"); 

 background(255);
 
 colorMode(HSB,2*PI,100,100);
 smooth();
 ellipseMode(CENTER);
 
 float a=-0.5,b=-2,c=1.5;
 
 
 float sca=75;
 float r,phi;
 float theta;
 PVector p=new PVector(0,0);
 PVector oldp=new PVector(0,0);
 PVector c1=new PVector(-25,0);
 PVector c2=new PVector(25,0);
 translate(width/2,height/2);
 
 strokeWeight(0.1);
 noStroke();
 
 theta = radians(-1);
 oldp.x = sca*( cos(a*theta)+cos(b*theta)/2+cos(c*theta)/3 );
 oldp.y = sca*( sin(a*theta)+sin(b*theta)/2+sin(c*theta)/3 );
 
 for(int i=0;i<721;i++) 
 {
   theta=radians(i);
   
   p.x=sca*( cos(a*theta)+cos(b*theta)/2+cos(c*theta)/3 );
   p.y=sca*( sin(a*theta)+sin(b*theta)/2+sin(c*theta)/3 );
   
   //calculate angle between the last and current point
   phi=atan2(p.y-oldp.y,p.x-oldp.x);
   line(p.x,p.y,oldp.x,oldp.y);
   
   //draw tangent
   pushMatrix();
   translate(p.x-width/3,p.y);
   rotate(phi);
   line(c1.x,c1.y,c2.x,c2.y);
   ellipse(c1.x,c1.y,2,2);
   ellipse(c2.x,c2.y,2,2);
   popMatrix();
   
   //draw normal
   pushMatrix();
   translate(p.x+width/3,p.y);
   rotate(phi+PI/2);
   line(c1.x,c1.y,c2.x,c2.y);
   ellipse(c1.x,c1.y,2,2);
   ellipse(c2.x,c2.y,2,2);
   popMatrix();
   
   oldp.x=p.x;
   oldp.y=p.y;
   fill(phi+PI,100,100,90);
   stroke(phi+PI,100,100,90);
 }
 endRecord();
 println("a="+a+",b="+b+",c="+c);
}


