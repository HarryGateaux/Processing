class Walker {

  float x, y;
  float tx, ty;

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
    float stepx = int(random(3)) - 1; //gives -1, 0 , 1
    float stepy = int(random(3)) -1;

    x += stepx;
    y += stepy;
  }
}
