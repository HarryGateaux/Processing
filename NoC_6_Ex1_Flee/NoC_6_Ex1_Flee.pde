Boid[] boids;
int n;

void setup() {

  size(640, 640);
  n = 30;
  boids = new Boid[n];
  for (int i = 0; i < n; i++) {
    boids[i] = new Boid(width/2, height/2);
  }
}


void draw() {
  background(255);
  for (int i = 0; i < boids.length; i++) {
    for (int j = 0; j < boids.length; j++) {
      boids[i].flee(boids[j].pos);
    }
    boids[i].update();
    boids[i].checkEdges();
    boids[i].display();
  }
}
