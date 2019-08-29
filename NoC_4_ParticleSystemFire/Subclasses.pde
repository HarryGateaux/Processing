class pRed extends Particle {

  pRed(PVector l) {
    super(l);
  }

  void display() {
    tint(255, 50, 50, lifespan);
    super.display();
  }
}

class pYel extends Particle {

  pYel(PVector l) {
    super(l);
  }

  void display() {
    tint(255, 255, 50, lifespan);
    super.display();
  }
}

class pOra extends Particle {

  pOra(PVector l) {
    super(l);
  }

  void display() {
    tint(255, 165, 0, lifespan);
    super.display();
  }
}
