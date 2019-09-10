

void setup() {
  background(100);
  size(1280, 640, P3D);
}

void draw() {
  
translate(width/2, height/2, 0);
stroke(255);
rotateX(PI/2);
rotateZ(-PI/6);


beginShape();
vertex(-100, -100, -100);
vertex( 100, -100, -100);
vertex(   0,    0,  100);

vertex( 100, -100, -100);
vertex( 100,  100, -100);
vertex(   0,    0,  100);

vertex( 100, 100, -100);
vertex(-100, 100, -100);
vertex(   0,   0,  100);

vertex(-100,  100, -100);
vertex(-100, -100, -100);
vertex(   0,    0,  100);
endShape();

}
