/* 
 * Math Plus Jeopardy
 * Cabrillo College
 *
 * Status: not working
 * @author Thach, Andrew
 */
PImage logo;
final int STARTSCREEN = 1, PLAY = 2, SETTINGS = 3;
int stage = STARTSCREEN;
Category[] column = new Category[4]; 
int COLUMNSIZE = 4, ROWSIZE = 6; 
color jeopardyBlue = color(0, 0, 120), jeopardyYellow = color(255, 185, 64);
void setup() {
  logo = loadImage("LOGO.png");
  fullScreen();
  loadQuestions();
}

void draw() {
  //intro screen
  if (stage == STARTSCREEN) 
    Menu();
   else 
  if (stage == PLAY)
    drawBoard(); 
   else
  if (stage == SETTINGS)
    Settings();
  
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
void Menu() {
  //Title Screen
  image(logo, 0, 0);
  background(jeopardyBlue);
  textSize(100);
  strokeWeight(0);
  fill(jeopardyYellow); 
  textAlign(CENTER, CENTER);
  text("JEOPARDY", width/2, height/5);
  image(logo, 50, 50);

  chooseOption();

  //Options
  fill(200);
  text("Play", width/2, height/3);
  text("Settings", width/2, height/2);
  text("Exit", width/2, height*.66);
}
int chooseOption(){
  //define hit-box for "play"
  if (mouseY < height/3 + 50 && mouseY > height/3 - 50) {
    fill(0, 0, 255, 100);
    rect(0, height/3 - 50, width, 100);
    if (mousePressed) stage = PLAY;
  }
  //define hit-box for "settings"
  if (mouseY < height/2 + 50 && mouseY > height/2 - 50) {
    fill(0, 0, 255, 100);
    rect(0, height/2 - 50, width, 100);
    if (mousePressed) stage = SETTINGS;
  }
  //define hit-box for "exit"
  if (mouseY < height*.66 + 50 && mouseY > height*.66 - 50) {
    fill(0, 0, 255, 100);
    rect(0, height*.66 - 50, width, 100);
    if (mousePressed) exit();
  }
  return stage;
}
void drawBoard() {
  background(jeopardyBlue);

  //fill in board with category topic and its questions
  column[0].drawCategory(0, 0);
  column[1].drawCategory(width*.25, 0);
  column[2].drawCategory(width*.5, 0);
  column[3].drawCategory(width*.75, 0);
}
void Settings(){
  background(jeopardyBlue);
  image(logo, 50, 50);
  textSize(100);
  text("Time Limit", width/2, height/8);
  textSize(30);
  text("100 points", width/4, height*.3);
  text("200 points", width/4, height*.4);
  text("300 points", width/4, height*.5);
  text("400 points", width/4, height*.6);
  text("500 points", width/4, height*.7);
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