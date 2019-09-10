int n = 5;
Mover[] movers= new Mover[n];
Liquid liquid;

void setup() {
  size(640, 640);
  liquid = new Liquid(0, height/2, width, height);
  for (int i = 0; i < n; i++) {
    movers[i] = new Mover(random(0.1, 2), 0, 0);
  }
}



void draw() {
  background(255);

  liquid.display();

  for (int i = 0; i < n; i++) {

    //gravity needs to be scaled by mass
    PVector gravity = new PVector(0, 0.1 * movers[i].mass);


    movers[i].applyForce(gravity);

    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);
    }

    //PVector wind = new PVector(1,0.0);
    //movers[i].applyForce(wind);  

    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
}
