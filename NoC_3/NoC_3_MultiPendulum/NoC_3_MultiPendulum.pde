Pendulum pend1, pend2;

void setup() {
  size(640, 320);
  pend1 = new Pendulum(new PVector(300, 100), 150, 90);
  pend2 = new Pendulum(new PVector(500, 300), 100, 45);
 
}

void draw() {
  background(255);

  pend1.update();
  pend1.display(false);

  pend2.update();
  pend2.display(true);
}
