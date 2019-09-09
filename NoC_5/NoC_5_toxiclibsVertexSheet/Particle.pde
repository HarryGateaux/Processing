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

}
