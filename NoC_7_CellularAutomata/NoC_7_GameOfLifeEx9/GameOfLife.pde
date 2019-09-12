class GameOfLife {

  float w, h;
  int rows, cols;
  int cell_count;
  Cell[][] board;
  int neighbours_alive;

  GameOfLife() {
    w = 10;
    h = w;
    rows = height/int(h);
    cols = width/int(w);
    board = new Cell[rows][cols];
  }

  void create() {

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {

        board[row][col] = new Cell(col * w, row * h, w, h);
      }
    }
  }

  void generate() {

    if (keyPressed == true) {

      for ( int i = 0; i < rows; i++) {
        for ( int j = 0; j < cols; j++) {
          board[i][j].savePrevious();
        }
      }

      for (int row = 0; row < rows; row++) {
        for (int col = 0; col < cols; col++) {

          int neighbours_alive = 0;
          for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
              
                neighbours_alive += board[(row + i + rows) % rows][(col + j + cols) % cols].previous;
              
            }
          }
          //shouldn't count itself
          neighbours_alive -= board[row][col].previous;

          //ruleset
          if      ((board[row][col].state == 1) && (neighbours_alive <  2)) board[row][col].newState(0);
          else if ((board[row][col].state == 1) && (neighbours_alive >  3)) board[row][col].newState(0);
          else if ((board[row][col].state == 0) && (neighbours_alive == 3)) board[row][col].newState(1);
        }
      }
    }
  }

  void display() {

    for ( int i = 0; i < rows; i++) {
      for ( int j = 0; j < cols; j++) {
        board[i][j].display();
      }
    }
  }

  void update() {
    int row = int(mouseY / w);
    int col = int(mouseX / w);

    gol.board[row][col].state = 1;
  }
}
