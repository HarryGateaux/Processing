class Particle extends VerletParticle3D {
  float r;

  Particle(Vec3D v) {
    super(v);
    r = 4;
    physics.addBehavior(new AttractionBehavior3D(this, r*4, -10));
  }

  void display() {

    addVelocity(Vec3D.randomVector());
    applyForce();
    pushMatrix();
    translate(x, y, z);
    sphere(10);
    popMatrix();
  }
}
