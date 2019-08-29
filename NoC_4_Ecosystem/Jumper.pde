class Jumper extends Creature {

  Jumper() {
    super();
  }

  void display() {
    tempVel = new PVector(vel.x, vel.y);
    strokeWeight(8);
    ellipse(loc.x + 10*tempVel.normalize().x, loc.y + 10*tempVel.normalize().y, 10, 10);
    line(loc.x - 10*tempVel.normalize().x, loc.y - 10*tempVel.normalize().y, loc.x + 10*tempVel.normalize().x, loc.y + 10*tempVel.normalize().y);
  }

  void update() {

    super.update();
    loc.sub(vel); //undo the smooth movement from the creature class
    if (frameCount % 50 == 0) {
      loc.add(vel);
    }
  }
}
