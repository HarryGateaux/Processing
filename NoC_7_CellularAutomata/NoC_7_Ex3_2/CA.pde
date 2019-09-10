import java.util.Random;

class CA {
  int[] cells, ruleset;
  ArrayList<int[]> history;
  int w;
  int generation = 0;

  CA() {
    w = 10;
    cells = new int[width/w];
    history = new ArrayList<int[]>();
    cells[cells.length/2] = 1; //set mid cell to on
    history.add(cells); //set first row of history to starting cells
    ruleset = new int[]{0, 1, 1, 0, 0, 0, 1, 0}; //far left is on on on, far right in off off off
  }

  void display() {
    for (int j = 0; j < history.size(); j++) {
      for (int i = 0; i < history.get(j).length; i++) {

        
        //this sets the alpha of a cell proportional to the number of filled cells above it in the page
        int sum = 0;
        for (int k = 0; k < j; k++) {
          sum += history.get(k)[i];
        }
        
        
        int colour = (history.get(j)[i] == 0) ? 255 : 0;
        float alph = map(sum, 0, height/w, 150, 255);
        fill(colour, alph);
        rect(i * w, j * w, w, w);
      }
    }

    if (generation < height/w) {
      generate();
    } else { 
      generate(); 
      //creates the scrolling history
      history.remove(0);
    }
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
    history.add(next_cells);
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
