class Sphere {

  PVector pos;
  PVector vel;
  int diameter;


  Sphere() {

    pos = new PVector(random(0, width), random(0, height), (random(0, -400)));
    vel =  new PVector(random(-3, 3), random(-3, 3), random(-3, 3));
    diameter = 20;
  }

  void show() {
    translate(pos.x, pos.y, pos.z);
    sphere(diameter);
  }

  void checkEdges() {

    if (pos.x < 0 || pos.x > width) {
      vel.x *= -1;
    }
    if (pos.y < 0 || pos.y > height) {
      vel.y *= -1;
    }
    if (pos.z < 0 || pos.z > -height) {
      vel.z *= -1;
    }
  }

  void update() {

    pos.add(vel);
  }
}
