class Cell {

  float x, y;
  float w, h;
  float xoff, yoff;

  float state;
  float previous;

  Cell(float x_, float y_, float w_, float h_) {

    state = 0;
    previous = state;
    w = w_;
    h = h_;
    x = x_;
    y = y_;
  }

  void display() {

    //fill(map(state, 0, 1, 255, 0 ));

    //fill(255);
  }
 void savePrevious() {
    previous = state;
  }

  void newState(float state_) {
    state = state_;
  }
}
