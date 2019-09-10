class Link {

  Body body;
  float w;
  float h;

  Link(Vec2 pos, Vec2 dims, boolean isFixed) {
    w = dims.x;
    h = dims.y;

    //Build body.
    BodyDef bd = new BodyDef();
    if (isFixed) { 
      bd.type = BodyType.STATIC;
    } else {    
      bd.type = BodyType.DYNAMIC;
    }
    bd.position.set(box2d.coordPixelsToWorld(pos));
    bd.linearDamping = 0.8;
    bd.angularDamping = 0.9;
    body = box2d.createBody(bd);

    //Build shape.
    PolygonShape ps = new PolygonShape();
    //Box2D considers the width and height of a rectangle to be the distance from the center to the edge (so half of what we normally think of as width or height).
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);

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

    pushMatrix();
    //Using the Vec2 position and float angle to translate and rotate the rectangle
    translate(pos.x, pos.y);
    rotate(-a);
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(0, 0, w, h);
    popMatrix();
  }

  void killBody() {
    box2d.destroyBody(body);
  }
}
