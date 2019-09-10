class Walker {

  float x;
  float y;

  //constructor
  Walker() {
    x = width/2;
    y = height/2;
  }

  //methods
  void display() {
    stroke(0);
    point(x, y);
  }

  // take step in random direction
  void step() {
    int stepx = int(random(3)) - 1; //gives -1, 0 , 1
    int stepy = int(random(3)) -1;

    //make 50% chance of moving in mouse direction

    if (random(1) > 0.5) {
      //case where doesn't move in mouse direction
      x += stepx;
      y += stepy;
    } else {
      float d = dist(mouseX, mouseY, x, y);
      x += (mouseX - x) / d;
      y += (mouseY - y) / d;
    }
  }
}
