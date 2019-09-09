import java.util.Iterator;
ParticleSystem ps;
ArrayList<ParticleSystem> systems;

void setup() {
  size(640, 360);
  noStroke();
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(255);
  PVector gravity = new PVector(0, 0.01);
  for (ParticleSystem ps : systems) {
    ps.applyForce(gravity);
    ps.run();
  }
}
void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
