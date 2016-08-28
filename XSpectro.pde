import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

void setup(){
    size(640,480);
    minim = new Minim(this);
    in = minim.getLineIn(Minim.STEREO,512);
    fft = new FFT(in.bufferSize(),in.sampleRate());
    
    stroke(255);
}

void draw(){
  
  background(0);
  fft.forward(in.mix);
  
  for(int i=0; i<fft.specSize();i++){
    line(i,height, i, height - fft.getBand(i)*4);
  }
}