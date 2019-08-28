class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float aVel;
  float angle;
  float lifespan;
 
  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.copy();
    angle = 0;
    aVel = 0;
    lifespan = 255.0;
  }
 
  void run() {
    update();
    display();
  }
 
  void update() {
    angle += 2;
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }
 
  void display() {
    fill(100, 100, 255, lifespan);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
    rectMode(CENTER);
    rect(0,0,8,8);
    popMatrix();
  }
  
   
  void applyForce(PVector f) {
    acceleration.add(f);
  }
 
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
