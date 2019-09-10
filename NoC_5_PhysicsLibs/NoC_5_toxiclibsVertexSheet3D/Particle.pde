class Particle extends VerletParticle3D {
  boolean dragged;
  Vec3D offset = new Vec3D();

  Particle(Vec3D loc) {
    //Calling super() so that the object is initialized properly
    super(loc);
  }

  //We want this to be just like a VerletParticle, only with a display() method.
  void display() {
    //We’ve inherited x and y from VerletParticle!
    point(x, y, z);
  }
}
