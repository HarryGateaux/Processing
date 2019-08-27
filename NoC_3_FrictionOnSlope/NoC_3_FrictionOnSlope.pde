float g = 1;
float mass = 20;
float nF;
float slopeAngle = radians(30);
float coeffF = 3.0;
float acc;
PVector pos;


void setup() {
   size(640, 640);
   pos = new PVector(400, height/2 -  tan(slopeAngle) * 200);
}



void draw() {
  ellipse(pos.x, pos.y, mass, mass);
  line(200, height/2, 600, height/2 -  tan(slopeAngle) * 400);
  //normal force is the component of the force due to gravity perp to the slope, this is proportionate to friction.
  nF = g * mass * cos(slopeAngle);
  
  acc = g / sin(slopeAngle) -  coeffF * nF / mass;
  pos.add(new PVector(acc * -cos(slopeAngle), acc * sin(slopeAngle)));
  
  
  
}
