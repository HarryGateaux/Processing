FlowField ff;
Boid boid;
PImage img;

void setup(){
  
  size(640, 640);
  boid = new Boid(random(0, width), random(0, height));
  ff = new FlowField();
  img = loadImage("spiral.jpeg");
  img.resize(width, height);
}

void draw(){
  
  background(255);
  image(img, 0, 0, width, height);
  ff.init(img);
  ff.display();
  boid.follow(ff);
  boid.update();
  boid.checkEdges();
  boid.display();
}
