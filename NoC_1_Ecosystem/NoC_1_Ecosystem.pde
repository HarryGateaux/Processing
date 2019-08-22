Snake[] movers = new Snake[1];


void setup() {
  size(640, 320);

  for (int i=0; i<1; i++) {
    movers[i] = new Snake();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < movers.length; i++) {

    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
    print(movers[i].tail);
  }
}
