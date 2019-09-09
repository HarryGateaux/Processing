class Flocker {

  PVector loc;
  PVector vel;
  PVector accel;
  float topspeed;
  float xoff;
  float yoff;
  PVector tempVel;
  float maxSteer;

  Flocker() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(-5, 5), random(-5, 5));
    accel = new PVector(0, 0);
    topspeed = 5;
    xoff = random(0, 3000);
    yoff = random(3500, 8000);
    maxSteer = 0.05;
  }

  void update() {

    //Have to create a copy here, if you directly put loc into the arraylist it's a direct reference to the latest version of the object
    change();
    vel.limit(topspeed);
    loc.add(vel);
  }

  void change() {
    //shift.x = map(noise(xoff), 0, 1, -1, 1);
    //shift.y = map(noise(yoff), 0, 1, -1, 1);
    vel.add(accel);
    xoff += 0.01;
    yoff += 0.01;
  }

  void display() {
    rectMode(CENTER);
    //tempVel = new PVector(vel.x, vel.y);
    strokeWeight(1);
    rect(loc.x, loc.y, 10, 10);
  }

  void separation() {
    PVector steer = new PVector(0, 0);

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
    steer.limit(maxSteer);
    steer.setMag(topspeed);
  }


  void cohesion() {
    PVector steer = new PVector(0, 0);

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
        seek.div(100);
        //seek.normalize();
        steer.add(seek);
        count += 1;
      }
    }
    //if there is a close other
    if (count>0) {
      accel = steer.div(count);
    }
    //steer.limit(maxSteer);
    accel.add(steer);
    //steer.limit(maxSteer);
    print(steer);

  }

  //void cohesion() {
  //  PVector steer = new PVector(0,0);
  //  int count = 0;
  //  for(int i = 0; i < flockers.length; i++){
  //    float distance = loc.dist(flockers[i].loc);
  //    if( distance > 0  && distance < 50){
  //      accel = flockers[i].vel;
  //      //PVector diff = loc.sub(flockers[i].loc);
  //      //diff.normalize();
  //      //diff.div(distance);
  //      //steer.add(diff);
  //      //count += 1;
  //    }

  //  }
  //  //if (count>0){
  //  //shift = steer;}
  //  //print(steer);

  //}

  void checkEdges() {

    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
    } else if (loc.y < 0) {
      loc.y = height;
    }
  }
}
