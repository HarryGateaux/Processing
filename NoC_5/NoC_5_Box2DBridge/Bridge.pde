class Bridge {

  float bridgeLength;
  int linkCount;
  //Arbitrary rest length
  ArrayList<Link> links;

  Bridge(float l, int c) {

    //Problems can result if the bodies are initialized at the same location.

    bridgeLength = l;
    linkCount = c;
    links = new ArrayList<Link>();

    float linkLength = bridgeLength/linkCount;

    for (int i = 0; i < linkCount + 1; i++) {
      Vec2 pos = new Vec2(i * linkLength, height/2);
      Vec2 dims = new Vec2(linkLength, 4);
      if (i == 0 || i == linkCount) {
        links.add(new Link(pos, dims, true));
      } else {
        links.add(new Link(pos, dims, false));
      }
      if (i > 0) {
        //Making the joint!
        DistanceJointDef djd = new DistanceJointDef();
        djd.bodyA = links.get(i - 1).body;
        djd.bodyB = links.get(i).body;
        djd.length = box2d.scalarPixelsToWorld(linkLength);
        djd.frequencyHz = 0;  // Try a value less than 5
        djd.dampingRatio = 0; // Ranges between 0 and 1

        //Make the joint. Note that we aren't storing a reference to the joint anywhere! We might need to someday, but for now it's OK.
        DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
      }
    }
  }

  void display() {
    //Vec2 pos1 = box2d.getBodyPixelCoord(p1.body);
    //Vec2 pos2 = box2d.getBodyPixelCoord(p2.body);
    //stroke(0);
    //line(pos1.x, pos1.y, pos2.x, pos2.y);


    for (Link l : links) {
      l.display();
    }
  }
}
