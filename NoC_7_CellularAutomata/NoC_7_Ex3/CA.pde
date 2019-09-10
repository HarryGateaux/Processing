import java.util.Random;

class CA {
  int[] cells, ruleset;
  int w;
  int generation = 0;

  CA() {
    w = 10;
    cells = new int[width/w];
    cells[cells.length/2] = 1; //set mid cell to on
    ruleset = new int[]{0, 1, 0, 1, 1, 0, 1, 0}; //far left is on on on, far right in off off off
  }

  void display() {

      for (int i = 0; i < cells.length; i++) {

        int colour = (cells[i] == 0) ? 255 : 0;
        //stroke(colour);
        float angle = map(colour, 255, 0, PI/2, 0);
        //rect(i * w, generation * w, w, w);
        line(i * w, generation * w, (i + 1 * sin(angle)) * w, (generation + 1 * cos(angle)) * w);
      }

    if (generation < height/w) generate();

  }


  void generate() {
    int[] next_cells = new int[cells.length];

    for (int i = 1; i < cells.length - 1; i++) {

      //determine neighbours so we can apply ruleset
      int left = cells[i - 1];
      int mid = cells[i];
      int right = cells[i + 1];

      next_cells[i] = rules(left, mid, right);
    }
    //once the next gen has been calculated, replace current gen with this
    cells = next_cells;
    generation++;
  }

  //function that applies ruleset given input of cell's neighbours
  int rules(int left, int mid, int right) {

    String s = "" + left + mid + right; //converts say 1, 0, 1 to 101, which is 5 in binary
    int binary_index = Integer.parseInt(s, 2);


    //need to reverse index as far left is 1 1 1 which is binary for 7
    return ruleset[binary_index];
  }
}
