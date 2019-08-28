class Circular extends Particle {

  Circular(PVector l) {
    super(l);
    mass = 5;

  }

  void display() {
    fill(100, 255, 100, lifespan);
    pushMatrix();
    translate(location.x, location.y);
    imageMode(CENTER);
    tint(100, 255, 100,lifespan);
    image(img,0,0);
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
    imageMode(CENTER);
    tint(255, 100, 100,lifespan);
    image(img,0,0);
    popMatrix();
  }
}
