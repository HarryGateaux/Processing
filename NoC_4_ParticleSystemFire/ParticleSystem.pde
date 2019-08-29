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
      addParticle();
    }
    display();
  }

  void addParticle() {
    float r = random(1);
    if (r < 0.33) {
      particles.add(new pRed(origin));
    } else if (r < 0.66) {
      particles.add(new pYel(origin));
    } else {
      particles.add(new pOra(origin));
    }
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

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void applyRepeller(Repeller r) {
    for (Particle p : particles) {
      PVector force = r.repel(p);
      p.applyForce(force);
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
