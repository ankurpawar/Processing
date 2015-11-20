
import org.processing.wiki.triangulate.*;

PImage img;  // Declare variable "a" of type PImage
ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
PVector p=new PVector(0,0);

void setup()
{
  img = loadImage("flower.png");  // Load the image into the program  
  size(img.width,img.height);
  background(255);
  strokeWeight(0.1);  
  noLoop();
}

void draw()
{
  int dimension = (img.width*img.height);
  for (int i=0; i < 1500; i++) 
  {
      p.x=random(0,width-1);
      p.y=random(0,height-1);
      points.add(new PVector(p.x,p.y,0));
  } 
  triangles = Triangulate.triangulate(points);
  scale(3)  ;
  beginShape(TRIANGLES);
  scale(0.25);
  noStroke();
  for (int i = 0; i < triangles.size(); i++) 
  {
    Triangle t = (Triangle)triangles.get(i);
    color c=img.pixels[round(t.p2.x)+round(t.p2.y)*img.width];
    fill(c);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}
