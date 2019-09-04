Prey prey;
Predator predator;
int n;

void setup() {

  size(640, 640);
  n = 30;
  prey = new Prey(0.25 * width, 0.25 * height);
  predator = new Predator(0.75 * width, 0.75 * height);
}


void draw() {
  background(255);

  prey.update();
  prey.checkEdges();
  prey.display();

  predator.seek(prey.pos, prey.vel);
  predator.update();
  predator.checkEdges();
  predator.display();
}
