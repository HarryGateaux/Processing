import java.util.Iterator;
ParticleSystem ps;
 
void setup() {
  size(640,360);
  ps = new ParticleSystem();
}
 
void draw() {
  background(255);
 
  ps.addParticle();
  ps.update();
  ps.display();
  

}
