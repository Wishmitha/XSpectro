import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int w;

PImage fade;


void setup(){
    size(640,480);
    minim = new Minim(this);
    in = minim.getLineIn(Minim.STEREO,512);
    fft = new FFT(in.bufferSize(),in.sampleRate());
    fft.logAverages(60,7);
    
    stroke(255);
    w=width/fft.avgSize();
    strokeWeight(w);
    strokeCap(SQUARE);
    
    background(0);
    fade = get(0,0,width,height); // get the frame
}

void draw(){
  
  background(0);
  
  tint(255,255,255,252);
  image(fade,0,0);
  noTint();
  
  fft.forward(in.mix);
  
  for(int i=0; i<fft.avgSize();i++){
    line((i*w)+(w/2),height, (i*w)+(w/2), height - fft.getAvg(i)*4);
  }

  fade = get(0,0,width,height);
  
}