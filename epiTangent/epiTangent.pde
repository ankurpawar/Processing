import processing.pdf.*;
//15,5,3;a=12,b=3,h=4;a=12,b=3,h=3;16,4,3; 
void setup()
{
 size(1280,800);
 beginRecord(PDF, "tangent.pdf"); 
 
 colorMode(HSB,360,100,100);
 background(0,0,100);
 smooth();
 ellipseMode(CENTER);
 
 float a=15,b=5,h=3;  
 
 float sca=5;
 float phi;
 PVector p=new PVector(0,0);
 PVector oldp=new PVector(0,0);
 PVector c1=new PVector(-45,0);
 PVector c2=new PVector(45,0);
 translate(width/2,height/2);
 
 strokeWeight(0.1);
 noStroke();
 double d = 0;
 float theta = -0.0174603174603175;//(float)(-PI/200);
 //for(int i=0;i<360;i++)
 oldp.x=sca*((a+b)*cos(theta)+h*cos(theta*(a+b)/b));
   oldp.y=sca*((a+b)*sin(theta)+h*sin(theta*(a+b)/b));
  //do //for(d = 0; d < 2*PI ; d += PI/200)
 for(int i = 0; i <= 360 ; ++i) 
 {
   theta=  radians(i);
   p.x=sca*((a+b)*cos(theta)+h*cos(theta*(a+b)/b));
   p.y=sca*((a+b)*sin(theta)+h*sin(theta*(a+b)/b));
   
   phi=atan2(-p.y+oldp.y,-p.x+oldp.x);
   line(p.x,p.y,oldp.x,oldp.y);
   
   pushMatrix();
   translate(p.x-width/3,p.y);
   rotate(phi+PI/2);
   line(c1.x,c1.y,c2.x,c2.y);
   ellipse(c1.x,c1.y,2,2);
   ellipse(c2.x,c2.y,2,2);
   popMatrix();
   
   pushMatrix();
   translate(p.x+width/3,p.y);
   rotate(phi);
   line(c1.x,c1.y,c2.x,c2.y);
   ellipse(c1.x,c1.y,2,2);
   ellipse(c2.x,c2.y,2,2);
   popMatrix();
   
   
   oldp.x=p.x;
   oldp.y=p.y;
   
   fill(map(phi,-PI,PI,0,360),100,100,90);
   stroke(map(phi,-PI,PI,0,360),100,100,90);
   //d += PI/200;
 }
 //while(d < TWO_PI);
// textFont(font, 32); 
 
// text("hypotrochoid:a="+nfs(a,1,1)+",b="+nfs(b,1,1)+",h="+nfs(h,1,1), -width/2+10, -height/2+30);
  
  
 endRecord();

}


