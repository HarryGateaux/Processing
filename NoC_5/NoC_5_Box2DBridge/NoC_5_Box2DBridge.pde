import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;  
ArrayList<Box> boxes;
Boundary boundary;
Bridge bridge;

void setup() {
  size(640, 640);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<Box>();
  boundary = new Boundary(width/2, height, width, 20); //specify centerpoint and dimensions.
  bridge = new Bridge(width, 20);
}

void draw() {
  background(255);
  box2d.step();
  if (mousePressed) {
    boxes.add(new Box());
  }

  for (Box b : boxes) {
    b.display();
  }
  bridge.display();
}
