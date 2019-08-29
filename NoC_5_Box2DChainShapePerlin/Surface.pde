class Surface {
  ArrayList<Vec2> surface;

  Surface() {

    surface = new ArrayList<Vec2>();
    //3 vertices in pixel coordinates
    for(float i = 0; i < width + 10; i += 20){
      surface.add(new Vec2(i, (map(noise(i/200), 0, 1, 0.5 * height, height))));
    }
    ChainShape chain = new ChainShape();

    //Make an array of Vec2 for the ChainShape.
    Vec2[] vertices = new Vec2[surface.size()];


    for (int i = 0; i < vertices.length; i++) {
      //Convert each vertex to Box2D World coordinates.
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }

    //Create the ChainShape with array of Vec2.
    chain.createChain(vertices, vertices.length);

    //Attach the Shape to the Body.
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createFixture(chain, 1);
  }

void display() {
    strokeWeight(1);
    stroke(0);
    noFill();
//Draw the ChainShape as a series of vertices.
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}
