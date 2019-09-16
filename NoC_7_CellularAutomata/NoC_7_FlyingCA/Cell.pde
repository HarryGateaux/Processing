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
  }

  void display() {

    fill(255 - 255 * state);
    rect(x, y,  w, h);
  }

  void savePrevious() {
    previous = state;
  }

  void newState(int state_) {
    state = state_;
  }
}
