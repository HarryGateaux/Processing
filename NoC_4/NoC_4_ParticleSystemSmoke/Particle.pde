class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float aVel;
  float angle;
  float lifespan;
  float mass;
 
  Particle(PVector l) {
    acceleration = new PVector(0,0.0);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.copy();
    angle = 0;
    aVel = 0;
    lifespan = 255.0;
    mass = 1;
  }
 
  void run() {
    update();
    display();
  }
 
  void update() {
    angle += 2;
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0); //stops acc accumulating
    lifespan -= 2.0;
  }
 
  void display() {
    fill(100, 100, 255, lifespan);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
    imageMode(CENTER);
    tint(100, 100, 255,lifespan);
    image(img,0,0);
    popMatrix();
  }
  
   
  void applyForce(PVector f_) {
    PVector f = f_.copy();
    //f.div(mass); only need this line if the force isn't gravity , say wind
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
