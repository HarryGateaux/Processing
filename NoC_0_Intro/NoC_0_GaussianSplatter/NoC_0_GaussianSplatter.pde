import java.util.Random; //could also use randomGaussian in processing 

Random generator;

void setup() {
  size(640, 360);
  generator = new Random();
  background(255);
}

void draw() {

  //gauss setup
  float sd = width/10;
  float mean = width/2;
  float mean_y = height/2;
  float gaussianX = (float) generator.nextGaussian();
  float x = gaussianX * sd + mean;
  float gaussianY = (float) generator.nextGaussian();
  float y = gaussianY * sd + mean_y;

  //formatting
  noStroke();
  fill(100, 100);

  //drawing
  rectMode(CENTER);
  ellipse(x, y, 5, 5);
}
