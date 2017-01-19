//Struct-like object: contains question, point value, and pos
//Category squares only have text and pos

class Square {
  String textBox;
  int pointVal;
  int xPos, yPos;
  boolean answered;
  
  Square() {
    pointVal = 0;
    textBox = "";
    xPos = yPos = 0;
    answered = false;
  }
  //constructor for category squares
  Square(int x, int y, String str) {
    xPos = x;
    yPos = y;
    pointVal = 0;
    answered = false;
    //wraps text with newlines
    if (str.length() > 12) {
      String[] newStr = split(str, " ");
      if (newStr[0].length() > 12)
        newStr[0] += "\n";
      else
        newStr[1] += "\n";
      str = join(newStr, " ");
    }
    textBox = str;
  }
  //constructor for questions
  Square(int x, int y, int val, String str) {
    xPos = x;
    yPos = y;
    pointVal = val;
    answered = false;
    if (str.length() > 9) {
      String[] newStr = split(str, " ");
      if (newStr[0].length() > 9)
        newStr[0] += "\n";
      else
        newStr[1] += "\n";
      str = join(newStr, " ");
    }
    //FIXME: insert a more efficient text wrap
    textBox = str;
  }
  void drawSquare() {
    //draw box and topic
    strokeWeight(10); 
    textSize(70); 
    textAlign(CENTER, CENTER);
    fill(jeopardyBlue);
    rect(xPos, yPos, width/COLUMNSIZE, height/ROWSIZE);
    if(answered) return;
    fill(jeopardyYellow);            //puts text in center of box
    if (pointVal == 0)
      text(textBox, xPos+width/(COLUMNSIZE*2), yPos+height/(ROWSIZE*2));
    else
      text(pointVal, xPos+width/(COLUMNSIZE*2), yPos+height/(ROWSIZE*2));
  }
  //FIXME: inheritance to children
  void displayText(){
     background(jeopardyBlue);
     fill(255);
     textSize(200);
     text(textBox, width/2, height/2);
  }
};