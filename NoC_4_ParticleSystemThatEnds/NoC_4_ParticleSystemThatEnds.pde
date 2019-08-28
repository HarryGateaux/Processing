import java.util.Iterator;
ParticleSystem ps;
ArrayList<ParticleSystem> systems;
Iterator<ParticleSystem> it2;

void setup() {
  size(640, 360);
  ps = new ParticleSystem(new PVector(mouseX, mouseY));
  systems = new ArrayList<ParticleSystem>();
  it2 = systems.iterator();
}

void draw() {
  background(255);

for (ParticleSystem ps : systems){
      ps.run();
}

    
    }
  void mousePressed() {
    systems.add(new ParticleSystem(new PVector(mouseX, mouseY)));
}
  }
