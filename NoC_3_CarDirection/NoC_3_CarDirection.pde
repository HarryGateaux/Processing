Car car;

void setup() {

  size(640, 640);
  car = new Car();
}

void draw() {
  background(255);
  car.update();
  car.display();
}
