//PVector pos = new PVector(400, 400, -400);
//PVector vel = new PVector(3, 1, 2);
Sphere[] spheres = new Sphere[20];

void setup() {
  size(640, 640, P3D); 
  for (int i=0; i<20; i++) {
    spheres[i] = new Sphere();
  }
  stroke(0);
}


void draw() {
  //reset background
  background(255);
  for (int j=0; j<20; j++) {
    pushMatrix();

    //update position with vel
    spheres[j].update();
    spheres[j].checkEdges();
    //display sphere on screen
    spheres[j].show();


    popMatrix();
  }
}
