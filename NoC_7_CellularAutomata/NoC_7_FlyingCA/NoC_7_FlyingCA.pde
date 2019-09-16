ArrayList<Boid> boids;
//Path path;
int n;

void setup() {

  size(640, 640);
  n = 10;
  boids = new ArrayList<Boid>();

  for (int i = 0; i < n; i++) {
    boids.add(new Boid());
  }
}


void draw() {
  background(255);

  //path.update();
  //path.display();

  for (int i = 0; i < n; i++) {

    boids.get(i).separate(boids);
    boids.get(i).update();
    boids.get(i).checkEdges();
    boids.get(i).display();
  }
}
