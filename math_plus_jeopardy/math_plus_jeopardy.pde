/*
 * Math Plus Jeopardy
 * Cabrillo College
 *
 * Status: not working
 */
boolean startUp = true;
Category[] column = new Category[4]; 
void setup() {
  fullScreen();
  background(0, 0, 120);
  loadQuestions();
}

void draw() {
  //intro screen
  if (startUp){
    textSize(100); fill(255,185,64); textAlign(CENTER);
    text("Math Plus Jeopardy!", width/2, height/2);
    text("Press any key to play", width/2, height/1.5);
    if(keyPressed || mousePressed) startUp = false;
  }else{
    drawBoard(); 
    //chooseQuestion();
  }
  
}
void loadQuestions(){
  String[] line;
  //try{
    line = loadStrings("questions.txt");
 // } catch (Exception e) {
   // println(e);
    //find a way to quit program
 // }
  for(int i = 0; i < 4; i++) //set up text file categories.
   column[i] = new Category(line[i+1]);

}
void drawBoard(){
   background(0, 0, 120);
}