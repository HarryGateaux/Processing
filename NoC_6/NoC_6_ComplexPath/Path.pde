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

  //void update() {
    
  // for(PVector p : points){
  //   PVector random = new PVector(random(-5, 5), random(-5, 5));
  //   p.add(random);
     
  // }
    
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
