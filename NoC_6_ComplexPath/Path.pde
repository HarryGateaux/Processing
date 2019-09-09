class Path {

  ArrayList<PVector> points;
  PVector pathStart, pathEnd;
  float radius;

  Path() {

    pathStart = new PVector(0, height/2);
    pathEnd = new PVector(width, 0.8*height);
    points = new ArrayList<PVector>();
    radius = 20;
  }

  void addPoint(float x, float y) {

    points.add(new PVector(x, y));
  }

  void display() {


    stroke(0);
    noFill();
    beginShape();

    for (PVector p : points) {

      vertex(p.x, p.y);
    }

    endShape();
  }
}
