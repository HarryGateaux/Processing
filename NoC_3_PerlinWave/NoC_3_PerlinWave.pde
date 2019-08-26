float startAngle = 0;
float angleVel = 0.01;
 
void setup() {
  size(640,640);
}
 
void draw() {
  background(255);
 
float angle = startAngle;
 
  for (int x = 0; x <= width; x += 10) {
    float y = map(noise(angle),-1,1,0,height);
    stroke(0);
    fill(0,50);
    ellipse(x,y,20,20);
    angle += angleVel;
  }
  
  startAngle += 0.02;
}
