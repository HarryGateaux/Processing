int n = 5;
Mover[] movers= new Mover[n];

void setup() {
  size(640, 640);
  for (int i = 0; i < n; i++) {
    movers[i] = new Mover(random(0.1, 2), 0, 0);
  }
}



void draw() {
  background(255);
  for (int i = 0; i < n; i++) {
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
    PVector gravity = new PVector(0,0.1);
    movers[i].applyForce(gravity);
    PVector rightResist = new PVector(-2,0);
    if(movers[i].location.x > width - 50){
    movers[i].applyForce(rightResist);
    };
    PVector leftResist = new PVector(2,0);
    if(movers[i].location.x < 50){
    movers[i].applyForce(leftResist);
    }
    
    //PVector wind = new PVector(1,0.0);
    //movers[i].applyForce(wind);  
    
  }
}
