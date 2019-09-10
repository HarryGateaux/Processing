CA ca;

void setup() {
  size(1280, 640);
  noStroke();
  ca = new CA();
}


void draw() {
  background(255);
  ca.display();

}
