Snake[] movers = new Snake[5];
Jumper[] jumpers = new Jumper[5];
Flocker[] flockers = new Flocker[20];

void setup() {
  size(640, 640);

  for (int i=0; i<5; i++) {
    movers[i] = new Snake();
    jumpers[i] = new Jumper();

  }
  
  for (int i=0; i<20; i++) {
    flockers[i] = new Flocker();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < movers.length; i++) {

    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();

    jumpers[i].update();
    jumpers[i].checkEdges();
    jumpers[i].display();
  }
  for (int i = 0; i < flockers.length; i++) {


    flockers[i].update();
    flockers[i].checkEdges();
    flockers[i].display();
    flockers[i].separation();
    flockers[i].cohesion();
  }
}
