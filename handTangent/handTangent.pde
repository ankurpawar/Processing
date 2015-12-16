import processing.pdf.*;
import geomerative.*;

RShape grp;
RShape s;

float len=30;//default 10
float angle;

float LENGTHTANGENT = 50;
float LENGTHTANGENTGROWTH = 1.0001;//04;

// The velocity of the calligraphy
int VELOCITY = 500;
PVector oldp=new PVector(0,0);
void setup(){
  size(1000, 600);
  beginRecord(PDF, "output.pdf"); 
  colorMode(HSB,360,100,100,100);
  smooth();
  strokeWeight(0.1);
  background(0,0,100,100);
  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  grp = RG.loadShape("hand.svg");
  grp = RG.centerIn(grp, g);
  LENGTHTANGENT = LENGTHTANGENT * width/800F;
  ellipseMode(CENTER);
  noLoop();
}

void draw(){
  noFill();
  stroke(0,0,0,25);
  translate(width/2, height/2);
  float k=0.0002;
  scale(0.9);    
  int numPoints=2000;
  
  RPoint[] points=new RPoint[numPoints];
  RPoint[] tang=new RPoint[numPoints];
  float angle[]=new float[numPoints];
  float maxLen=0;
  for(int n=0;n<numPoints;n++)
  {
    k=float(n)/float(numPoints);
    
    RPoint tg = grp.getTangent(k);
    RPoint p = grp.getPoint(k);
    angle[n] = atan2(p.y-oldp.y, p.x-oldp.x);
    points[n]=p;
    tang[n]=tg;
    maxLen=max(maxLen,dist(tg.x,tg.y,-tg.x,-tg.y));
    
    line(p.x-len*cos(angle[n]), p.y-len*sin(angle[n]), p.x + len*cos(angle[n]), p.y + len*sin(angle[n]));
    
    oldp.x=p.x;
    oldp.y=p.y;
    stroke(map(angle[n],-PI,PI,0,360),100,100,50);
  }  
  endRecord();
}
