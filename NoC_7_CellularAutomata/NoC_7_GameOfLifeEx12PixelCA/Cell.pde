class Cell {

  float x, y;
  float w, h;
  float xoff, yoff;

  float state;
  float previous;

  Cell(float x_, float y_, float w_, float h_) {

    state = int(random(0, 2));
    previous = state;
    w = w_;
    h = h_;
    x = x_;
    y = y_;
  }

  void display() {

////    //If the cell is born, color it blue!
//    if (previous == 0 && state == 1) fill(0, 0, 255);
//    else if (state == 1) fill(0);

////    //If the cell dies, color it red!
//    else if (previous == 1 && state == 0) fill(255, 0, 0);
//    else fill(255);

    fill(map(state, 0, 1, 255, 0 ));

    //fill(255);
    rect(x, y,  w, h);
  }

  void savePrevious() {
    previous = state;
  }

  void newState(float state_) {
    state = state_;
  }
}
