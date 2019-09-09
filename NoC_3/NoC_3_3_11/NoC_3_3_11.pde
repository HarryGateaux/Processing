float startAngle = 0;
Wave wave1, wave2;

void setup() {
  size(640, 320);
  wave2 = new Wave(new PVector(300, 100), 20, 0.5, 200 );
}

void draw() {
  background(255);

  //float angle = startAngle;
  wave2.display();
  //startAngle += 0.02;
}
