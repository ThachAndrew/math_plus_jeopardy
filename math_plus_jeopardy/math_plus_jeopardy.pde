/* 
 * Math Plus Jeopardy
 * Cabrillo College
 *
 * Status: not working
 * @author Thach, Andrew
 */
boolean startUp = true;
Category[] column = new Category[4]; 
int COLUMNSIZE = 4, ROWSIZE = 6; 
color jeopardyBlue = color(0, 0, 120), jeopardyYellow = color(255, 185, 64);
void setup() {
  fullScreen();
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
  try {
    line = loadStrings("questions.txt");
    for (int i = 0; i < 4; i++) //set up text file categories.
      column[i] = new Category(line[i+1]);
  } 
  catch (Exception e) {
    line = null;
    println(e);
    fill(255,0,0);
    //text("Error loading questions!", width/2, height*.75);
    exit(); delay(400);
    //FIXME: display error to sketch, then exit
  }
}
void drawMenu() {
  
  background(jeopardyBlue);
  textSize(100); 
  fill(jeopardyYellow); 
  textAlign(CENTER, CENTER);
  text("Math Plus Jeopardy!", width/2, height/5);

  ////////////////////////////
  //Interactive Menu Buttons//
  ////////////////////////////
  
  //define hit-box for "play"
  if (mouseY < height/3 + 50 && mouseY > height/3 - 50) {
    fill(0, 0, 255, 100);
    rect(0, height/3 - 50, width, 100);
    if (mousePressed) startUp = false;
  }
  //define hit-box for "settings"
  if (mouseY < height/2 + 50 && mouseY > height/2 - 50) {
    fill(0, 0, 255, 100);
    rect(0, height/2 - 50, width, 100);
    //if (mousePressed) ;
  }
  //define hit-box for "exit"
  if (mouseY < height*.66 + 50 && mouseY > height*.66 - 50) {
    fill(0, 0, 255, 100);
    rect(0, height*.66 - 50, width, 100);
    if (mousePressed) exit();
  }
  fill(200);
  text("Play", width/2, height/3);
  text("Settings", width/2, height/2);
  text("Exit", width/2, height*.66);
}
void drawBoard() {
  background(jeopardyBlue);

  //fill in board with category topic and its questions
  column[0].drawCategory(0, 0);
  column[1].drawCategory(width*.25, 0);
  column[2].drawCategory(width*.5, 0);
  column[3].drawCategory(width*.75, 0);
  
  //Shortcut to go back to main menu
  
}
void keyPressed() {
  if (keyCode == 27) {
    // leave game
    // transition to menu
    key = 0;
    println ("escape hit");
    startUp = true; 
  }
  else
    println (key);
}