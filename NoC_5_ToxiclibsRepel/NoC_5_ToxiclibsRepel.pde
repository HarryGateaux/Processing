import peasy.*;

import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.geom.*;

VerletPhysics3D physics;
VerletSpring3D spring;
PeasyCam cam;
ArrayList<Particle> particles;
int n;


void setup() {
  size(1024, 768, P3D);
  stroke(255, 100);
  noFill();
  cam = new PeasyCam(this, 100);


  //Creating a toxiclibs Verlet physics world
  physics = new VerletPhysics3D();
  //physics.setWorldBounds(new AABB(new Vec3D(),new Vec3D(640,640,640)));
  ParticleConstraint3D sphere=new SphereConstraint(new Sphere(new Vec3D(), 400), SphereConstraint.INSIDE );
  //physics.addBehavior(new GravityBehavior3D(new Vec3D(0, 0.1, 0.0)));
  particles = new ArrayList<Particle>();
  n = 200;

  for (int i = 0; i < n; i++) {

    particles.add(new Particle(new Vec3D(0, 0, 0)));
    particles.get(i).addConstraint(sphere);
  }
}

void draw() {

  background(50);

  sphere(500);

  for (Particle p : particles) {

    p.applyConstraints();
    p.display();
  }
  physics.update();
}
