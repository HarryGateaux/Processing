class Jumper {

  PVector loc;
  PVector vel;
  PVector accel;
  float topspeed;
  float xoff;
  float yoff;
  PVector tempVel;

  Jumper() {
    loc = new PVector(random(width), random(height));
    vel = new PVector(random(-15, 15), random(-15, 15));
    accel = new PVector(0, 0);
    topspeed = 30;
    xoff = random(0, 3000);
    yoff = random(3500, 8000);
  }

  void update() {

    //Have to create a copy here, if you directly put loc into the arraylist it's a direct reference to the latest version of the object
    accel.x = map(noise(xoff), 0, 1, -1, 1);
    accel.y = map(noise(yoff), 0, 1, -1, 1);
    vel.add(accel);
    xoff += 0.01;
    yoff += 0.01;

    vel.limit(topspeed);
    if (frameCount % 50 == 0) {
      loc.add(vel);
    }
  }

  void display() {
    tempVel = new PVector(vel.x, vel.y);
    strokeWeight(8);
    ellipse(loc.x + 10*tempVel.normalize().x, loc.y + 10*tempVel.normalize().y, 10, 10);
    line(loc.x - 10*tempVel.normalize().x, loc.y - 10*tempVel.normalize().y, loc.x + 10*tempVel.normalize().x, loc.y + 10*tempVel.normalize().y);
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
