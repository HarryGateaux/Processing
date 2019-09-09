//generates a 3d surface of points, connected with squares using perlin noise

float scale = 0.2;
PVector[][] points;
int scl = 40;
float[][] flowfield;
Particle[] particles;

void setup() {
  background(255);
  size(640, 640, P3D);
  stroke(0);
  fill(0, 1);

  particles = new Particle[10000];


  //create particles
  for (int i=0; i<10000; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  //translate(width/4, height/2, 0);
  //scale(0.5);
  //rotateX(PI/3);
  int rows = height/scl;
  int cols = width/scl;
  int rowheight = height/rows;
  int colwidth = width/cols;
  float angle;
  points = new PVector[cols][rows];  
  //generate random height using perlin noise at each x , y
  for (int x=0; x< cols; x++) {
    for (int y=0; y < rows; y++) {   
      //map the noise output onto random rotation in radians
      angle = map(noise(scale * x, scale *  y), 0, 1, 0, TWO_PI);
      points[x][y] = PVector.fromAngle(angle);
    }
  }

  //use these heights rescaled to -100 to 100, on the z axis

//  for (int x=0; x<cols; x ++) {
//    for (int y=0; y<rows; y ++) {   
//      line(x * colwidth, y * rowheight, x * colwidth + colwidth * points[x][y].x, y * rowheight +  rowheight * points[x][y].y );
//      //flowfield[x][y] = cos(points[x][y]);
//    }
//  }
  noStroke();
  //particles
  for (int i=0; i<10000; i++) {
    particles[i].update();
    particles[i].display();
    particles[i].applyDirection(points);
  }
}
