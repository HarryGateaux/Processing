class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(random(0, 5), random(0, 5));
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    //velocity.limit(4);
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, mass*16, mass*16);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }

  boolean isInside(Liquid liq) {
    if (location.x > liq.x1 && location.x < liq.x2 && location.y > liq.y1 && location.y < liq.y2) {
      return true;
    } else {
      return false;
    }
  }
  
  void drag(Liquid liq) {
   float speed = velocity.mag();
   float dragMag = speed * speed * liq.coeff;
   PVector drag = velocity.copy();  //.get() is deprecated
   drag.normalize();
   drag.mult(-dragMag);
   
   applyForce(drag);   
   
    
  }
}
