class FlowField {

  int rows, cols;
  int cellsize;
  PVector[][] cells;

  FlowField() {
    cellsize = 20;
    rows = width/cellsize;
    cols = height/cellsize;
    cells = new PVector[rows][cols];

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        //line(i * cellsize, j * cellsize + cellsize/4, i * cellsize + cellsize,  j * cellsize + cellsize * 0.75);
        cells[i][j] = PVector.random2D().mult(10);
      }
    }
  }

  void display() {

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        //line(i * cellsize, j * cellsize + cellsize/4, i * cellsize + cellsize,  j * cellsize + cellsize * 0.75);
        PVector lineStart = new PVector(j * cellsize, i * cellsize);
        PVector lineEnd = PVector.add(cells[i][j], lineStart);
        drawVector(cells[i][j], j * cellsize, i * cellsize);
      }
    }
  }
  
  
  void drawVector(PVector cell_vector, float x, float y){
    pushMatrix();
    
    translate(x, y);
    rotate(cell_vector.heading());
    float len = cell_vector.mag();
    line(0, 0, len, 0);
    
    popMatrix();
   
    
    
    
    
    
  }
}
