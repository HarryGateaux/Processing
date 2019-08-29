class Snake extends Creature {

  ArrayList<PVector> tail;
  int tailLength = 50;

  Snake() {
    super();
    tail = new ArrayList<PVector>();
    topspeed = 2;
    xoff = random(10000, 20000);
    yoff = random(22000, 30000);
  }

  void update() {
    
    super.update();
    PVector temp = super.loc.copy();
    //PVector temp = new PVector(loc.x, loc.y);
    //adds latest loc to end of the list
    tail.add(temp);
    //limits tail to tailLength units
    if (tail.size() >= tailLength) {
      tail.remove(0);
    }
    
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
}
