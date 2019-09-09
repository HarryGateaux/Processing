FlowField ff;
Boid boid;

void setup(){
  
  size(640, 640);
  boid = new Boid(random(0, width), random(0, height));
  ff = new FlowField();
}

void draw(){
  
  background(255);
  ff.display();
  boid.follow(ff);
  boid.update();
  boid.checkEdges();
  boid.display();
}
