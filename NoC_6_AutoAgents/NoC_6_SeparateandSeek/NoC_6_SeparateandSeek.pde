ArrayList<Boid> boids;
//Path path;
int n;

void setup() {

  size(640, 640);
  n = 30;
  boids = new ArrayList<Boid>();

  for (int i = 0; i < n; i++) {
    boids.add(new Boid(0.5 * width, 0.5 * height));
  }


  //path = new Path();
  //path.addPoint(0, height/2);
  //path.addPoint(200, 200);
  //path.addPoint(400, 450);
  //path.addPoint(width, 200);
}


void draw() {
  background(255);

  //path.update();
  //path.display();

  for (int i = 0; i < n; i++) {

    boids.get(i).applyBehaviours(boids);
    boids.get(i).update();
    boids.get(i).checkEdges();
    boids.get(i).display();
  }
}
