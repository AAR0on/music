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
  

Wave(){
 
 cols = W / gap;
 rows = H / gap;
 grid = new float[cols][rows];  
  
}
  
  
  
  
void BuildWaves()
{
  
 //This is the colour for the line in the waves
 background(0);
 stroke(255);
 noFill();
 
 //This is the position of the waves
 translate(width / 2, height / 2 + 30);
 rotateX(PI / 3);
 translate(- W / 2, - H / 2);
   
 //This makes the form of the waves
   for(int y = 0; y < rows - 1; y++)
 {
   beginShape(TRIANGLE_STRIP);
   for(int x = 0; x < cols; x++)
   {
     float c = map(x, 0, ab.size(), 0, 255);
     stroke(c, 255, 255);
     vertex(x * gap, y * gap, grid[x][y]);
     vertex(x * gap, (y + 1)* gap, grid[x][y*1]);
   }
   endShape();
 }
  
}

//This funcation makes the waves move
void Moving(){
  
  float total = 0;
  
  for(int i = 0; i < ab.size() ; i++)
  {
    total += abs(ab.get(i));
  }
 
  average = total / (float) ab.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
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
  
  
  
  
  
  
  
}
