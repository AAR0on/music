Wave w;
Sky sky;


import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Audio Vars
Minim m;
AudioInput ai;
AudioPlayer ap;
AudioBuffer ab;
boolean paused = true;

void setup()
{
  w = new Wave();
  ufo = new UFO(100, 0.1f, color(255, 255, 255), width/2, height/3, 100);
  sky = new Sky(35, -20, 35);
  //General setup
  frameRate(60);
  //size(512, 512, P3D);
  fullScreen(P3D);
  colorMode(HSB);
  noCursor();
  w.colRange =  new PVector(200, 255);
  
  //This allows for the music to play
  m = new Minim(this);
  ap = m.loadFile("Dolesng.mp3", 512);
  ab = ap.mix;
  ap.play();
}

void draw()
{
  println(frameRate);
  background(160, 255, 10);
  w.BuildWaves();
  w.Moving();
  drawUFOs();
}

void keyPressed()
{
  if(key == 'c')
  {
    cruise = !cruise;
  }
  if(key == ' ')
  {
      if (ap.isPlaying())
      {
        ap.pause();
      }
      else
      {
        ap.loop();
      }
  }
  if(keyCode == UP)
  {
    if(w.colRange.y != 255)
    {
      w.colRange.x += 55;
      w.colRange.y += 55;
    }
    if(sky.colRange.y != -20)
    {
       sky.colRange.x-= 55;
       sky.colRange.y-= 55;
       sky.colRange.z-= 55;
    }
  }
  if(keyCode == DOWN)
  {
    if(w.colRange.y != 35)
    {
      w.colRange.x -= 55;
      w.colRange.y -= 55;
    }
    if(sky.colRange.z != 255)
    {
       sky.colRange.x+= 55;
       sky.colRange.y+= 55;
       sky.colRange.z+= 55;
    }
  }
}

//UFO Vars
UFO ufo;
float xUFO, yUFO, zUFO, sUFO;
color cUFO;
boolean cruise = false;
float thetaA, thetaB = 0;
float xLerp, yLerp;

void drawUFOs()
{
  if(!cruise)
  {
    xUFO = lerp(xUFO, pmouseX, 0.4f);
    yUFO = map(mouseY, height, 0, height/6, height/2);
  }
  else
  {    
    xLerp = width/2 + (width/3 * sin(radians(thetaA)));
    yLerp = height/3 + (150 * cos(radians(thetaB)));
    thetaA += 3;
    thetaB -= w.lerpedAverage * 20;
    xUFO = lerp(xUFO, xLerp, 0.4f);
    yUFO = lerp(yUFO, yLerp, 0.4f);
  }
  cUFO = color(map(w.cLerpedAverage, 0.0f, 0.1f, 0, 255), 255, 255);
  
  ufo.pos.x = xUFO;
  ufo.pos.y = yUFO;
  ufo.pos.z = zUFO;
  ufo.size = sUFO;
  ufo.c = cUFO;
  ufo.update();
  ufo.render();
}
