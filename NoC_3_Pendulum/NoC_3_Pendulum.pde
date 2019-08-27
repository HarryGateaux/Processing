Pendulum pend1;

void setup() {
  size(640, 320);
  pend1 = new Pendulum(new PVector(300, 100), 150 );
}

void draw() {
  background(255);

  pend1.update();
  pend1.display();
  
}
