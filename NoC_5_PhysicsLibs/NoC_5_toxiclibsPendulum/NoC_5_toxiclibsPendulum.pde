import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;
VerletPhysics2D physics;
Particle p1, p2, last;
VerletSpring2D spring;
ArrayList<Particle> particles;
float len;
int numParticles;

void setup() {
  size(640, 360);

  //Creating a toxiclibs Verlet physics world
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.1)));

  particles = new ArrayList<Particle>();
  len = 10;
  numParticles = 20;
  float strength = 0.01;

  for (int i = 0; i < numParticles; i++) {
    Vec2D pos = new Vec2D(width/2, 20 + i * len);
    Particle particle = new Particle(pos);
    particles.add(particle);
    physics.addParticle(particle);

    //create springs between particles
    if (i != 0) {

      Particle previous = particles.get(i-1);
      VerletSpring2D spring = new VerletSpring2D(particle, previous, len, strength);
      physics.addSpring(spring);
    }
  }

  //fix first particle in place
  particles.get(0).lock();
}

void draw() {
  background(255);
  last = particles.get(numParticles - 1);
  ellipse(last.x, last.y, 50, 50);
  //This is the same as Box2D’s “step()” function
  physics.update();

  //line(p1.x, p1.y, p2.x, p2.y);
  for (Particle p : particles) {
    p.display();
  }
  last.update(mouseX, mouseY);
}

void mousePressed() {
  // Check to see if we're grabbing the chain
  last.contains(mouseX, mouseY);
}

void mouseReleased() {
  // Release the chain
  last.release();
}
