Boid boid;
Path path;
int n;

void setup() {

  size(640, 640);
  n = 30;
  boid = new Boid(0.25 * width, 0.25 * height);
  path = new Path();
}


void draw() {
  background(255);

  path.display();

  boid.follow(path);
  boid.update();
  boid.checkEdges();
  boid.display();

}
