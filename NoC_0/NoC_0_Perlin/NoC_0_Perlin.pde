float small, medium, large;
int step = 0;

void setup() {
  colorMode(RGB);
  background(255);
  size(640, 320);
  
}

void draw() {

  //perlin noise with different increments
  
  stroke(255, 0, 0);
  ellipse(step, height * noise(small), 1, 1);
  
  stroke(0, 255, 0);
  ellipse(step, height * noise(medium), 1, 1);
  
  stroke(0, 0, 255);
  ellipse(step, height * noise(large), 1, 1);
  
  
  small += 0.01;
  medium += 0.05;
  large += 0.1;
  
  step += 1;
}
