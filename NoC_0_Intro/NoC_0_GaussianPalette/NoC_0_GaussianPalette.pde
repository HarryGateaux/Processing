import java.util.Random; //could also use randomGaussian in processing 

Random generator;

void setup() {
  size(640, 640);
  generator = new Random();
  background(255);
}

void draw() {

  //gauss setup
  //float sd = width/4;
  //float mean = width/2;
  //float mean_y = height/2;
  //float gaussianX = (float) generator.nextGaussian();
  //float x = gaussianX * sd + mean;
  //float gaussianY = (float) generator.nextGaussian();
  //float y = gaussianY * sd + mean_y;

  //formatting
  noStroke();
  colorMode(HSB);

  for (int i=0; i<360; i++) {
    for (int j=0; j<300; j++){
     fill(i,j, 360);
     ellipse(width/2 + cos(radians(i)) * j, height/2 + sin(radians(i)) * j, 1, 1);
    }
  }
}
