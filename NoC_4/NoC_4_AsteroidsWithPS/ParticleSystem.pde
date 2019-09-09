import java.util.Iterator;

class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector origin_) {
    origin = origin_.copy();
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
  
  void update(PVector shipPos_) {
   origin = shipPos_.copy(); 
    
    
  }
}
