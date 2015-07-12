//Pythagoras Tree

void setup() 
{
  size(700, 500);
  background(255);
  stroke(0);
  noFill();
  smooth();
  rectMode(CENTER);
  translate(width/2,height-100);
  drawTree(0.0, 0.0, 100, 100,8);
}

void drawTree(float x, float y, float wide,float high, int level) 
{                    
  
  if(level > 0) {

      rect(x, y, wide, high);
      pushMatrix();
      translate(wide/2,-high);
      rotate(PI/4);    
      drawTree(x, y, wide*0.707,high*0.707, level-1);
      popMatrix();
      
      translate(-wide/2,-high);
      rotate(-PI/4);
      drawTree(x, y, wide*0.707,high*0.707, level-1);
  }
}
