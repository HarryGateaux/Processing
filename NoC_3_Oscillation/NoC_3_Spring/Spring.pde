class Spring {
  
 PVector anchor, location;
 float restLength;
 float currentLength;
 float displacement;
 
 Spring(PVector anchor_) {
  anchor = anchor_;
  restLength = 400;
   
 }
 
 void display(Bob b) {
    fill(100);
    rectMode(CENTER);
    rect(anchor.x,anchor.y,10,10);
    line(anchor.x, anchor.y, b.location.x, b.location.y);
  }
  
  
  void connect(Bob b) {
    
   float k = 0.1;
   PVector force = PVector.sub(b.location, anchor);
   currentLength = force.mag();
   displacement = currentLength - restLength;
   
   force.normalize();
   force.mult(-1 * k * displacement);
   
   b.applyForce(force);
    
  }
}
