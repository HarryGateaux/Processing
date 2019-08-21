/**
 * Draw Shape at random point. 
 */
 float x0, y0, x1, y1, xAdd, yAdd;

void setup() {
  size(640, 360);
  background(255);
  frameRate(60);
  x0 = width/2;
  y0 = height/2;
}

void draw() {

  stroke(50);
  xAdd = random(-5,5);  
  yAdd = random(-5,5);
  
  x1 = x0 + xAdd;
  y1 = y0 + yAdd;
  line(x0, y0, x1, y1);
    x0 = x1;
    y0 = y1;
    loop();
}

void keyPressed(){
 if (key=='s'){
  save("print/" + "random.tif");  
 }
}
