class Spaceship {

  PVector pos, vel, acc;
  float len = 50, angle = 0, aVel;

  Spaceship() {

    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(angle));
    rectMode(CENTER);
    rect(0, 0, len/2, len);
    popMatrix();
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
        print(angle);
        print(vel);
      }
    }
  }
}
