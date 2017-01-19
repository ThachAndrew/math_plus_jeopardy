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
  if (stage == PLAY)
    drawBoard(); 
  else
    if (stage == SETTINGS)
      Settings();
  
   
   //print object data
   for(int i = 0; i < COLUMNSIZE; i++)
      for(int j = 0; j < ROWSIZE; j++)  //FIXME: combine all for loops
        println("pos: "+ i + ", " + j + "--" + board[i][j].textBox);
  
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
  //board = new Square[COLUMNSIZE];
  String[] line;
  //board = new Square[COLUMNSIZE]; 
  try {
    line = loadStrings("categories.txt");
    //set text file categories
    for (int i = 0; i < COLUMNSIZE; i++) 
      board[i][0] = new Square(width/COLUMNSIZE*i, 0, line[i+1]);
    
    //set questions and point val.
     String[] questions = loadStrings("category1questions.txt");
    for(int i = 0; i < COLUMNSIZE; i++)
      for(int j = 1; j < ROWSIZE; j++)  //FIXME: combine all for loops
        board[i][j] = new Square(width/COLUMNSIZE*i, height/ROWSIZE*j, j*100, questions[j-1]);
   
  /* 
    for(int i = 1; i <= ROWSIZE; i++)
      board[0][i] = questions[i-1];
    */
  } 
  catch (Exception e) {
    line = null;
    println(e);
    fill(255, 0, 0);
    //text("Error loading questions!", width/2, height*.75);
    exit(); 
    delay(400);
    //FIXME: display error to sketch, then exit
  }
}