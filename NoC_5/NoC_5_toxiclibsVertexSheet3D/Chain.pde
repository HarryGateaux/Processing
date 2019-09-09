class Chain {

  ArrayList<Particle> chain;
  float len, angle, strength, radius;
  int numRows, numCols;
  int test = 1;


  Chain() {

    chain = new ArrayList<Particle>();
    len = 10;
    numRows = 20;
    numCols = 30;
    strength = 0.001;
    radius = 200;

    for (int i = 0; i < numRows; i++) {
      angle = 0;
      for (int j = 0; j < numCols; j++) {
        Vec3D pos = new Vec3D(radius * sin(angle), i * len, radius * cos(angle));
        angle += TWO_PI / 30.0;
        //print(angle + " " );
        Particle particle = new Particle(pos);

        chain.add(particle);
        physics.addParticle(particle);

        //create springs between particles
        if (j > 0) {

          Particle previous = chain.get(chain.size()-2);
          VerletSpring3D spring = new VerletSpring3D(particle, previous, len, strength);
          physics.addSpring(spring);
        }

        if (j == numCols - 1 ) {
          //connecting the last to first particle in each circle layer
          Particle firstInRow = chain.get(chain.size()-numCols);
          VerletSpring3D spring = new VerletSpring3D(particle, firstInRow, len, strength);
          physics.addSpring(spring);
        }
        if (i > 0) {

          Particle above = chain.get(chain.size()-numCols-1);
          VerletSpring3D spring2 = new VerletSpring3D(particle, above, len, strength);
          physics.addSpring(spring2);
        }

        if (i == 0) {
          particle.lock();
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
    for (Particle p : chain) {

      p.display();
    }
  }
}
