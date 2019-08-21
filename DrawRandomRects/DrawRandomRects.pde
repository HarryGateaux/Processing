/**
 * Draw Shape at random point. 
 */
 
 float y;
 float x;
 float w;
 float h;

void setup() {
  size(640, 360);
  background(255);
  frameRate(500);

}

void draw() {
  stroke(0);
  x = random(0,width);
  y = random(0,height);
  w = random(0,10);
  h = random(0,10);
  rect(x, y, w, h,2);
  fill(255,255,255,5);
  stroke(255);
  rect(0.01,0.01,width,height);
    loop();
}

void keyPressed(){
 if (key=='s'){
  save("test.tif"); 
 }
}
