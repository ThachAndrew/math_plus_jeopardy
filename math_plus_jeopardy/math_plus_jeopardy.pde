/*
 * Math Plus Jeopardy
 * Cabrillo College
 *
 * Status: not working
 */
void setup() {
  fullScreen();
  background(0, 0, 200);
}

boolean startUp = true;
void draw() {
  if (startUp){
    textSize(100); fill(255,195,0); textAlign(CENTER);
    text("Math Plus Jeopardy!", width/2, height/2);
  }
  
}