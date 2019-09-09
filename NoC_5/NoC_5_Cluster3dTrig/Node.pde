class Node extends VerletParticle3D {
  
    Node(Vec3D v) {
      super(v);
    }
    
    void display() {
      
      pushMatrix();
      translate(x, y, z);
      sphere(1);
      popMatrix();
        
    }
  
  
}
