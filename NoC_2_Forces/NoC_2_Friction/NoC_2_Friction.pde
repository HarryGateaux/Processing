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
    //float edgeForceScale = 0.0002;
  
    //gravity needs to be scaled by mass
    PVector gravity = new PVector(0,0.1 * movers[i].mass);
    movers[i].applyForce(gravity);
    
    float c = 0.0001;
    PVector friction = movers[i].velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
 
    movers[i].applyForce(friction);
    //PVector rightResist = new PVector(-movers[i].location.x * edgeForceScale,0);
    //PVector leftResist = new PVector((width - movers[i].location.x) * edgeForceScale,0);
        
    //movers[i].applyForce(rightResist);
    //movers[i].applyForce(leftResist);
    
    //PVector wind = new PVector(1,0.0);
    //movers[i].applyForce(wind);  
    
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();}
}
