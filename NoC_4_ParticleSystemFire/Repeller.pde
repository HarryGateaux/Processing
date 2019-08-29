class Repeller {
  float strength;
  PVector location;
  float r;

  Repeller(PVector l) {
    location = l.copy();
    r = 10;
    strength = 100;
  }

  void display() {
    fill(0, 100);
    ellipse(location.x, location.y, r*2, r*2);
  }
  
  PVector repel(Particle p) {
    
    PVector dir = PVector.sub(location, p.location);
    float d = dir.mag();
    dir.normalize();
    float force = -1 * strength / (d * d);
    dir.mult(force);
    return dir;
    
  }
}
