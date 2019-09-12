class Cell {

  float x, y;
  float w, h;
  float xoff, yoff;

  int state;
  int previous;

  Cell(float x_, float y_, float w_, float h_) {

    state = int(random(0, 2));
    previous = state;
    w = w_;
    h = h_;
    x = x_;
    y = y_;
    xoff = w/2;
    yoff = h;
  }

  void display() {

//    //If the cell is born, color it blue!
    if (previous == 0 && state == 1) fill(0, 0, 255);
    else if (state == 1) fill(0);

//    //If the cell dies, color it red!
    else if (previous == 1 && state == 0) fill(255, 0, 0);
    else fill(255);


    //fill(255);
    stroke(0);
    pushMatrix();
    translate(x, y);
    beginShape();
    vertex(0, yoff);
    vertex(xoff, 0);
    vertex(xoff+w, 0);
    vertex(2*w, yoff);
    vertex(xoff+w, 2*yoff);
    vertex(xoff, 2*yoff);
    vertex(0, yoff);
    endShape();
    popMatrix();
  }

  void savePrevious() {
    previous = state;
  }

  void newState(int state_) {
    state = state_;
  }
}
