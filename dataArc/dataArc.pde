import processing.pdf.*;

PFont myFont;

float[] marks={85.7,52.2,3.11};
String[] when={"High School","Higher Secondary","Graduation"};
float start=0;
subnums mynums=new subnums(marks,when);
void setup()
{
  size(800,800);
  beginRecord(PDF, "performance.pdf");
  colorMode(HSB,360,100,100);
  background(0,0,100);
  smooth();
  ellipseMode(CENTER);
  myFont = createFont("OCRAEXT.TTF", 16);
  noFill();
  strokeWeight(5);
  strokeCap(SQUARE);
  noLoop();
}

void draw()
{
  translate(width/2,height/2);
  mynums.drawData();
  mynums.drawTag();
  mynums.drawGrid();
   textFont(myFont);
   fill(0,0,0);
   text("Result",0,0);
   endRecord();
}
