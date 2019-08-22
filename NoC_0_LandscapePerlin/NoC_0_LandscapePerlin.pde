//generates a 3d surface of points, connected with squares using perlin noise

float scale = 0.1;
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

  //background(255);
  translate(width/4, height/2, 0);
  noFill();
  scale(0.5);
  rotateX(PI/3);
  int rowheight = height/rows;
  int colwidth = width/cols;

  //generate random height using perlin noise at each x , y
  for (int x=0; x< cols; x++) {
    for (int y=0; y < rows; y++) {   
      //map the noise output onto range for the z axis
      points[x][y] = map(noise(scale * x, scale *  y), 0, 1, -250, 250);
    }
  }

  //use these heights rescaled to -100 to 100, on the z axis

  for (int x=0; x<cols-1; x ++) {
    beginShape(QUAD_STRIP);
    for (int y=0; y<(rows); y ++) {   
      //line(x * colwidth, y * rowheight, x * colwidth + colwidth * cos(points[x][y]), y * rowheight +  rowheight * sin(points[x][y]) );
      vertex(x * colwidth, y * rowheight, points[x][y] );
      vertex((x + 1) * colwidth, y * rowheight, points[x + 1][y] );
    }
    endShape();
  }
}
