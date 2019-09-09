class Boid {

  float r, maxspeed, maxforce;
  PVector pos, vel, acc, desired, steer;

  Boid (float x, float y) {

    r = 5.0;
    acc = new PVector(0, 0);
    vel = PVector.random2D();
    pos = new PVector(x, y);
    maxspeed = 2;
    maxforce = 0.1;
  }

  void update() {

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
    desired.normalize();
    desired.mult(maxspeed);
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

  void follow(Path p) {

    PVector predict = vel.copy();
    predict.normalize();
    predict.mult(25);
    //predicted position
    predict.add(pos);

    PVector a = p.pathStart;
    PVector b = p.pathEnd;
    PVector normalPoint = getNormalPoint(predict, a, b);

    PVector dir = PVector.sub(b, a);
    dir.normalize();
    dir.mult(10);
    PVector target = PVector.add(normalPoint, dir);

    float distance = PVector.dist(normalPoint, predict);
    print(distance);
    if (distance > path.radius) {

      seek(target, new PVector(0, 0));
    }
  }  
  PVector getNormalPoint(PVector pred, PVector a, PVector b) {
    
    PVector ab = PVector.sub(b, a);
    PVector ap = PVector.sub(pred, a);
    
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    
    return normalPoint;   
    
    
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
