class Chain {

  ArrayList<Particle> chain;
  float len, strength;
  int numRows, numCols;


  Chain() {

    chain = new ArrayList<Particle>();
    len = 10;
    numRows = 20;
    numCols = 10;
    strength = 0.01;

    for (int i = 0; i < numRows; i++) {
      for (int j = 0; j < numCols; j++) {
        Vec2D pos = new Vec2D(width/4 + j * len, 20 + i * len);
        Particle particle = new Particle(pos);

        chain.add(particle);
        physics.addParticle(particle);

        //create springs between particles
        if (j > 0) {

          Particle previous = chain.get(chain.size()-2);
          VerletSpring2D spring = new VerletSpring2D(particle, previous, len, strength);
          physics.addSpring(spring);
        }
        if (i > 0) {

          Particle above = chain.get(chain.size()-numCols-1);
          VerletSpring2D spring2 = new VerletSpring2D(particle, above, len, strength);
          physics.addSpring(spring2);
        }
      }
    }
    Particle topleft= chain.get(0);
    topleft.lock();

    Particle topright = chain.get(numCols-1);
    topright.lock();
    //fix first particle in place
  }


  void display() {
    for (Particle c : chain) {
      ellipse(c.x, c.y, 5, 5);
    }


    //Particle last = chain.get(numRows - 1);
    //ellipse(last.x, last.y, 50, 50);
  }
}
