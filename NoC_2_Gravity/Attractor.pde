class Attractor {

  PVector location;
  float size;
  float G;

  Attractor() {
    location = new PVector(width/2, height/2);
    size = 50;
    G = 0.005;
  }

  void display() {
    fill(150);
    ellipse(location.x, location.y, size, size);
  }

  PVector attract(Mover mover) {
    //vector from mover to attractor
    PVector f = PVector.sub(location,mover.location);
    f.normalize();
    float distance = f.mag();
    distance = constrain(distance, 5.0, 25.0);
    //calculation gravitation formula
    float m = (G * size * mover.size) / (distance * distance);
    f.mult(m);
    
    return f;
  }
}
