class Mover {

  PVector location;
  PVector velocity;
  PVector accel;
  float size;
  float G;

  Mover() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = random(5, 30);
    G = 0.005;
  }

  void display() {
    fill(150, 100);
    ellipse(location.x, location.y, size, size);
  }

  void update() {
    location.add(velocity);
  }

  void applyForce(PVector force_) {
    velocity.add(force_);
  }

  PVector attract(Mover m) {

    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    force.normalize();

    float strength = (G * size * m.size) / (distance * distance);
    force.mult(strength);
    return force;
  }
}
