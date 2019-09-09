class Boid {

  float r, maxspeed, maxforce;
  PVector pos, vel, acc, desired, steer;

  Boid (float x, float y) {

    r = 5.0;
    acc = new PVector(0, 0);
    vel = PVector.random2D();
    pos = new PVector(x, y);
    maxspeed = 4;
    maxforce = 0.1;
  }

  void update() {

    //if (inSwamp(swamp)) {
    //  maxspeed = 1;
    //} else { 
    //  maxspeed = 20;
    //};

    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }

  void applyForce(PVector force_) {

    acc.add(force_);
  }

  void seek(PVector target_pos, PVector target_vel) {
    PVector predict_pos = PVector.add(target_pos, target_vel); 
    desired = PVector.sub(predict_pos, pos);
    float d = desired.mag(); //magnitude of the desired vector
    desired.normalize();

    //if within 200 scale down the desired vel by the inverse proximity
    if ( d < 200) {
      float m = map(d, 0, 200, 0, maxspeed);
      desired.mult(m);
    } else {
      desired.mult(maxspeed);
    }



    steer = PVector.sub(desired, vel);
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


  boolean inSwamp(Swamp s) {
    if (pos.x>s.x && pos.x<s.x+s.w && pos.y>s.y && pos.y<s.y+s.h)
    {
      return true;
    } else {
      return false;
    }
  }
}
