import java.util.Iterator;
ParticleSystem ps;
ArrayList<ParticleSystem> systems;
Repeller repeller;

void setup() {
  size(640, 360);
  noStroke();
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  systems = new ArrayList<ParticleSystem>();
  repeller = new Repeller(new PVector(200, 200));
}

void draw() {
  background(255);
  repeller.display();
      
  PVector gravity = new PVector(0, 0.1);
  for (ParticleSystem ps : systems) {
    ps.applyRepeller(repeller);
    ps.applyForce(gravity);
    ps.run();
  }

}
void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
