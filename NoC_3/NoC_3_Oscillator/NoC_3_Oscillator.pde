Oscillator[] oscs = new Oscillator[10];

void setup() {
  size(640, 640);  

  for (int i = 0; i < oscs.length; i++) {
    PVector vel = new PVector(0.02 * i,0.04 * i);
    PVector amp = new PVector(20 + 20 * i,20 +  20 * i);

    oscs[i] = new Oscillator(vel, amp);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < oscs.length; i++) {
    oscs[i].oscillate();
    oscs[i].display();
  }
}
