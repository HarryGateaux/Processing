class FlowField {

  int rows, cols;
  int cellsize;
  PVector[][] cells;
  float xoff, yoff, zoff;
  
  FlowField() {
    cellsize = 40;
    rows = width/cellsize;
    cols = height/cellsize;
    cells = new PVector[cols][rows];
    init();
  }
  
  void init() {
    xoff = 0;
    for (int i = 0; i < cols; i++) {
      yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
        cells[i][j] = new PVector(cos(theta), sin(theta));
        
        yoff += 0.2;
      }
      xoff += 0.2;
    }
    zoff += 0.01;
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

  PVector lookup(PVector lookup) {

    int column = int(constrain(lookup.x/cellsize, 0, cols-1));
    int row = int(constrain(lookup.y/cellsize, 0, rows-1));
    return cells[column][row].copy();
  }
}
