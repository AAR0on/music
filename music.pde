Wave w;

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

UFO ufo;

void setup()
{
  w = new Wave();
  ufo = new UFO(100, 0.1f, color(255, 255, 255), width/2, height/3, 100);
  //General setup
  frameRate(60);
  //size(512, 512, P3D);
  fullScreen(P3D);
  colorMode(HSB);

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
  ufo.pos.x = mouseX;
  ufo.pos.y = map(mouseY, height, 0, height/6, height/2);
  ufo.pos.z = map(mouseY, height, 0, -100, 100);
  ufo.size = map(mouseY, height, 0, 10, 100);
  ufo.c = color(map(w.cLerpedAverage, 0.0f, 0.1f, 0, 255), 255, 255);
  w.BuildWaves();
  w.Moving();
  ufo.update();
  ufo.render();
}
