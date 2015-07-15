void setup()
{
 size(500,500);

float lim=8*PI;
float from=-lim;
float to=lim;
float zmax=0.0,zmin=0.0;

color fromColor=color(204, 102, 0);
color toColor=color(255,255,255);

PImage  img=createImage(width,height,RGB);


for(int m=0;m<width;m++)
{
   float x=map(m,0,width-1,from,to);
   
   for(int n=0;n<height;n++)
   {
      float y=map(n,0,height-1,from,to);
      float z=sin(x+y)-cos(x-y);
      zmax=max(zmax,z);
      zmin=min(zmin,z);
      //set(m,n,color(map(val,-1,1,0,255)));
   }
   
}

for(int m=0;m<width;m++)
{
   float x=map(m,0,width-1,from,to);
   
   for(int n=0;n<height;n++)
   {
      float y=map(n,0,height-1,from,to);
      float z=sin(x+y)-cos(x-y);
      z=map(z,zmin,zmax,0,1);
      //set(m,n,color(map(val,-1,1,0,255)));
      img.pixels[m+n*width]=lerpColor(fromColor,toColor,z);
   }
   
}


image(img,0,0);
saveFrame("cont.png");
}






