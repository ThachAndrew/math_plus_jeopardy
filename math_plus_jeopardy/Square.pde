//Struct-like object: contains question, point value, and pos
//Category squares only have text and pos


class Square {
  String textBox;
  int pointVal;
  int xPos, yPos;


  Square() {
    pointVal = 0;
    textBox = "";
    xPos = yPos = 0;
  }
  //constructor for category squares
  Square(int x, int y, String str) {
    xPos = x;
    yPos = y;
    pointVal = 0;
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
    //FIXME: insert a more efficient text wrap
    textBox = str;
  }
  void drawSquare() {
    //draw box and topic
    strokeWeight(10); 
    textSize(50); 
    textAlign(CENTER, CENTER);
    fill(jeopardyBlue);
    rect(xPos, yPos, width/COLUMNSIZE, height/ROWSIZE);
    fill(jeopardyYellow);            //puts text in center of box
    if (pointVal == 0)
      text(textBox, xPos+width/(COLUMNSIZE*2), yPos+height/(ROWSIZE*2));
    else
      text(pointVal, xPos+width/(COLUMNSIZE*2), yPos+height/(ROWSIZE*2));
  }
};