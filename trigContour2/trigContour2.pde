
void setup()
{
 size(500,500);
int index=0,numColor=256;
colormap c=new colormap(color(255,255,255),color(45,75,145),color(250,255,55),numColor);
//colormap c=new colormap();
float lim=4*PI;
float from=-lim;
float to=lim;
float zmax=0.0,zmin=0.0;
float[][] zval=new float[height][width];
color fromColor=color(204, 102, 0);
color toColor=color(255,255,255);

//PImage  img=createImage(width,height,RGB);


for(int m=0;m<width;m++)
{
   float x=map(m,0,width-1,from,to);
   
   for(int n=0;n<height;n++)
   {
      float y=map(n,0,height-1,from,to);
      
      float z=sin(5*cos(pow(cos(x-y),5))+5*cos(pow(sin(x+y),5)))+cos(5*sin(pow(sin(x+y),5))-5*sin(pow(cos(x-y),5)));      


      //float z=sin(x+y)-cos(x-y);
      zmax=max(zmax,z);
      zmin=min(zmin,z);
      zval[n][m]=z;
      //set(m,n,color(map(val,-1,1,0,255)));
   }
   
}

for(int m=0;m<width;m++)
{
   for(int n=0;n<height;n++)
   {
      float z=map(zval[n][m],zmin,zmax,0,(numColor-1));
      index=round(z);
      set(n,m,color(c.cmap[index][0],c.cmap[index][1],c.cmap[index][2]));
   }
}


//image(img,0,0);
//saveFrame("cont.png");
println(zmax+"  "+zmin);
}






