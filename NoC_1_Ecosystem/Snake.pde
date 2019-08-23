class Snake {

  PVector location;
  PVector velocity;
  PVector accel;
  ArrayList<PVector> tail;
  int tailLength = 50;
  float topspeed;
  float xoff;
  float yoff;

  Snake() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    accel = new PVector(0, 0);
    tail = new ArrayList<PVector>();
    topspeed = 2;
    xoff = random(10000, 20000);
    yoff = random(22000, 30000);
  }

  void update() {

    /*you can't set temp = location, because location is an object and that would be pass by reference, thus every value in tail would be the latest value
     however the attributes of location are primitives and thus pass by copy*/
    PVector temp = new PVector(location.x, location.y);
    //adds latest location to end of the list
    tail.add(temp);
    //limits tail to tailLength units
    if (tail.size() >= tailLength) {
      tail.remove(0);
    }

    accel.x = map(noise(xoff), 0, 1, -1, 1);
    accel.y = map(noise(yoff), 0, 1, -1, 1);
    velocity.add(accel);
    xoff += 0.01;
    yoff += 0.01;
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    strokeWeight(1);
    //fill(0);

    //draw snake and tail
    for (int i = 0; i < tail.size(); i++) {
      stroke(0, 2 * i);
      ellipse(tail.get(i).x, tail.get(i).y, 10 +  i/4, 10 + i/4);
    }
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
