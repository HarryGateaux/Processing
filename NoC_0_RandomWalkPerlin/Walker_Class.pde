class Walker {

  float x, y;
  float tx, ty;

  //constructor
  Walker() {
    x = width/2;
    y = height/2;
    //initializing the perlin noise start point at completely different pts in space
    tx = 50; 
    ty = 1500;
  }

  //methods
  void display() {
    stroke(0);
    point(x, y);
  }

  // take step in random direction
  void step() {
    float stepx = map(noise(tx), 0, 1, -1, 1);
    float stepy = map(noise(ty), 0, 1, -1, 1);
    
    tx += 0.01;
    ty += 0.01;

    x += stepx;
    y += stepy;
  }
}
