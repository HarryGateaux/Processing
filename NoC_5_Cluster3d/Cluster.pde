class Cluster {

  ArrayList<Node> nodes;
  float diameter;

  Cluster(int n, float d, Vec3D nucleus) {
    nodes = new ArrayList<Node>(); 
    diameter = d;

    for (int i = 0; i < n; i++) {

      /*problem if all the Node objects start in exactly the same location.
       So we add a random vector to the center location so that each Node is slightly offset.*/
      Node node = new Node(nucleus.add(new Vec3D(sin(random(0, 1)), cos(random(0, 1)), tan(random(0, 1))).scaleSelf(50)));
      nodes.add(node);
      //physics.addParticle(node);
    }

    for (int i = 0; i < n; i++) {
      for (int j = i + 1 ; j < n; j++) {
        Node ni = nodes.get(i);
        Node nj = nodes.get(j);
        physics.addSpring(new VerletSpring3D(ni, nj, diameter, 0.01));
      }
    }
  }

  void display() {

    for (int i = 0; i < nodes.size(); i++) {
      nodes.get(i).display();
    }
  }
}
