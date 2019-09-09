PVector a, b;
float angleBetween;

void setup() {
  size(640, 640);
  fill(50);
  a = new PVector(200, 200);
  b = new PVector(75, -100);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  line(0, 0, a.x, a.y);
  line(0, 0, b.x, b.y);
  
  angleBetween = degrees(acos(a.dot(b)/(a.mag() * b.mag()))) ;
  textSize(16);
  text(angleBetween + " degrees", -100, -100);
  
  
}
