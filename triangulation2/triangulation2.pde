import org.processing.wiki.triangulate.*;

ArrayList triangles = new ArrayList();
ArrayList points = new ArrayList();
PVector centre=new PVector(0.0,0.0);
PVector A=new PVector(0.0,0.0);
PVector B=new PVector(0.0,0.0);
PVector C=new PVector(0.0,0.0);
void setup() {
  size(500, 500);
  smooth();
  ellipseMode(CENTER);
  strokeWeight(1);
  //frameRate(1);
  noLoop();
  reset();
}

void reset() {
  
  // clear the list
  points.clear();
  
  // fill the points arraylist with random points
  for (int i = 0; i < 15; i++) {
    // PVector.z is used to store an angle (particle's direction)
    points.add(new PVector(random(width-10), random(height-10), random(TWO_PI)));
  }
 
}

void mouseClicked() {
  saveFrame("tri.png");
  reset();
}

void draw() {
  model();
  view();
}

void model() {
  
  for (int i = 0; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    // p.z is used to store an angle value (particle's direction)
    p.x += 2.0*cos(p.z);
    p.y += 2.0*sin(p.z);
    if (p.x < 50 || p.x > width-50) { p.z += PI; }
    if (p.y < 50 || p.y > height-50) { p.z += PI; }
  }
  
  // get the triangulated mesh
  triangles = Triangulate.triangulate(points);
  
}
  
void view() {
  
  background(255);    
  noStroke();
  fill(70, 70, 250);
  
  // draw the points
  for (int i = 0; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    ellipse(p.x, p.y, 2.5, 2.5);
  }
 
  // draw the mesh of triangles
  stroke(0);
  fill(255, 40);
  beginShape(TRIANGLES);
 
  for (int i = 0; i < triangles.size(); i++) 
  {
    stroke(0);
    Triangle t = (Triangle)triangles.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }  
  endShape();
  
  for (int i = 0; i < triangles.size(); i++) 
  {
    noStroke();
    fill(178,61,242,30);
    Triangle t = (Triangle)triangles.get(i);
    A=t.p1;
    B=t.p2;
    C=t.p3;
    
    float c=dist(t.p1.x, t.p1.y,t.p2.x, t.p2.y);
       
    float a=dist(t.p2.x, t.p2.y,t.p3.x, t.p3.y);
    
    float b=dist(t.p1.x, t.p1.y,t.p3.x, t.p3.y);
    
    float s=(a+b+c)/2;
    
    float dia=(a*b*c)/( 2*sqrt( s*(s-a)*(s-b)*(s-c) ) );
    
    float D=2*(A.x*(B.y-C.y)+B.x*(C.y-A.y)+C.x*(A.y-B.y));
    
    
    centre.x=( (sq(A.y)+sq(A.x))*(B.y-C.y) + (sq(B.y)+sq(B.x))*(C.y-A.y) + (sq(C.y)+sq(C.x))*(A.y-B.y) ) /D;
    
    centre.y=( (sq(A.y)+sq(A.x))*(C.x-B.x) + (sq(B.y)+sq(B.x))*(A.x-C.x) + (sq(C.y)+sq(C.x))*(B.x-A.x) ) /D;
    
    ellipse(centre.x, centre.y,dia,dia);
    fill(0);
    ellipse(centre.x, centre.y,3,3);
    
  }  
  
}

