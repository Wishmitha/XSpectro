import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
FFT fft;

int w; // the width of the band

color col1 = color(100,255,100); // from this colour
color col2 = color(250,100,100); // to this colour
color interCol; // intermediate colour

float heightFactor = 500; // initial height factor

void setup(){
    size(640,480); // draw screen
    smooth();
    frameRate(60);
    
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
  
  stroke(col1); // colour of band set to col1
  
  regulateHeight(); // height regulation function
  
  
  fft.forward(in.mix); //generate fourier series
  
  for(int i=0; i<fft.avgSize();i++){ // drawing spectrum
    interCol = lerpColor(col1,col2,fft.getAvg(i)/200); // set colour of the band according to the height
    stroke(interCol); // set indermediate colour to the band
    line((i*w)+(w/2),height, (i*w)+(w/2), height - (fft.getAvg(i))*(heightFactor/1000)); // height factor devided by 1000 to regulate the height of the spectrum
  }

}

void regulateHeight(){ // height regulation function
  
  text("Height Factor :"+(heightFactor/1000),width-175,20); // displays height factor
  
  if(keyPressed == true){
    
    if(keyCode == UP){ // increase the value if up arrow is pressed
      heightFactor+=20;
      
      
      if(heightFactor >= 3000){ // max value of height factor
        heightFactor = 3000;
        text("Maximum value reached",width-175,40);
      }
      
    }else if(keyCode == DOWN){ // decrease the value if down arrow is pressed
      heightFactor-=20;
      
      
      if(heightFactor <= 100){ // min value of height factor
        heightFactor = 100;
        text("Minimum value reached",width-175,40);
      }
      
    }else if(key == ' '){ // reset to default settings if space is pressed ( height factor / 1000 = 0.5 )
      heightFactor = 500;
      text("Switched to Default Settings",width-175,40);
    }
  }
}