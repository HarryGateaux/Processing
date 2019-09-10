ArrayList<Boid> boids;
Path path;
int n;

void setup() {

  size(640, 640);
  n = 10;
  boids = new ArrayList<Boid>();

  for (int i = 0; i < n; i++) {
    boids.add(new Boid(0.5 * width, 0.5 * height));
  }


  path = new Path();
  path.addPoint(100, height/2);
  path.addPoint(500, height/2);
  path.addPoint(450, 0.75 * height);
  path.addPoint(300, 0.85 * height);
  path.addPoint(100, height/2);
}


void draw() {
  background(255);

  path.display();

  for (int i = 0; i < n; i++) {
      
    boids.get(i).follow(path);
    boids.get(i).separate(boids);
    boids.get(i).update();
    //boids.get(i).checkEdges();
    boids.get(i).display();
  }
}
