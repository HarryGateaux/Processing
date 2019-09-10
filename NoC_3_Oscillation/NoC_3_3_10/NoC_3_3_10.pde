float startAngle = 0;
Wave wave1, wave2;

void setup() {
  size(640, 320);
  wave1 = new Wave(new PVector(100, 100), 20, 0.01, 50 );
  wave2 = new Wave(new PVector(300, 100), 20, 0.5, 200 );
}

void draw() {
  background(255);

  //float angle = startAngle;
  wave1.display();
  wave2.display();
  //startAngle += 0.02;
}
