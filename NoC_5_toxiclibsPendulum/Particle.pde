class Particle extends VerletParticle2D {
  boolean dragged;
  Vec2D offset = new Vec2D();
  
  Particle(Vec2D loc) {
    //Calling super() so that the object is initialized properly
    super(loc);
  }

  //We want this to be just like a VerletParticle, only with a display() method.
  void display() {
    fill(175);
    stroke(0);
    //We’ve inherited x and y from VerletParticle!
    point(x, y);
  }

  void contains(int x_, int y_) {

    float d = dist(x_, y_, x, y);
    if (d < 50) {
      offset.x = x - x_;
      offset.y = y - y_;
      lock();
      dragged = true;
    }
  }

  // Release the ball
  void release() {
    unlock();
    dragged = false;
  }

  // Update tail position if being dragged
  void update(int x, int y) {
    if (dragged) {
      this.set(x+offset.x, y+offset.y);
    }
  }
}
