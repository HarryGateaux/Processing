class Boid {

  float r, maxspeed, maxforce;
  PVector pos, vel, acc, desired, steer;
  int state;

  Boid () {

    r = 5.0;
    acc = new PVector(0, 0);
    vel = PVector.random2D();
    pos = new PVector(random(0, width), random(0, height));
    maxspeed = 2;
    maxforce = 0.1;
    state = (random(100) < 10) ? 1 : 0;
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

  void separate(ArrayList<Boid> boids) {

    PVector sum = new PVector();
    float desiredSeparation = 20;
    int count = 0;
    int state_count = 0;

    for (Boid other : boids) {

      float distance = PVector.dist(other.pos, pos); 

      if (distance >  0 && distance < desiredSeparation) {
        PVector dir = PVector.sub(pos, other.pos);
        dir.normalize();
        sum.add(dir);
        count++;
        state_count += other.state;
      }

      if (count > 0) {
        sum.div(count);
        sum.normalize();
        sum.mult(maxspeed);
        PVector steer = PVector.sub(sum, vel);
        steer.limit(maxforce);
        applyForce(steer);
      }
      
      //if more than one boid in proximity, and at least one is infected then infect
      if (count > 1 && state_count > 0) {
        state = 1;
        
      }
    }
  }

  //  void seek(PVector target_pos, PVector target_vel) {
  //    PVector predict_pos = PVector.add(target_pos, target_vel);
  //    desired = PVector.sub(predict_pos, pos);
  //    desired.normalize();
  //    desired.mult(maxspeed);
  //    steer = PVector.sub(desired, vel);
  //    steer.limit(maxforce);
  //    applyForce(steer);
  //  }

  void display() {
    float theta = vel.heading() + PI/2;
    fill(255 * state, 255 - 255 * state, 0);
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

  //void follow(Path p) {

  //  PVector predict = vel.copy();
  //  predict.normalize();
  //  predict.mult(25);
  //  //predicted position
  //  predict.add(pos);

  //  float worldRecord = 10000;
  //  PVector target = null;

  //  for (int i = 0; i < p.points.size() - 1; i++) {

  //    PVector a = p.points.get(i);
  //    PVector b = p.points.get(i + 1);
  //    PVector normalPoint = getNormalPoint(predict, a, b);

  //    //check if normalPoint is within line segment, if not set to end point
  //    //without using min/max forces the path direction to be to the right
  //    if (normalPoint.x < min(a.x, b.x) || normalPoint.x > max(a.x, b.x)) {

  //      normalPoint = b.copy();
  //    }

  //    float distance = PVector.dist(predict, normalPoint);

  //    if (distance < worldRecord) {
  //      worldRecord = distance;

  //      //PVector dir = PVector.sub(b, a);
  //      //dir.normalize();
  //      //// This is an oversimplification
  //      //// Should be based on distance to path & velocity
  //      //dir.mult(10);
  //      target = normalPoint.copy();
  //      //target.add(dir);
  //    }
  //  }

  //  if (worldRecord > path.radius) {

  //    seek(target, new PVector(0, 0));
  //  }
  //}  


  //PVector getNormalPoint(PVector pred, PVector a, PVector b) {

  //  PVector ab = PVector.sub(b, a);
  //  PVector ap = PVector.sub(pred, a);

  //  ab.normalize();
  //  ab.mult(ap.dot(ab));
  //  PVector normalPoint = PVector.add(a, ab);

  //  return normalPoint;
  //}




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
