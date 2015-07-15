void setup()
{
 size(500,500);
 background(255);
 smooth();
 ellipseMode(CENTER);
 PVector p=new PVector(0,0);
 PVector c=new PVector(0,0);
 int a=10;
 int b=2;
 int h=4;
 float sca=20;
 translate(width/2,height/2);
 
 strokeWeight(0.3);
 fill(10);
 for(int i=0;i<360;i++) 
 {
   float theta=radians(i);
   p.x=sca*((a-b)*cos(theta)+h*cos(theta*(a-b)/b));
   p.y=sca*((a-b)*sin(theta)-h*sin(theta*(a-b)/b));
   c.x=10*sca*cos(theta);
   c.y=10*sca*sin(theta);
   line(p.x,p.y,c.x,c.y);
   ellipse(p.x,p.y,2,2);
   ellipse(c.x,c.y,2,2);
 }
}

