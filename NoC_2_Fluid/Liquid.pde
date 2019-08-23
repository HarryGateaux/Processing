class Liquid {

  float x1;
  float y1;
  float x2;
  float y2;
  float coeff;

  Liquid(float x1_, float  y1_, float  x2_, float  y2_) {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    coeff = 0.01;
  }

  void display() {
    fill(0, 175);
    rect(x1, y1, x2, y2);
  }
}
