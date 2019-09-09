Ball ball;
PVector gravity;

void setup() {
  size(1280, 640);
  ball = new Ball();
}

void draw() {
  gravity = new PVector(0, 0.1);
  background(255);
  ball.applyForce(gravity);
  ball.update();
  ball.display();
  
}
