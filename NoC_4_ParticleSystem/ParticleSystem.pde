class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem() {
    origin = new PVector(200, 200);
    particles = new ArrayList<Particle>();
  }


  void addParticle() {
    particles.add(new Particle(origin));
  }

  void display() {

    Iterator<Particle> it = particles.iterator();

    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
  
  void update() {
   origin = new PVector(mouseX, mouseY); 
    
    
  }
}
