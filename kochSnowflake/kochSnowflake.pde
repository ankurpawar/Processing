//Koch Snowflake
//Recursive code for Koch Snowflake
import processing.pdf.*;

int maxLevel=5;
float len=500;

void setup() 
{
  size(1000, 800);
  beginRecord(PDF, "KochSnowflake.pdf");
  strokeJoin(ROUND);
  colorMode(RGB,255,255,255) ;
  background(255);
  stroke(0);
  smooth();
  
  noFill();
  strokeWeight(1);
  
  translate(width/2-250,height/2+150);
  drawTree(0.0, 0.0, len,maxLevel);
  
  translate(500,0);
  rotate(-2*PI/3);
  drawTree(0.0, 0.0, len,maxLevel);
  
  translate(500,0);
  rotate(-2*PI/3);
  drawTree(0.0, 0.0, len,maxLevel);
  
  endRecord();
}

void drawTree(float x, float y, float wide, int level) 
{                    
  if(level > 0) {
      
      pushMatrix();
      translate(0,0);
      drawTree(x, y, wide/3, level-1);
      popMatrix();

      pushMatrix();
      translate(wide/3,0);
      rotate(PI/3);    
      drawTree(x, y, wide/3, level-1);
      popMatrix();
      
      pushMatrix();
      translate(wide/3+wide/6,wide*tan(PI/3)/6);
      rotate(-PI/3);    
      drawTree(x, y, wide/3, level-1);
      popMatrix();
      
      pushMatrix();
      translate(2*wide/3,0);
      drawTree(x, y, wide/3, level-1);
      popMatrix();
      
      if (level==1){
        line(x,y,x+wide,y);
      }
      
  }
}


