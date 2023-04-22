Wave w;

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
  //General setup
  frameRate(60);
  //size(512, 512, P3D);
  fullScreen(P3D);
  colorMode(HSB);
  noCursor();

  //This allows for the music to play
  m = new Minim(this);
  ap = m.loadFile("Dolesng.mp3", 512);
  ab = ap.mix;
  ap.play();
}

void draw()
{
  //println(frameRate);
  background(0);
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
    xUFO = lerp(xUFO, pmouseX, 0.6f);
    yUFO = map(mouseY, height, 0, height/6, height/2);
  }
  else
  {    
    xLerp = width/2 + (width/3 * sin(radians(thetaA)));
    yLerp = height/3 + (150 * cos(radians(thetaB)));
    thetaA += 4;
    thetaB += w.lerpedAverage * 20;
    xUFO = lerp(xUFO, xLerp, 0.4f);
    yUFO = lerp(yUFO, yLerp, 0.4f);
  } 
  zUFO = map(yUFO, height/6, height/2, -100, 100);
  sUFO = map(yUFO, height/6, height/2, 10, 100);
  cUFO = color(map(w.cLerpedAverage, 0.0f, 0.1f, 0, 255), 255, 255);
  
  ufo.pos.x = xUFO;
  ufo.pos.y = yUFO;
  ufo.pos.z = zUFO;
  ufo.size = sUFO;
  ufo.c = cUFO;
  ufo.update();
  ufo.render();
}
