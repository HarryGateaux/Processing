class Car {

  PVector pos;
  PVector vel;
  PVector accel;
  PVector inc;
  int size;


  Car() {

    pos = new PVector(random(0, width), random(0, height));
    vel =  new PVector(random(-3, 3), random(-3, 3));
    accel = new PVector(0, 0);
    inc = new PVector(0.1, 0.1);
    size = 20;
  }

  void show() {
    rectMode(CENTER);
    rect(pos.x, pos.y, size, size);
  }

  void checkEdges() {

    if (pos.x < size) {
      vel.x = abs(vel.x);
      pos.x = size;
    } else if ( pos.x > (width - size)) {
      vel.x = -abs(vel.x);
      pos.x = width - size;
    };

    if (pos.y < size) {
      vel.y = abs(vel.y);
      pos.y = size;
    } else if ( pos.y > (height - size)) {
      vel.y = -abs(vel.y);
      pos.y = height - size;
    }  
    ;
  }

  void update() {

    vel.add(accel);
    //vel.limit(3);
    pos.add(vel);
    print(vel + " ,, ");
  }

  void adjust(int dir_) {
    if (dir_ == 1) {
      accel.add(inc);
    } else if (dir_ == -1) {
      accel.sub(inc);
    }
  }
}
