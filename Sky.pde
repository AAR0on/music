class Sky
{
  PVector colRange;
  float t;
  
  Sky(float x, float y, float z)
  {
    this.colRange = new PVector(x, y, z);
    t = 0;
    initialiseStars();
  }
  
  void buildSun()
  {
   pushMatrix();
   stroke(color(map(w.cLerpedAverage, 0.0f, 0.1f, colRange.z, colRange.y), 255, 255));
   fill(colRange.x, 255, 255);
   translate(width/2, -750, -2500);
   t++;
   rotateY(t);
   sphere(500);
   popMatrix();
   
   pushMatrix();
   fill(0);
   noStroke();
   translate(width/2, -750, -1700);
   rect(-750, 400, 2000, 750);
   popMatrix();
   
   pushMatrix();
   translate(width/2, -750, -2500);
   fill(160, 255, 10);
   circle(0, 0, 2000);
   fill(160, 255, 0);
   rect(-width * 2, -1000, width * 4, 1050);
   drawStars();
   noStroke();
   fill(160, 255, 15);
   circle(0, 0, 1600);
   fill(160, 255, 20);
   circle(0, 0, 1600);
   fill(160, 255, 25);
   circle(0, 0, 1400);
   popMatrix();
  }
  
  void initialiseStars()
  {
    for (int i = 0; i < 2000; i ++)
    {
      starsX[i] = random(-width * 2, width * 4);
      starsY[i] = random(-1000, 50);
      starsS[i] = random(0.1f, 2.5f);
    }
  }

  float starsX[] = new float[2000];
  float starsY[] = new float[2000];
  float starsS[] = new float[2000];
  
  void drawStars()
  {   
    for(int i = 0; i < 2000; i++)
    {
      strokeWeight(starsS[i]);
      stroke(30, 50, 255, map(w.cLerpedAverage, 0.0f, 0.1f, 0, i/7));
      point(starsX[i], starsY[i]);
    }
  }
  
}
