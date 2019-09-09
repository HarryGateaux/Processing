class Boid {

  float r, maxspeed, maxforce, wander_theta;
  PVector pos, vel, acc, desired, steer, circle_centre;

  Boid (float x, float y) {

    r = 5.0;
    acc = new PVector(0, 0);
    vel = new PVector(5, 5);
    pos = new PVector(x, y);
    maxspeed = 2;
    maxforce = 0.1;
    wander_theta = 0;
    circle_centre = new PVector();
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

  void wander() {
    
    float wander_radius = 20;
    float wander_distance = 50;
    circle_centre = vel.copy().normalize().setMag(wander_distance); //scale the velocity to be wander distance away
    circle_centre.add(pos); //get the wander circle centre adding the latest position
    float change = 1;
    wander_theta += random(-change, change);
    float h = vel.heading();  
    PVector random_step = new PVector(wander_radius * cos(wander_theta + h), wander_radius * sin(wander_theta + h));
    PVector random_target = PVector.add(circle_centre, random_step);

    draw_Wander(circle_centre, wander_radius, random_target);
    desired = PVector.sub(random_target, pos);
    //float d = desired.mag(); //magnitude of the desired vector
    desired.normalize();

    //if within 200 scale down the desired vel by the inverse proximity
    //if ( d < 200) {
    //  float m = map(d, 0, 200, 0, maxspeed);
    //  desired.mult(m);
    //} else {
    //  desired.mult(maxspeed);
    //}



    steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void draw_Wander(PVector centre, float r, PVector target) {
    ellipse(centre.x, centre.y, r * 2, r * 2);
    line(pos.x, pos.y, centre.x, centre.y);
    line(centre.x, centre.y, target.x, target.y);
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
