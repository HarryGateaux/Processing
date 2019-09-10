import peasy.*;

import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.geom.*;

VerletPhysics3D physics;
VerletSpring3D spring;
PeasyCam cam;

Chain chain;

void setup() {
  size(1024, 768, P3D);
  strokeWeight(4);
  stroke(255);

  cam = new PeasyCam(this, 100);
  //Creating a toxiclibs Verlet physics world
  physics = new VerletPhysics3D();
  physics.setWorldBounds(new AABB(new Vec3D(), (new Vec3D(1024, 768, 200))));
  physics.addBehavior(new GravityBehavior3D(new Vec3D(0, 0.1, 0.0)));
  chain = new Chain();
}

void draw() {
  background(50);
  noFill();
  box(600);

  //This is the same as Box2D’s “step()” function
  physics.update();

  //line(p1.x, p1.y, p2.x, p2.y);
  chain.display();
}
