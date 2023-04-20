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


void setup()
{
  w = new Wave();
 
  //General setup  
  frameRate(60);
  size(512, 512, P3D);
  colorMode(HSB);
  
  //This allows for the music to play 
  m = new Minim(this);
  ap = m.loadFile("Dolesng.mp3", 512);
  ab = ap.mix;
  ap.play();
}


void draw()
{
 println(frameRate);

 w.BuildWaves();
 w.Moving();

  
  
}
