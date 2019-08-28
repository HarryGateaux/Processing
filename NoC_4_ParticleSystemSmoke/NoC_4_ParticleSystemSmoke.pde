import java.util.Iterator;
ParticleSystem ps;
ArrayList<ParticleSystem> systems;
ArrayList<Repeller> repellers;
PImage img;

void setup() {
  size(640, 360, P2D); //could use rendered P2D and blendMode(ADD) 
  noStroke();
  img = loadImage("texture.png");
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  systems = new ArrayList<ParticleSystem>();
  repellers = new ArrayList<Repeller>();
  
  for (int i = 0; i < 5; i++) {
    repellers.add(new Repeller(new PVector(random(0, width), random(0, height))));
  }
}

void draw() {
  blendMode(ADD);
  background(0);
  for (Repeller r : repellers) {
    r.display();
  }

  PVector gravity = new PVector(0, 0.1);
  for (ParticleSystem ps : systems) {
    for (Repeller r : repellers) {
      ps.applyRepeller(r);
    }
    ps.applyForce(gravity);
    ps.run();
  }
}
void mousePressed() {
  systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
