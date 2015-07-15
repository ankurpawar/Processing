class colormap
{
 float[][] cmap;
 int len=64; //default length
 int topN,botN;//for 3 color colormap
 color from;
 color to;
 color mid;

 colormap()
 {
  cmap=new float[64][3];
  from=color(0,0,0);
  to=color(255,255,255);
  makeColormap(from,to);
  
 }
 
 colormap(color f ,color t,int l)
 {
  from=f;
  to=t;
  len=l; 
  cmap=new float[len][3];
  makeColormap(from,to);
  
 }

 colormap(color f ,color m,color t,int l)
 {
  from=f;
  mid=m;
  to=t;
  len=l;   
  cmap=new float[len][3];
  makeColormap(from,mid,to);
  
 }
  
 void makeColormap(color f,color t)
 {
   
   interpMap(f,t,len);
 }
 
 void makeColormap(color f,color m,color t)
 {
    
 
    sizePartialMaps();
   
    colormap cmapTop=new colormap(f,m,topN);
  
    colormap cmapBot=new colormap(m,t, botN);

    for(int i=0;i<botN;i++)
    {
     cmap[i][0]=cmapTop.cmap[i][0];
     cmap[i][1]=cmapTop.cmap[i][1];
     cmap[i][2]=cmapTop.cmap[i][2];
    }
    
    for(int i=0;i<botN;i++)
    {
     cmap[i+botN][0]=cmapBot.cmap[i][0];
     cmap[i+botN][1]=cmapBot.cmap[i][1];
     cmap[i+botN][2]=cmapBot.cmap[i][2];
    }
    //arrayCopy(cmapTop,cmap,len-1);
    //arrayCopy(cmapBot,cmap,len);
  
 }

 void interpMap(color f, color t,int n)
 { 
   for(int j=0; j < n ; j++ )
   {
    color c= lerpColor(f, t, map(j,0,len-1,0,1));
    cmap[j][0] = c >> 16 & 0xFF;
    cmap[j][1] = c >> 8 & 0xFF ;
    cmap[j][2] = c & 0xFF;
   }
   
  }

 void sizePartialMaps()
 {
  len = len + 1;
  topN =  ceil(len/2);
  botN = floor(len/2);
 }


}
