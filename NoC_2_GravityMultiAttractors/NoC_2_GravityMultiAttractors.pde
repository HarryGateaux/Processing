//global variables
int n = 10;
int n2 = 2;
Mover[] movers = new Mover[n];
Attractor[] attractors = new Attractor[n2];

Attractor a;

void setup() {
  size(640, 640);
  for (int i = 0; i < n; i++) {
    movers[i] = new Mover();
  }

  for (int i = 0; i < n2; i++) {
    attractors[i] = new Attractor();
  }
}



void draw() {
  background(255);



  for (int i = 0; i < n; i++) {
    
    // loop to display attractors and apply their gravitional force to this mover
    for (int j = 0; j < n2; j++) {     
      
      movers[i].applyForce(attractors[j].attract(movers[i]));
      attractors[j].display();
    }

    // loop to apply the attraction between movers
    for (int j = 0; j < movers.length; j++) {
      if (i != j){
      PVector force = movers[j].attract(movers[i]);
      movers[i].applyForce(force);
      }
    }
    movers[i].update();
    movers[i].display();
  }
}
