int[][] board, next_board;
int w, cell_count, neighbours_alive;
void setup() {

  size(640, 640);
  w = 10;
  cell_count = width/w;
  board = new int[cell_count][cell_count];
  next_board = new int[cell_count][cell_count]; 

  //populate board
  
  for (int row = 0; row < cell_count; row++) {
    for (int col = 0; col < cell_count; col++) {
      board[row][col] = 0;
    }
  }
}



void draw() {

  draw_board();
  if (keyPressed == true) {

    for (int row = 0; row < cell_count ; row++) {
      for (int col = 0; col < cell_count ; col++) {

        neighbours_alive = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            {
              if (board[(row + i + cell_count) % cell_count ][(col + j + cell_count) % cell_count] == 1) neighbours_alive += 1;
            }
          }
        }
        //shouldn't count itself
        neighbours_alive -= board[row][col];

        //ruleset
        if      ((board[row][col] == 1) && (neighbours_alive <  2)) next_board[row][col] = 0;
        else if ((board[row][col] == 1) && (neighbours_alive >  3)) next_board[row][col] = 0;
        else if ((board[row][col] == 0) && (neighbours_alive == 3)) next_board[row][col] = 1;
        else next_board[row][col] = board[row][col];
      }
    }
    board = next_board;
  }
}

void mousePressed() {

  int row = int(mouseY / w);
  int col = int(mouseX / w);

  board[row][col] = 1;
}

void draw_board() {

  for (int row = 0; row < cell_count ; row++) {
    for (int col = 0; col < cell_count ; col++) {

      float colour = map(board[row][col], 0, 1, 255, 0);
      fill(colour);
      rect(col * w, row * w, (col + 1) * w, (row + 1) * w);
    }
  }
}
