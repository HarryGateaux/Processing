Spaceship ss;

void setup() {

  size(640, 640);
  ss = new Spaceship();
}

void draw() {
  background(255);
  ss.update();
  ss.display();
}
