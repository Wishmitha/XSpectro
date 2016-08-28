import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int w;

void setup(){
    frameRate(999999999);
    size(640,480);
    minim = new Minim(this);
    in = minim.getLineIn(Minim.STEREO,512);
    fft = new FFT(in.bufferSize(),in.sampleRate());
    fft.logAverages(60,7);
    
    stroke(255);
    w=width/fft.avgSize();
    strokeWeight(w);
    strokeCap(SQUARE);
}

void draw(){
  
  background(0);
  fft.forward(in.mix);
  
  for(int i=0; i<fft.avgSize();i++){
    line((i*w)+(w/2),height, (i*w)+(w/2), height - fft.getAvg(i)*4);
  }
}