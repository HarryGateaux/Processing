//global variables
int n = 5;
Mover[] movers = new Mover[n];
Attractor a;

void setup() {
  size(640, 640);
  for (int i = 0; i < n; i++) {
    movers[i] = new Mover();
  }
  a = new Attractor();
}



void draw() {
  background(255);

  a.display();
  for (int i = 0; i < n; i++) {
    movers[i].applyForce(a.attract(movers[i]));
    movers[i].update();
    movers[i].display();
  }
}
