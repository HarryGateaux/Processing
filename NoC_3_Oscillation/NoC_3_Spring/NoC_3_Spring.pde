int n = 1;
Bob[] bobs= new Bob[n];
Spring spring = new Spring(new PVector(50, 50));
void setup() {
  size(640, 640);
  for (int i = 0; i < n; i++) {
    bobs[i] = new Bob(5, 200, 200);
  }
}



void draw() {
  background(255);
  for (int i = 0; i < n; i++) {

    PVector gravity = new PVector(0, 0.1);
    bobs[i].applyForce(gravity);
    spring.connect(bobs[i]);


    bobs[i].checkEdges();
    bobs[i].update();
    bobs[i].display();
    spring.display(bobs[i]);
    //PVector wind = new PVector(1,0.0);
    //bobs[i].applyForce(wind);
  }
}
