class FlowField {

  int rows, cols;
  int cellsize;
  PVector[][] cells;

  FlowField() {
    cellsize = 40;
    rows = width/cellsize;
    cols = height/cellsize;
    cells = new PVector[cols][rows];

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        PVector v = new PVector(width/2 - i * cellsize, height/2 - j * cellsize);
        cells[i][j] = v.normalize();
      }
    }
  }

  void display() {

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(cells[i][j], i * cellsize, j * cellsize);
      }
    }
  }


  void drawVector(PVector cell_vector, float x, float y) {
    pushMatrix();

    translate(x + cellsize/2, y + cellsize/2);

    rotate(cell_vector.heading());
    //float len = cell_vector.mag() * cellsize/2;
    float arrowsize = 10;
    line(-cellsize/2, 0, cellsize/2, 0);
    line(cellsize/2 - arrowsize, arrowsize, cellsize/2, 0);
    line(cellsize/2 - arrowsize, -arrowsize, cellsize/2, 0);

    popMatrix();
  }
}
