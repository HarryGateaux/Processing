class Cluster {

  ArrayList<Node> nodes;
  float diameter;

  Cluster(int n, float d, Vec3D nucleus) {
    nodes = new ArrayList<Node>(); 
    diameter = d;

    for (int i = 0; i < n; i++) {

      /*problem if all the Node objects start in exactly the same location.
       So we add a random vector to the center location so that each Node is slightly offset.*/
      Node node = new Node(nucleus.add(Vec3D.randomVector().scaleSelf(5)));
      nodes.add(node);
      //physics.addParticle(node);
    }
  }

  void display() {

    for (int i = 0; i < nodes.size(); i++) {
      nodes.get(i).display();
    }
  }
}
