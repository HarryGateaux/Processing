class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;
  int pop, maxPop;

  ParticleSystem(PVector origin_) {
    origin = origin_;
    particles = new ArrayList<Particle>();
    pop = 0;
    maxPop = 200;
  }

  void run() {
    if (pop <= maxPop) {
    addParticle();}
    display();
  }

  void addParticle() {
    particles.add(new Particle(origin));
    pop += 1;
    
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


  boolean isOver() {
    if (pop > maxPop) {
      return true;
    } else {
      return false;
    }
  }

}
