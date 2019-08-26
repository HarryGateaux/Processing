void setup(){
  size(640, 640);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotate(radians(radians(frameCount * 50)));
  line(- 50, 0, 50, 0);
  ellipse(50,0,8,8);
  ellipse(-50,0,8,8);


}
