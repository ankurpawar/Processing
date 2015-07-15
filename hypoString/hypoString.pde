import processing.pdf.*;
//10,2,2,150;8,2,2,250;12,3,6,50;10,2,1,100;12,3,1,100
void setup()
{
 size(800,800);
 beginRecord(PDF, "hypostrings.pdf"); 
 int len=361;
 float a=9,b=3,h=5;
 int con=150;
 float[] pointX=new float[len];
 float[] pointY=new float[len];
 
 colorMode(HSB,360,100,100);
 background(0,0,100);
 smooth();
 ellipseMode(CENTER);
 strokeWeight(0.1);
 
 
 float sca=20;
 float phi;
 PVector p=new PVector(0,0);
 PVector oldp=new PVector(0,0);
 PVector c1=new PVector(-55,0);
 PVector c2=new PVector(55,0);
 translate(width/2,height/2);
 
 strokeWeight(0.1);
 noStroke();
 
 for(int i=0;i<len;i++) 
 {
   float theta=radians(i);
   p.x=sca*((a-b)*cos(theta)+h*cos(theta*(a-b)/b));
   p.y=sca*((a-b)*sin(theta)-h*sin(theta*(a-b)/b));
   pointX[i]=p.x;
   pointY[i]=p.y;
  }
  
  stroke(0,100,0);
  for(int i=0;i<len;i++) 
 {
   oldp.x=pointX[i];
   oldp.y=pointY[i];
   
   c1.x=pointX[(i+con)%len];
   c1.y=pointY[(i+con)%len];
   
   phi=atan2(oldp.y-c1.y,oldp.x-c1.x);
   stroke(map(phi,-PI,PI,0,360),100,100,90);
   line(oldp.x,oldp.y,c1.x,c1.y);
   fill(map(phi,-PI,PI,0,360),100,100,90);
   ellipse(oldp.x,oldp.y,2,2);
  }
// textFont(font, 32); 
 
// text("hypotrochoid:a="+nfs(a,1,1)+",b="+nfs(b,1,1)+",h="+nfs(h,1,1), -width/2+10, -height/2+30);
  
  
 endRecord();

}


