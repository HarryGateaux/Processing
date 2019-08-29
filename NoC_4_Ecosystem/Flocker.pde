class Flocker extends Creature {

  float maxSteer;
  PVector steer;

  Flocker() {
    super();
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(-5, 5), random(-5, 5));
    accel = new PVector(0, 0);
    topspeed = 3;
    xoff = random(0, 3000);
    yoff = random(3500, 8000);
    maxSteer = 1000000;
    steer = new PVector(0, 0);
  }

 void update() {
    //Have to create a copy here, if you directly put loc into the arraylist it's a direct reference to the latest version of the object
    change();
    vel.limit(topspeed);
    loc.add(vel);
  }

  void change() {
    vel.add(accel);
  }
  
  void display() {
    rectMode(CENTER);
    strokeWeight(1);
    rect(loc.x, loc.y, 10, 10);
  }

  void separation() {
    steer = new PVector(0, 0);
    //loop through each other flocker and determine separation vector based on proximity
    int count = 0;
    for (Flocker other : flockers) {
      float distance = loc.dist(other.loc);
      if ( distance > 0  && distance < 50) {
        //calc vector mapping other to this flocker
        PVector diff = PVector.sub(loc, other.loc);
        //weight more strongly if closer
        diff.normalize();     
        diff.div(distance);
        // i.e. we are steering the flocker in the direction away from other
        steer.add(diff);
        count += 1;
      }
    }
    //if there is a close other
    if (count>0) {
      accel = steer.div(count);
    }
    print(steer);
    //scale the steer force to topspeed
    //steer.limit(maxSteer);
    accel.setMag(topspeed);
    vel.add(accel);
  }


  void cohesion() {
    steer = new PVector(0, 0);
    //loop through each other flocker and determine cohesion vector based on proximity
    int count = 0;
    for (Flocker other : flockers) {
      float distance = loc.dist(other.loc);
      if ( distance > 0  && distance < 50) {
        //calc average position
        PVector average = PVector.add(loc, other.loc);
        average.div(2);
        //calc vector pointing to average position between this and other
        PVector seek =  PVector.sub(average, loc);
        seek.normalize(); 
        seek.div(1);
        //seek.normalize();
        steer.add(seek);
        count += 1;
      }
    }
    //if there is a close other
    if (count > 0) {
      steer = steer.div(count);
    }
    //steer.limit(maxSteer);
    accel.add(steer);
    //steer.limit(maxSteer);
    print(steer);
    vel.add(accel);
  }

}
