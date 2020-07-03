import processing.sound.*;
SoundFile file;

FFT fft;
int bands = 4096;
float[] spectrum = new float[bands];

void setup() {
  size(1920, 1080, P3D);
  background(255);
  frameRate(16);
  
  fft = new FFT(this, bands);
  file = new SoundFile(this, "/Users/alexanderroberts/Desktop/FERNRHI FOR VIDEO/fernrhizoid 8.wav");
  file.play();
  fft.input(file);
}      

void draw() { 
  rotateZ(PI*second());
  background(0);
  lights();
  
  fft.analyze(spectrum);
  
  rotateY(PI/2);
  rotateZ(-PI/12);
  
  for(int i = 0; i < bands; i++){
 
  stroke(200, 200, 200);
  strokeWeight(3);
  line( i, height, i, height - spectrum[i]*height*50 );
  rotateZ(PI/spectrum[i]); 

  stroke(40 + (100* spectrum[i] * spectrum[i]), 220, 200);
  strokeWeight(2);
  line( i, height, i*2, height + spectrum[i]*height*50 );
  
  rotateZ(PI/spectrum[i]); 
  rotateX(spectrum[i/4]);

  stroke(1000, 10, 255 - spectrum[i]);
  strokeWeight(2);
  line( i, height, i*2, height + (100* spectrum[i] * spectrum[i]) );

  rotateZ(PI/2*spectrum[i]); 
 
  rotateX(spectrum[i/2]);
  } 
  translate(width/2, height/2);
  rotateY(-PI);
 
}
