class Ball {
  PVector loc;
  PVector vel;
  PVector acc;
  float mass = 20;
  float aVel;
  float angle;

  Ball() {
    loc = new PVector(0, height/2);
    vel = new PVector(12, -7);
    acc = new PVector(0, 0);
    aVel = 0;
    angle = 0;
  }

  void update() {

    loc.add(vel); 
    vel.add(acc);
    aVel = vel.x;
    angle += aVel;
  }

  void display() {

    //ellipse(loc.x, loc.y, mass, mass);
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(angle));
    rectMode(CENTER);
    rect(0, 0, mass, mass);  //in order to show rotation
    popMatrix();
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acc.add(f);
  }
}
