import java.util.Random; //could also use randomGaussian in processing 

Random generator;

void setup() {
  size(640, 360);
  generator = new Random();
  background(255);
}

void draw() {
  
  //gauss setup
  float sd = width/8;
  float mean = width/2;
  float gaussian = (float) generator.nextGaussian();
  float x = gaussian * sd + mean;
  
  //formatting
  noStroke();
  fill(100, 25.5);
  
  //drawing
  rectMode(CENTER);
  rect(x, height/2, 10, 100);
}
