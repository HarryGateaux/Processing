class Snake {

  PVector location;
  PVector velocity;
  PVector acceleration;
  ArrayList<PVector> tail;
  float topspeed;

  Snake() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    acceleration = new PVector(0, 0);
    tail = new ArrayList<PVector>();
    topspeed = 4;
  }

  void update() {

    //Have to create a copy here, if you directly put location into the arraylist it's a direct reference to the latest version of the object
    PVector temp = new PVector(location.x, location.y);
    tail.add(temp);
    if (tail.size() > 100) {
      tail.remove(0);
    }

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(175);

    //draw snake
    float shrink = 0.95;
    for (int i = 0; i<tail.size(); i++) {
      
      ellipse(tail.get(i).x, tail.get(i).y, 20, 20);
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
