class subnums
{
  int level;
  float[] percentage;
  float startAngle;
  float[] stopAngle;
  String[] period;
  subnums(float[] per,String[] when)
  {
    level=per.length;
    percentage=new float[level];
    stopAngle=new float[level];
    percentage=per;
    
    period=when;
  }
  void drawData()
  {
    strokeWeight(50);
    noFill();
    for(int n=0;n<level;n++)
    {
      stroke(map(percentage[n],0,100,90,270),100,90);
      startAngle=0;
      stopAngle[n]=map(percentage[n],0,100,0,2*PI);
      arc(0,0,150+120*n,150+120*n,startAngle,stopAngle[n]);
    }
    
  }
  
  void drawTag() 
  {
    for(int n=0;n<period.length;n++)
    {
      float x=(75+60*n)*cos(PI/2);
      float y=(75+60*n)*sin(PI/2);
      textFont(myFont);
      textAlign(CENTER);
      fill(0,0,0);
      text(period[n],x,y);
    }
    
    for(int n=0;n<period.length;n++)
    {
      float x=(75+60*n)*cos(stopAngle[n]);
      float y=(75+60*n)*sin(stopAngle[n]);
      textFont(myFont);
      textAlign(LEFT);
      fill(0,0,0);
      text(nf(percentage[n],2,2),x,y);
    }
  }
  
  void drawGrid()
  {
   strokeWeight(0.7); 
   stroke(0,0,0,90);
   for(int n=0;n<360;n+=36) 
   {
     float x=300*cos(radians(n));
     float y=300*sin(radians(n));
     line(0,0,x,y);
   }
   
   strokeWeight(0.5);
   stroke(0,0,0,30);
   for(int n=0;n<level;n++)
   {
     float angle=floor(map(percentage[n],0,100,0,360));
     
     float m=angle-(angle%36);

     float upto=m+36;
     //println(m);
     
     while(m<upto)
     {
       float x=300*cos(radians(m));
       float y=300*sin(radians(m));
       line(0,0,x,y);
       m+=3.6;
     }
     
     
   }
  
   noFill();
   stroke(0);
   strokeWeight(5);
   ellipse(0,0,600,600);
  }
  
  
}
