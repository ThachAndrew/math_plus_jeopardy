//Interactive menu screen

PImage logo;
final int COLUMNSIZE = 4, ROWSIZE = 6; 
color jeopardyBlue = color(0, 0, 120), jeopardyYellow = color(255, 185, 64);

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

 //fill in board with squares
  for(int i = 0; i < COLUMNSIZE; i++)
    for(int j = 0; j < ROWSIZE; j++)
      board[i][j].drawSquare();
  
  
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
  text("To edit category and questions, edit the textfiles: ", width/4, height*.9);
}