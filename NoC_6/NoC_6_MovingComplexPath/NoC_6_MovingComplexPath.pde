Boid boid;
Path path;
int n;

void setup() {

  size(640, 640);
  n = 30;
  boid = new Boid(0.25 * width, 0.25 * height);
  path = new Path();
  path.addPoint(0, height/2);
  path.addPoint(200, 200);
  path.addPoint(400, 450);
  path.addPoint(width, 200);
}


void draw() {
  background(255);

  path.update();
  path.display();

  boid.follow(path);
  boid.update();
  boid.checkEdges();
  boid.display();

}
