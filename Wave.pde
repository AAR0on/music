class Wave{
  
// variables for the structer of the waves
float[][] grid; 
float moving = 0;
int W = 4500;
int H = 3500;
float halfw = width / 2;
float halfh = height / 2;
int cols;
int rows;
int gap = 20;
float average = 0;
float lerpedAverage = 0;
float cLerpedAverage = 0;
color c = 0;
PVector colRange;
  

Wave(){
  
 cols = W / gap;
 rows = H / gap;
 grid = new float[cols][rows];  
  
}
  
  
  
void BuildWaves()
{
  
 //This is the colour for the line in the waves
 //background(0);
 buildSun();
 stroke(c);
 noFill();
 strokeWeight(1);
 //This is the position of the waves
 pushMatrix();
 translate(width / 2, height / 2 + 30);
 rotateX(PI / 3);
 translate(- W / 2, - H / 2);
 //This makes the form of the waves
   for(int y = 0; y < rows - 1; y++)
 {
   beginShape(TRIANGLE_STRIP);
   for(int x = 0; x < cols; x++)
   {
     stroke(c);
     vertex(x * gap, y * gap, grid[x][y]);
     vertex(x * gap, (y + 1)* gap, grid[x][y*1]);
   }
   endShape();
 }
  popMatrix();
}

//This functions makes the waves move
void Moving(){
  
  float total = 0;
  
  for(int i = 0; i < ab.size() ; i++)
  {
    total += abs(ab.get(i));
  }
 
  average = total / (float) ab.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
  cLerpedAverage = lerp(cLerpedAverage, average, 0.4f);
  c = color(map(cLerpedAverage, 0.0f, 0.1f, colRange.x, colRange.y), 255, 255);
  moving -= ap.left.get(0) + lerpedAverage * 2;
  float yoff = moving;
    
  for(int y = 0; y < rows; y++)
 {
   float xoff = 0;
   for(int x = 0; x < cols; x++)
   {
     grid[x][y] = map(noise(xoff,yoff), 0, 1, -35, 35);
     xoff+= 0.2;
   }
   yoff += 0.2;
 }
}
  
  float t = 0;
  void buildSun()
  {
   pushMatrix();
   stroke(color(map(cLerpedAverage, 0.0f, 0.1f, 0, 30), 255, 255));
   fill(30, 255, 255);
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
   fill(160, 255, 15);
   circle(0, 0, 1600);
   fill(160, 255, 20);
   circle(0, 0, 1600);
   fill(160, 255, 25);
   circle(0, 0, 1400);

   popMatrix();
  }
  
  
  
  
  
}
