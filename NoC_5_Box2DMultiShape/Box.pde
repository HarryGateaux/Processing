class Box {

  Body body;
  float w;
  float h;
  float r;
  
  Box() {
    w = 2;
    h = 16;
    r = 8;

    //Build body.
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(mouseX, mouseY));
    body = box2d.createBody(bd);

    //Build shape 1
    PolygonShape ps = new PolygonShape();
    //Box2D considers the width and height of a rectangle to be the distance from the center to the edge (so half of what we normally think of as width or height).
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);
    
    //Build shape 2
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r/2);
    
    Vec2 offset = new Vec2(0, -h/2);
    offset = box2d.vectorPixelsToWorld(offset);
    cs.m_p.set(offset.x, offset.y);
    
    //Build shape 3
    
    CircleShape cs2 = new CircleShape();
    cs2.m_radius = box2d.scalarPixelsToWorld(r/2);
    
    Vec2 offset2 = new Vec2(0, h/2);
    offset2 = box2d.vectorPixelsToWorld(offset2);
    cs2.m_p.set(offset2.x, offset2.y);   
    
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    //Set physics parameters.
    fd.friction = 0.3;
    fd.restitution = 0.5;

    //Attach the Shape to the Body with the Fixture.
    body.createFixture(fd);
    body.createFixture(cs, 1.0); //attaching shape without fixture for the circle
    body.createFixture(cs2, 1.0);
  }

  void display() {
    //We need the Body's location and angle.
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();

    pushMatrix();
    //Using the Vec2 position and float angle to translate and rotate the rectangle
    translate(pos.x, pos.y);
    rotate(-a);
    fill(map(-a, 0, TWO_PI, 255, 0));
    stroke(0);
    rectMode(CENTER);
    rect(0, 0, w, h);
    ellipse(0, -h/2, r, r);
    ellipse(0, h/2, r, r);
    
    popMatrix();
  }

  void killBody() {
    box2d.destroyBody(body);
  }
}
