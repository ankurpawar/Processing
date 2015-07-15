import processing.pdf.*;

//H fractal Tree

int maxLevel=9;
float len=200;
color from = color(240, 200, 0);
color to = color(0, 200, 153);
void setup() 
{
  size(1000, 800);
  beginRecord(PDF, "Hfractaltree.pdf"); 
  colorMode(RGB,255,255,255);
  background(0);
  stroke(255);
  noFill();
  //smooth();
  strokeWeight(0.1);
  //rectMode(C);
  pushMatrix();
  translate(width/2-len,height/2);
  //rotate(PI);
  drawTree(0.0, 0.0, len, len,PI/4,maxLevel);
  popMatrix();
  
  translate(width/2+len,height/2);
  rotate(PI);
  drawTree2(0.0, 0.0, len, len,PI/4,maxLevel+1);
  endRecord();
}

void drawTree(float x, float y, float wide,float high,float angle, int level) 
{                    
  
  if(level > 0) {
    
      color interA = lerpColor(from, to, float(level)/float(maxLevel));
      stroke(interA);
      line(x,y,x+wide,y);
      //ellipse(x+wide,y,5,5);
      pushMatrix();
      translate(0,-high*sin(angle));
      rotate(PI/2);    
      //drawTree(x, y, wide*sin(angle),high*sin(angle),angle, level-1);
      branch(x, y, wide*sin(angle),high*sin(angle),angle, 6);
      popMatrix();
      
      translate(0,high*0.707);
      rotate(-PI/2);    
      drawTree(x, y, wide*sin(angle),high*sin(angle),angle, level-1);
  }
}



void drawTree2(float x, float y, float wide,float high,float angle, int level) 
{                    
  
  if(level > 0) {
      
      line(x,y,x+wide,y);
      
      //ellipse(x,y,5,5);
      pushMatrix();
      translate(0,-high*sin(angle));
      rotate(PI/2);    
      drawTree2(x, y, wide*sin(angle),high*sin(angle),angle, level-1);
      popMatrix();
      
      translate(0,high*0.707);
      rotate(-PI/2);    
      drawTree(x, y, wide*sin(angle),high*sin(angle),angle, level-1);
  }
}


void branch(float x, float y, float wide,float high,float angle,int level) 
{                    
  
  if(level > 0) {
    
      color interA = lerpColor(from, to, float(level)/float(maxLevel));
      stroke(interA);
      
      line(x,y,x+wide,y);
      pushMatrix();
      translate(0,-high*sin(angle));
      rotate(PI/2);    
      branch(x, y, wide*sin(angle),high*sin(angle),angle, level-1);
      popMatrix();
      
  }
}
