class Swamp {
  
 float x, y, w, h;
 
 Swamp() {
  x = width/2;
  y = height/2;
  w = width;
  h = height;
 }
  
  void display() {
   fill(100);
   rect(x, y, w, h); 
  }
}
