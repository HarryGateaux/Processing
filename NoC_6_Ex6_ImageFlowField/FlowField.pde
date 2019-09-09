class FlowField {

  int rows, cols;
  int cellsize;
  PVector[][] cells;
  float xoff, yoff, zoff;

  FlowField() {
    cellsize = 20;
    rows = width/cellsize;
    cols = height/cellsize;
    cells = new PVector[cols][rows];
    //init(img);
  }

  void init(PImage img) {

    img.loadPixels(); 
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        int loc = x + y * width;

        //map from the brightness of the bottom right corner of each cell to the flow field angle,
        //could improve by doing the average brightness across pixels that fall within each cell.
        float brightness = brightness(img.pixels[loc]);
        float angle_brightness = map(brightness, 0, 255, 0, PI);
        cells[x/cellsize][y/cellsize] = new PVector(cos(angle_brightness), sin(angle_brightness));
        //float r = red(img.pixels[loc]);
        //float g = green(img.pixels[loc]);
        //float b = blue(img.pixels[loc]);

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
    float arrowsize = 3;
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
