int[] cells, next_cells, ruleset;
int w;
int generation = 0;


void setup() {
  size(1280, 640);
  stroke(0);

  w = 10;

  cells = new int[width/w];
  cells[cells.length/2] = 1; //set mid cell to on
  ruleset = new int[]{0, 1, 0, 1, 1, 0, 1, 0}; //far left is on on on, far right in off off off
}


void draw() {

  for (int i = 0; i < cells.length; i++) {

    int colour = (cells[i] == 0) ? 255 : 0;
    fill(colour);
    rect(i * w, generation * w, w, w);
  }

  if(generation < height/w) generate();
}

void generate() {
  next_cells = new int[cells.length];
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
  //print(ruleset[binary_index]);
  return ruleset[binary_index];

}


//array that holds states
//way of displaying states
//determine neighbours
//apply rules function to these
//write the ruleset and rules function
// 0 0 0 = 0 binary, 0 0 1 = 1 binary
