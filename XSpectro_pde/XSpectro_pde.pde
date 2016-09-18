import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int w;

color col1 = color(100,255,100); // from this colour
color col2 = color(250,100,100); // to this colour
color interCol; // intermediate colour

void setup(){
    size(640,480); // draw screen
    smooth();
    frameRate(999999999);
    
    minim = new Minim(this); // new minim object
    
    in = minim.getLineIn(Minim.STEREO,2048); // audio input from microphone (have to change this to get currently playing audio)
    
    fft = new FFT(in.bufferSize(),in.sampleRate()); // new fft object
    
    fft.logAverages(60,7); // getting log averages to draw within frame ???
    
    stroke(col1); 
    w = width/fft.avgSize();
    strokeWeight(w); // display lines as bars
    
    background(0);

}

void draw(){
  
  background(0);
  stroke(col1);
  
  fft.forward(in.mix); //generate fourier series
  
  for(int i=0; i<fft.avgSize();i++){
    interCol = lerpColor(col1,col2,fft.getAvg(i)/200); // set colour of the band according to the height
    stroke(interCol);
    line((i*w)+(w/2),height, (i*w)+(w/2), height - (fft.getAvg(i)*0.5)); // 0.5 to reduce the height of the band
  }

  
}