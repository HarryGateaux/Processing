class Spaceship {

  PVector pos, vel, acc;
  float len = 50, angle = 0, aVel;
  ParticleSystem ps;

  Spaceship() {

    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    ps = new ParticleSystem(pos);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angle));
    rectMode(CENTER);
    rect(0, 0, len/2, len);
    popMatrix();
  }

  void fumes() {

    PVector shipRear = pos.copy().sub(vel.copy().normalize().mult(len/2));
    ps.addParticle();
    ps.update(shipRear);
    ps.display();
  }

  void update() {    
    aVel = 0;
    vel = new PVector(0, 0);
    keyCheck();
    angle += aVel;
    vel.add(acc);
    pos.add(vel); 


    //angle = vectorToMouse.heading();
  }

  void keyCheck() {
    if (keyPressed == true) {
      if (keyCode == LEFT) {

        aVel = -5;
      }

      if (keyCode == RIGHT) {

        aVel = 5;
      }

      if (key == 'z') {

        vel = new PVector(1 * sin(radians(-angle)), 1 * cos(radians(-angle)));
        fumes();
        fill(255);
        print(angle);
        print(vel);
      }
    }
  }
}
