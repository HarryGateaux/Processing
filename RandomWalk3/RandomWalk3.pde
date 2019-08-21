/**
 * Draw Shape at random point. 
 */
 float x0, y0, x1, y1, x2, y2, x3, y3, xAdd, yAdd,angle;

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
  angle = random(0, 2*PI);
  x1 = x0 + xAdd * sin(angle) ;
  y1 = y0 + yAdd * cos(angle);
  x2 = x1 + xAdd * sin(angle) ;
  y2 = y1 + yAdd * cos(angle);
  x3 = x2 + xAdd * sin(angle) ;
  y3 = y2 + yAdd * cos(angle);
  curve(x0, y0, x1, y1, x2, y2, x3, y3);
    x0 = x3;
    y0 = y3;
    loop();
}

void keyPressed(){
 if (key=='s'){
  save("print/" + "random.tif");  
 }
}
