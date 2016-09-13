import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int w;

void setup(){
    size(640,480); // draw screen
    smooth();
    frameRate(999999999);
    
    minim = new Minim(this); // new minim object
    
    
    in = minim.getLineIn(Minim.STEREO,2048); // audio input from microphone (have to change this to get currently playing audio)
    
    fft = new FFT(in.bufferSize(),in.sampleRate()); // new fft object
    
    fft.logAverages(60,7); // getting log averages to draw within frame ???
    
    stroke(255); 
    w=width/fft.avgSize();
    strokeWeight(w); // display lines as bars
    
    background(0);

}

void draw(){
  
  background(0);
  smooth();
  
  fft.forward(in.mix); //generate fourier series
  
  for(int i=0; i<fft.avgSize();i++){
    line((i*w)+(w/2),height, (i*w)+(w/2), height - fft.getAvg(i));
  }

  
}