/*
 * Math Plus Jeopardy
 * Cabrillo College
 *
 * Status: not working
 */
boolean startUp = true;
Category[] column = new Category[4]; 
int COLUMNSIZE = 4, ROWSIZE = 6; 
color jeopardyBlue = color(0, 0, 120), jeopardyYellow = color(255, 185, 64);
void setup() {
  fullScreen();
  background(jeopardyBlue);
  loadQuestions();
}

void draw() {
  //intro screen
  if (startUp) {
    drawMenu();
    //chooseOption();
  } else {
    drawBoard(); 
    //chooseQuestion();
  }
}
//known issue: newlines in notepad vs vim
void loadQuestions() {
  String[] line;
  //try {
  line = loadStrings("questions.txt");
  // } 
  // catch (Exception e) {
  //   line = null;
  //   println(e);
  //   exit();
  //find a way to quit program
  //  }
  for (int i = 0; i < 4; i++) //set up text file categories.
    column[i] = new Category(line[i+1]);
}
void drawMenu() {
  textSize(100); 
  fill(jeopardyYellow); 
  textAlign(CENTER);
  text("Math Plus Jeopardy!", width/2, height/2);
  text("Press any key to play", width/2, height/1.5);
  if (keyPressed || mousePressed) startUp = false;
}
void drawBoard() {
  background(jeopardyBlue);

  //fill in board with category topic and its questions
  column[0].drawCategory(0, 0);
  column[1].drawCategory(width*.25, 0);
  column[2].drawCategory(width*.5, 0);
  column[3].drawCategory(width*.75, 0);
}