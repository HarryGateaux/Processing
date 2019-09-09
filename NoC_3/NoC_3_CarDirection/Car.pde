class Car {

  PVector pos, vel, acc, mouse;
  float len = 50, angle = 0;

  Car() {

    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, len, len/2);
    popMatrix();
  }

  void update() {
    mouse = new PVector(mouseX, mouseY);
    vel.add(acc);
    pos.add(vel); 
    PVector vectorToMouse = mouse.sub(pos);
    angle = vectorToMouse.heading();
  }
}
