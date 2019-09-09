float x = 0;
float period = 120;
float amp = 200;
float y;
float size = 50;

void setup() {
  size(640, 640);
      
}

void draw() {
  background(255);
  y = amp * cos((frameCount / period) * TWO_PI);
  ellipse(width/2, height/2 + y, size, size);
  line(width/2, 0, width/2, height/2 + y - size/2);
  
  
}
