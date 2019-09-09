class Circular extends Particle {

  Circular(PVector l) {
    super(l);
    mass = 5;

  }

  void display() {
    fill(100, 255, 100, lifespan);
    pushMatrix();
    translate(location.x, location.y);
    ellipse(0, 0, 8, 8);
    popMatrix();
  }
}

class Triangular extends Particle {

  Triangular(PVector l) {
    super(l);

  }

  void display() {
    fill(255, 100, 100 , lifespan);
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
    triangle(0, -4, 4, 4, -4, 4);
    popMatrix();
  }
}
