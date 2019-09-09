class Path {

  PVector pathStart, pathEnd;
  float radius;

  Path() {

    pathStart = new PVector(0, height/2);
    pathEnd = new PVector(width, 0.8*height);
  }

  void display() {

    radius = 20;
    stroke(0, 50);
    strokeWeight(2 * radius);
    line(pathStart.x, pathStart.y, pathEnd.x, pathEnd.y);

    strokeWeight(1);
    stroke(0);
    line(pathStart.x, pathStart.y, pathEnd.x, pathEnd.y);
  }
}
