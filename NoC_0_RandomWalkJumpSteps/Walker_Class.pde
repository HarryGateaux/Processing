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

    float stepsizeX = montecarlo();
    float stepsizeY = montecarlo();

    float stepX = random(-stepsizeX, stepsizeX);
    float stepY = random(-stepsizeY, stepsizeY);
    x += stepX;
    y += stepY;
  }
}


float montecarlo() {
  while (true) {

    float r1 = random(10);

    float prob = pow(r1, 2);

    float r2 = random(10); //squared

    //intuition : if the first number picked is a big number, it has a higher prob of being used (in this case proportion to the square).
    if (r2 < prob) {
      return r1;
    }
  }
}
