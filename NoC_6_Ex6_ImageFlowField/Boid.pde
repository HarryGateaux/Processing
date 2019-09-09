class Boid {

  float r, maxspeed, maxforce;
  PVector pos, vel, acc, desired, steer;

  Boid (float x, float y) {

    r = 5.0;
    acc = new PVector(0, 0);
    vel = PVector.random2D();
    pos = new PVector(x, y);
    maxspeed = 4;
    maxforce = 0.05;
  }

  void update() {

    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  void applyForce(PVector force_){
    acc.add(force_);
  }

  void follow(FlowField flow) {
    PVector desired = flow.lookup(pos);
    desired.mult(maxspeed);
 
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }


  void flee(PVector target) {
    desired = PVector.sub(target, pos);
    desired.normalize();
    desired.mult(maxspeed);
    steer = PVector.sub(desired, vel);
    steer.mult(-1);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    float theta = vel.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r * 2);
    vertex(-r, r * 2);
    vertex(r, r * 2);
    endShape(CLOSE);
    popMatrix();
  }

  void checkEdges() {
    if (pos.x < 0) {
      pos.x = width;
    }

    if (pos.x > width) {
      pos.x = 0;
    } 


    if (pos.y < 0) {
      pos.y = height;
    }

    if (pos.y > height) {
      pos.y = 0;
    }
  }
}
