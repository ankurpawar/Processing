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
  background(255);
  //frameRate(1);
  noLoop();
  reset();
}

void reset() {
  
  // clear the list
  points.clear();
  
  // fill the points arraylist with random points
  for (int i = 0; i < 900; i++) {
    // PVector.z is used to store an angle (particle's direction)
    points.add(new PVector(random(width), random(height), random(TWO_PI)));
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
    if (p.x < 0 || p.x > width) { p.z += PI; }
    if (p.y < 0 || p.y > height) { p.z += PI; }
  }
  
  // get the triangulated mesh
  triangles = Triangulate.triangulate(points);
  
}
  
void view() {
  
  background(255);    
  
  
  // draw the mesh of triangles
  stroke(0);
  fill(0,0);
  beginShape(TRIANGLES);
 
  for (int i = 0; i < triangles.size(); i++) 
  {
    stroke(200,152,233);
    Triangle t = (Triangle)triangles.get(i);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }  
  endShape();
  
  
  fill(0);
  noStroke();
  // draw the points
  for (int i = 0; i < points.size(); i++) {
    PVector p = (PVector)points.get(i);
    ellipse(p.x, p.y, 5, 5);
  }
  
  
  for (int i = 0; i < triangles.size(); i++) 
  {
    noStroke();
    fill(55,89,240,80);
    Triangle t = (Triangle)triangles.get(i);
    A=t.p1;
    B=t.p2;
    C=t.p3;
    
    float c=dist(t.p1.x, t.p1.y,t.p2.x, t.p2.y);
       
    float a=dist(t.p2.x, t.p2.y,t.p3.x, t.p3.y);
    
    float b=dist(t.p1.x, t.p1.y,t.p3.x, t.p3.y);
    
    float s=(a+b+c)/2;
    
    float R=sqrt( (s-a)*(s-b)*(s-c)/s  );
    
    float P=a+b+c;
    
    
    centre.x=(a*A.x+b*B.x+c*C.x)/P;
    
    centre.y=(a*A.y+b*B.y+c*C.y)/P;
    
    ellipse(centre.x, centre.y,2*R,2*R);
    fill(0);
    ellipse(centre.x, centre.y,2,2);
    
  }  
  
   
  
}

