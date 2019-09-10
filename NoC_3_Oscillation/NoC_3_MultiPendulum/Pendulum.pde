class Pendulum {

  PVector origin;
  float angleAcc;
  float angleVel;
  float angle;
  float len;
  float gravity;
  PVector pos;

  Pendulum(PVector origin_, float len_, float angle_) {

    origin = origin_.copy();
    angle = angle_;
    len =  len_;
    gravity = 10;
    pos = new PVector();
  }

  void display(boolean driven_) {
    if(driven_){
      origin.set(pend1.pos);
    }
    //determine bob position using trig
    pos.set(len * sin(radians(angle)), len * cos(radians(angle)));
    pos.add(origin);
    point(origin.x, origin.y);
    line(origin.x, origin.y, pos.x, pos.y);
    ellipse(pos.x, pos.y, 20, 20);

}

  void update() {
 
    //need to scale angular acceleration by pendulum length
    angleAcc = -1 * gravity / len * sin(radians(angle));
    angleVel += angleAcc;
    angle += angleVel;
    angleVel *= 0.999;
    print(angleAcc + " ");
  }
}
