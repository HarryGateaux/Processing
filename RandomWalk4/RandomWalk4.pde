/**
 * Draw Shape at random point. 
 */
 float x0, y0, x1, y1, x2, y2, x3, y3, xAdd, yAdd,angle;

void setup() {
  size(640, 360);
  background(255);
  frameRate(1);
  x0 = width/2;
  y0 = height/2;
}

void draw() {

  stroke(50);
  xAdd = 20;  
  yAdd = 20;
  angle = random(0, 2*PI);
  x1 = x0 ;
  y1 = y0 ;
  x2 = x1 + xAdd * sin(angle) ;
  y2 = y1 + yAdd * cos(angle);
  x3 = x2 + xAdd * sin(angle) ;
  y3 = y2 + yAdd * cos(angle);
  beginShape();
  curveVertex(0,  0);
  curveVertex(x1,  y1);
  curveVertex(x2,  y2);
  curveVertex(height, width);
  endShape();
  x0 = x2;
  y0 = y2;
}

void keyPressed(){
 if (key=='s'){
  save("print/" + "random.tif");  
 }
}
