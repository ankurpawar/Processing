//Flakes
/*
Change value of angle1 and angle2 for different types of flakes
Cesaro Fractal(angle1=85,angle2=90),
Hexagonal Cesaro(angle1=85,angle2=60),
Inverted Cesaro Fractal(angle1=-85,angle2=90),
Inverted Hexagonal Cesaro(angle1=-85,angle2=60),
Pentagonal Cesaro(angle1=85,angle2=72), 
Koch Snowflake(angle1=-60,angle2=120),
Inverted Koch Snowflake(angle1=60,angle2=120),
*/

import processing.pdf.*;

int maxLevel=6;//level of recursion
float len=200;
float angle1=radians(60);//base angle
float angle2=120;

float polyAngle=radians(angle2);//angle for polygon
float count=(int)360/angle2;
float sca=2+2*cos(angle1);//scale factor

void setup(){
  size(800, 800);
  beginRecord(PDF, "flake.pdf"); 

  colorMode(RGB,255,255,255) ;
  background(255);
  stroke(0);
  smooth();
  noFill();
  strokeWeight(0.1);
  translate(50,50);
  
  //translate(width/2-len*sca*0.25,height/2-len*sca*0.25);
  drawTree(0.0, 0.0, len,maxLevel);
  
  for(int n=0;n<count-1;n++){
     translate(len,0);
     rotate(polyAngle);
     drawTree(0.0, 0.0, len,maxLevel);
  }
   endRecord();

  //translate(width/2,height/2);
}

void drawTree(float x, float y, float wide, int level){                    
  if(level > 0) {
      
      pushMatrix();
      translate(0,0);
      drawTree(x, y, wide/sca, level-1);
      popMatrix();

      pushMatrix();
      translate(wide/sca,0);
      rotate(angle1);    
      drawTree(x, y, wide/sca, level-1);
      popMatrix();
      
      pushMatrix();
      translate(wide/sca+wide/sca*cos(-angle1),wide*sin(angle1)/sca);
      rotate(-angle1);    
      drawTree(x, y, wide/sca, level-1);
      popMatrix();
      
      pushMatrix();
      translate(wide/sca+wide*cos(angle1)/sca*2,0);
      drawTree(x, y, wide/sca, level-1);
      popMatrix();
      
      if (level==1){
        line(x,y,x+wide,y);
      }
   }
}


