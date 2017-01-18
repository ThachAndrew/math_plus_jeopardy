/*
 * Data structure: stores topic and its questions
 */
class Category {
  String topic;
  String[] questions = new String[5];

  Category() {
    topic = "";
  }
  Category(String str) {
    //wrap text if num chars exceed 12
    if (str.length() > 12) {
      String[] newStr = split(str, " ");
      if (newStr[0].length() > 12)
        newStr[0] += "\n";
      else
        newStr[1] += "\n";
      str = join(newStr, " ");
    }
    topic = str;
  }
  void drawCategory(float x, float y) {
    //draw box and topic
    strokeWeight(10); 
    textSize(50); 
    textAlign(CENTER, CENTER);
    fill(jeopardyBlue);
    rect(x, y, width/COLUMNSIZE, height/ROWSIZE); 
    fill(jeopardyYellow);            //puts text in center of box
    text(topic, x+width/(COLUMNSIZE*2), y+height/(ROWSIZE*2));
    //draw point-value boxes
    drawQuestions(x);
  }
  void drawQuestions(float xPos) {
          //avoid integer division
    for (float i = 1; i < ROWSIZE; i++){
      float yPos = height * (i/ROWSIZE);
      fill(jeopardyBlue);
      rect(xPos, yPos, width/4, height/ROWSIZE);
      //insert point value
      fill(jeopardyYellow); textSize(70);
      text(int(i * 100), xPos+width/(COLUMNSIZE*2), yPos+height/(ROWSIZE*2));
    }
  }
};