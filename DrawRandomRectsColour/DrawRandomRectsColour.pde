/**
 * Draw Shape at random point. 
 */
 
 float y;
 float x;
 float w;
 float h;
 float r, g , b, t;
void setup() {
  size(640, 360);
  background(255);
  frameRate(500);
}

void draw() {

  shininess(10.0);
  x = random(0,width);
  y = random(0,height);
  w = random(0,t);
  h = random(0,t);
  r = random(0,255);
  g = random(200,255);
  b = random(200,255);
  t = random(0,10);
  fill(r,g,b);
  stroke(r,g,b);
  rect(x, y, w, h,2);
  fill(255,255,255,0);
  stroke(255,255,255);
  rect(0.01,0.01,width,height);
    loop();
}

void keyPressed(){
 if (key=='s'){
  save("print/" + "blue.tif");  
 }
}
