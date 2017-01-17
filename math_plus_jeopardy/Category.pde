class Category {
  String topic;
  String[] questions = new String[5];

  Category() {
    topic = "";
  }
  Category(String str) {
    //wrap text if num chars exceed 12
    if (str.length() > 12){
      String[] newStr = split(str, " ");
      if(newStr[0].length() > 12)
        newStr[0] += "\n";
      else
        newStr[1] += "\n";
      str = join(newStr, " ");  
    }
     topic = str;
  }
  void drawCategory(float x, float y) {
    strokeWeight(10); 
    textSize(50); 
    textAlign(CENTER, CENTER);

    fill(jeopardyBlue);
    rect(x, y, width/4, height/5); 
    fill(jeopardyYellow);
    text(topic, x+width/8, y+height/10);
  }
};