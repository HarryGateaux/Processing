GameOfLife gol;

void setup() {

  size(640, 640);
  gol = new GameOfLife();
  gol.create();
  //populate board
}

void draw() {

  //draw_board();

  gol.generate();  
  gol.display();
}
//void mousePressed() {

//  gol.update();
//}
