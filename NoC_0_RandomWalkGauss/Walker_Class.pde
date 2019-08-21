import java.util.Random;

class Walker {

  float x;
  float y;
  Random generatorX;
  Random generatorY;

  //constructor
  Walker() {
    x = width/2;
    y = height/2;
    generatorX = new Random();
    generatorY = new Random();
  }

  //methods
  void display() {
    stroke(0);
    point(x, y);
  }

  // take step in random direction
  void step() {
    float stepX = (float) generatorX.nextGaussian();
    float stepY = (float) generatorY.nextGaussian();
    print(stepX + "  " + stepY + ",,," );
    x += stepX;
    y += stepY;
  }
}
