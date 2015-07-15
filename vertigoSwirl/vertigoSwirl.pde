/**
 * Vertigo Swirl generated using recursion
 */
import processing.pdf.*;

int numCircles=20;  //number of circles drawn in single level of recursion
float[] dieRatio={0.96 , 0.97 ,0.98 ,0.98,0.985,0.985}; //rate at which radius of circle decreases
colormap c;
void setup() 
{
  size(500, 500);
  beginRecord(PDF, "vertigoSwirl.pdf");
  c=new colormap(color(175,125,05),color(255,255,255),numCircles);
  background(255);
  //stroke(0);strokeWeight(0.1);
  noStroke();
  noFill();
  ellipseMode(CENTER);
  smooth();
  translate(width/2,height/1.15);
  //rotate(PI/2);
  drawCircle(0.0,0.0,200,6);
  endRecord();  
}

void drawCircle(float x,float y, float radius, int level) 
{                    
         
  if(level > 0) 
  {
    float rad=radius;
    
    for(int n=0; n<numCircles ; n++)
    {
     rad=rad*dieRatio[level-1];
      if(level%2==0){
       fill(c.cmap[n][0],c.cmap[n][1],c.cmap[n][2]); 
      }
      else{
       fill(c.cmap[numCircles-n-1][0],c.cmap[numCircles-n-1][1],c.cmap[numCircles-n-1][2]); 
      }
      ellipse(x , y-rad , rad*2 , rad*2);  
    }  
    
    float px=rad*cos(3*PI/2);
    float py=rad*sin(3*PI/2);
    
    drawCircle(x,py+y-rad, -rad, level-1);
    
  }
}
