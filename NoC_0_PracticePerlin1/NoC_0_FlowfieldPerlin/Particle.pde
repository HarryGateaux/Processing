class Particle {

  //variables
  PVector pos;
  PVector speed;
  PVector dir;
  int tempy;
  int tempx;
  float maxspeed;
  

  //constructor
  Particle() {

    pos = new PVector(random(0, width), random(0, height));
    speed = new PVector(0, 0);
    maxspeed = 3;
  }

  void display() {
    ellipse(pos.x, pos.y, 3, 3);
  }
  
  void applyDirection(PVector[][] directions) {
    
    tempx = floor(pos.x / scl);
    tempy = floor(pos.y / scl);
    dir = directions[tempx][tempy];
    speed.add(dir);
 
    //speed = speed * 
  }

  void update() {

    pos.add(speed);
    pos.x = ((pos.x % width) + width) % width;
    pos.y = ((pos.y % height) + height) % height; //this is correcting for modulo of negative numbers being wrong
    speed.limit(maxspeed);
  }

  void edges() {
 
  
  }
}
