class GameOfLife {

  float w, h;
  int rows, cols;
  int cell_count;
  Cell[][] board;
  int ink_nearby;

  GameOfLife() {
    w = 10;
    h = w;
    rows = height ;
    cols = width;
    board = new Cell[rows][cols];
  }

  void create() {


    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {

        board[row][col] = new Cell(col * w, row * h, w, h);
      }
    }


    for (int row = int(0.45 * width); row < int(0.55 * width); row++) {
      for (int col = int(0.45 * height); col < int(0.55 * height); col++) {

        board[row][col].previous = 10;

        board[row][col].state = 10;
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

      for (int row = 1; row < rows - 1; row++) {
        for (int col = 1; col < cols - 1; col++) {

          //float ink_nearby = 0;
          for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {

              //this adds up the total extra ink in nearby cells where the ink levels is greater than this cell
              //no longer need to subtract itself later as it's doing it here

              float diff = board[row + i][col + j ].previous - board[row][col].previous;
              //ink_nearby += max(0, diff ); 

              //assume the ink flows into this cell to balance the two cells.  
              if (diff > 0) {
                board[row + i ][col + j ].previous -= 0.5 * diff;
                board[row][col].previous +=  0.5 * diff;
              }
              
             board[row + i ][col + j ].newState(board[row + i ][col + j ].previous);
            }

            //add ink nearby into this cell
            //print(ink_nearby);
            //we have incremented the additional ink into the previous attribute already in  the loop above
            //board[row][col].newState(board[row][col].previous); 

            //if (board[row][col].state > 1) {
            //  board[row][col].newState(1);
            //} //caps the state at 1, i/e 'full of ink'
          }
        }
      }
    }
  }

  void display() {
    loadPixels();
    for ( int i = 0; i < rows; i++) {
      for ( int j = 0; j < cols; j++) {
        //board[i][j].display();
        pixels[i * width + j] = color(map(board[i][j].state, 0, 1, 255, 0));
      }
    }
    updatePixels();
  }

  void update() {
    int row = int(mouseY / w);
    int col = int(mouseX / w);

    gol.board[row][col].state = 1;
  }
}
