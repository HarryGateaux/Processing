class Polygon {

  Body body;
  float w;
  float h;

  Polygon() {
    w = 16;
    h = 16;

    //Build body.
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(mouseX, mouseY));
    body = box2d.createBody(bd);

    //Build shape.
    Vec2[] vertices = new Vec2[5];  // An array of 5 vectors
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-15, 15));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(15, 15));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(0, -15));   
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(20, 0));
    vertices[4] = box2d.vectorPixelsToWorld(new Vec2(-15
    
    , 0));

    PolygonShape ps = new PolygonShape();

    ps.set(vertices, vertices.length);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    //Set physics parameters.
    fd.friction = 0.3;
    fd.restitution = 0.5;

    //Attach the Shape to the Body with the Fixture.
    body.createFixture(fd);
  }

  void display() {
    //We need the Body's location and angle.
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();

    pushMatrix();
    //Using the Vec2 position and float angle to translate and rotate the rectangle
    translate(pos.x, pos.y);
    rotate(-a);
    fill(map(-a, 0, TWO_PI, 255, 0));
    stroke(0);
    rectMode(CENTER);
    
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    
    popMatrix();
  }

  void killBody() {
    box2d.destroyBody(body);
  }
}
