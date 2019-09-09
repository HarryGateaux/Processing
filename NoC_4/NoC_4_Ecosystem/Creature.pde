class Creature {

  PVector loc;
  PVector vel;
  PVector accel;
  float topspeed;
  float xoff;
  float yoff;
  PVector tempVel;

  Creature() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(-15, 15), random(-15, 15));
    accel = new PVector(0, 0);
    topspeed = 30;
    xoff = random(0, 3000);
    yoff = random(3500, 8000);
  }

  void display() {  
  }
  
  void separation() {
  };
 
  
  void cohesion() { };
  
  void update() {

    accel.x = map(noise(xoff), 0, 1, -1, 1);
    accel.y = map(noise(yoff), 0, 1, -1, 1);
    vel.add(accel);
    xoff += 0.01;
    yoff += 0.01;
    vel.limit(topspeed);
    loc.add(vel);
  }

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
