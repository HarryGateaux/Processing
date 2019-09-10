class Mover {

  PVector location;
  PVector velocity;
  PVector accel;
  float size;

  Mover() {
    location = new PVector(random(0, width), random(0, height));
    velocity = new PVector(0, 0);
    accel = new PVector(0, 0);
    size = random(5, 30);
  }

  void display() {
    ellipse(location.x, location.y, size, size);
  }

  void update() {
    location.add(velocity);
  }

  void applyForce(PVector force_) {
    velocity.add(force_);
  }
}
