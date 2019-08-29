import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;  
ArrayList<Polygon> polygons;
Boundary boundary;
Surface surface;

void setup() {
  size(640, 640);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  polygons = new ArrayList<Polygon>();
  //boundary = new Boundary(width/2, 0.75 * height, width/2, 20); //specify centerpoint and dimensions.
  surface = new Surface();
}

void draw() {
  background(255);
  box2d.step();
  if (mousePressed) {
    polygons.add(new Polygon());
  }

  for (Polygon b : polygons) {
    b.display();
  }
  //boundary.display();
  surface.display();
}
