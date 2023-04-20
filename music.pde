import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim m;
AudioInput ai;
AudioPlayer ap;
AudioBuffer ab;

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

void setup()
{
  colorMode(HSB);
 m = new Minim(this);
 ap = m.loadFile("Dolesng.mp3", 512);
 ab = ap.mix;
 ap.play();

 frameRate(60);
 size(512, 512, P3D);
 
 cols = W / gap;
 rows = H / gap;
 grid = new float[cols][rows];  
}


void draw()
{
 BuildWaves();

  println(frameRate);
  
  
}

void BuildWaves()
{
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
  
 background(0);
 stroke(255);
 noFill();
 
 translate(width / 2, height / 2 + 30);
 rotateX(PI / 3);
 translate(- W / 2, - H / 2);
  
   
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
