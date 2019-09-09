import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;
VerletPhysics2D physics;
VerletSpring2D spring;
Chain chain;

void setup() {
  size(640, 360);

  //Creating a toxiclibs Verlet physics world
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.1)));
  chain = new Chain();
  
}

void draw() {
  background(255);

  //This is the same as Box2D’s “step()” function
  physics.update();

  //line(p1.x, p1.y, p2.x, p2.y);
  chain.display();
}
