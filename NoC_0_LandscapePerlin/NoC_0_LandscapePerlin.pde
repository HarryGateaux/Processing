float scale = 0.01;
float[][] points;
int rows = 25;
int cols = 25;

void setup() {
  background(255);
  size(640, 640, P3D);
  stroke(0);

  points = new float[cols][rows];
}

void draw() {

  translate(0, height/2, 0);
  noFill();
  scale(0.5);
  rotateX(PI/3);

  //generate random height using perlin noise at each x , y
  for (int x=0; x< cols; x++) {
    for (int y=0; y < rows; y++) {   
      points[x][y] = noise(scale * x, scale * y);
    }
  }

  //use these heights rescaled to -100 to 100, on the z axis



  for (int x=0; x<cols-1; x ++) {
    beginShape(TRIANGLE_STRIP);
    for (int y=0; y<rows; y ++) {   
      vertex(x * width/cols, y * height/rows, points[x][y] * 100);
      vertex((x+1) * width/cols, y * height/rows, points[x+1][y] * 100);
    }
    endShape();
  }


}
