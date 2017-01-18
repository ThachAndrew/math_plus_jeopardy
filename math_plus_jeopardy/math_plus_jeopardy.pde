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
}

void keyPressed() {
  if (keyCode == 27) {
    // transition to menu
    key = 0;
    println ("escape hit");
    stage = STARTSCREEN; 
  }
  else
    println (key);
}
//FIXME: newlines in notepad vs vim
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