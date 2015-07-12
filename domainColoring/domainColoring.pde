
float from=-2*PI;
float upto= 2*PI;
float x,y;
float angle,absval,modu;
int i,j;


void setup()
{
  size(500,500);
  colorMode(HSB,360,1,1);
  noLoop();
}

void draw()
{
  PImage  img=createImage(width,height,RGB);
  for (i=0;i<width-1;i++)
  {
    for (j=0;j<height-1;j++)
    {
      
      x=map(i,0,width-1,from,upto);
      y=map(j,0,height-1,from,upto);
      
      Complex a = new Complex((double)x , (double)y);
      Complex z=  a.pow(2);
      
      //angle=map( degrees(PI+(float)z.phase()) , 0 , 360 , 0 , 135);
      angle= degrees( PI+(float)z.phase() ) ;
      
      absval=(float) z.abs();
      
      modu =log(absval)/(log(2));
      modu =modu%1;
      modu = 0.35 +modu *0.65;

      color c=color(angle,1,1);
      
      img.pixels[i+j*width]=c;

      //set(i,j,c);
    }
  }

  image(img,0,0);
  //saveFrame("domcol.png"); 

}
  

