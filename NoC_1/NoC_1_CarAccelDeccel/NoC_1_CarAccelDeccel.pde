int noOfAgents = 1;
Car[] cars = new Car[noOfAgents];

void setup() {
  size(640, 640); 
  for (int i=0; i<noOfAgents; i++) {
    cars[i] = new Car();
  }
  stroke(0);
}

void draw() {
  //reset background
  background(255);
  for (int j=0; j<noOfAgents; j++) {
    pushMatrix();

    //update position with vel
    cars[j].update();
    cars[j].checkEdges();
    //display sphere on screen
    cars[j].show();

    if (mousePressed == true) {
      if (mouseButton == LEFT) {
        cars[j].accel.add(cars[j].inc);
      } else if (mouseButton == RIGHT) {
         cars[j].accel.sub(cars[j].inc);
      }
    }
  }


  popMatrix();
}
