/* 
 * Math Plus Jeopardy
 * Cabrillo College
 *
 * Status: not working
 * @author Thach, Andrew
 * @version 0.05
 */
final int STARTSCREEN = 1, PLAY = 2, SETTINGS = 3;
int stage = STARTSCREEN;

void setup() {
  //FIXME: try catch
  logo = loadImage("LOGO.png");
  fullScreen();
  loadQuestions();
}

void draw() {
  //Main Menu GUI
  if (stage == STARTSCREEN) 
    Menu();
  else 
  if (stage == PLAY) {
    drawBoard(); 
    chooseQuestion();
  } else
    if (stage == SETTINGS)
      Settings();
}

void keyPressed() {
  if (keyCode == 27) {
    // transition to menu
    key = 0;
    println ("escape hit");
    stage = STARTSCREEN;
  } else
    println (key);
}
//Creates "square objects", storing category and its questions(including point vals)
//FIXME: newlines in notepad vs vim, magic number dimensions
Square[][] board = new Square[4][6]; 
void loadQuestions() {
  String[] line;
  try {
    line = loadStrings("categories.txt");
    //set text file categories
    for (int i = 0; i < COLUMNSIZE; i++) 
      board[i][0] = new Square(width/COLUMNSIZE*i, 0, line[i+1]);

    //FIXME: combine loops, check bounds (if text file is empty)
    //set questions and point val.
    String[] questions = loadStrings("category1questions.txt");
    for (int j = 1; j < ROWSIZE; j++)  //FIXME: combine all for loops
      board[0][j] = new Square(width/COLUMNSIZE*0, height/ROWSIZE*j, j*100, questions[j-1]);
    questions = loadStrings("category2questions.txt");
    for (int j = 1; j < ROWSIZE; j++)  //FIXME: combine all for loops
      board[1][j] = new Square(width/COLUMNSIZE*1, height/ROWSIZE*j, j*100, questions[j-1]);
    questions = loadStrings("category3questions.txt");
    for (int j = 1; j < ROWSIZE; j++)  //FIXME: combine all for loops
      board[2][j] = new Square(width/COLUMNSIZE*2, height/ROWSIZE*j, j*100, questions[j-1]);
    questions = loadStrings("category4questions.txt");
    for (int j = 1; j < ROWSIZE; j++)  //FIXME: combine all for loops
      board[3][j] = new Square(width/COLUMNSIZE*3, height/ROWSIZE*j, j*100, questions[j-1]);
  } 
  catch (Exception e) {
    println("Error loading categories or questions");
    line = null;
    println(e);
    fill(255, 0, 0);
    //text("Error loading questions!", width/2, height*.75);
    exit(); 
    delay(400);
    //FIXME: display error to sketch, then exit
  }
}