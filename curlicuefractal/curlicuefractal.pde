float d=4.66920160910299067185320382046620  ;//seed
float eulers = 0.577215664901532860606512;
float s=9*d;

float sca=2;

float x=0,y=0,xn,yn;
float theta,phi;

void setup()
{
  
  size(1280,800);
  //beginRecord(PDF, "filename.pdf"); 
  background(255);
  beginShape();
  smooth();
  stroke(0);strokeWeight(0.1);
  //noStroke();fill(0);
  s=PI;
  //s=eulers;
  
  noLoop();
}


void draw()
{
  translate(width/2,height/2);
  for(int n=0;n<10000;n++)
  {
    theta=(theta+2*PI*s)%TWO_PI;
    phi=phi%TWO_PI+theta;
    //phi=(phi+2*PI*((7*n+41)%511)*s)%TWO_PI;
    
    x=x+cos(phi);
    y=y+sin(phi);
    
    curveVertex(sca*x,sca*y);
    //ellipse(sca*x,sca*y,2,2);  
    //line(sca*x,sca*y,sca*xn,sca*yn);
    xn=x;
    yn=y;
  }
  endShape();
  //endRecord();
}
