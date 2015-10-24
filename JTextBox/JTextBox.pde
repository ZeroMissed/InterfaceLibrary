int xLoc = 100;
int yLoc = 100; 
int bWidth = 300;
int charLength = 0;
int maxL = 20;
int noise = -8;
int tSize = 30;
int textY;
boolean shift = false;
String wordCrude[], wordFinal[], combS;
char lastPressed;

void setup() {
  wordCrude = new String[maxL];
  size(500, 500);
}


void draw() {
  background(255);//joins the string array back into one string
  textSize(tSize); //sets textSize to user input
  rect(xLoc, yLoc, bWidth, tSize + (tSize/4), tSize/4); //creates a rounded rect() around the text
  pushMatrix(); //saves current xy plane
  translate(xLoc + tSize/6, yLoc + tSize/2); //makes the left, middle of the rect the origin of the xy plane
  fill(0); //sets fill to black
  textAlign(LEFT, CENTER); //sets text x to left and center of the rect()
  if(!(frameCount <=1))
  text(combS, 0, textY); //writes text at origin(the left, middle of rect())
  fill(255); //sets fill back to white
  popMatrix(); //reverts to previously saved xy plane


  for (int i = 0; i < wordCrude.length; i++) {
    if (wordCrude[i] == null) {
      charLength = i;
      wordFinal = new String[charLength];
      break;
    }
  }
  for (int i = 0; i < charLength; i++) {
    wordFinal[i] = wordCrude[i];
  }
  combS = join(wordFinal, "");
}

void keyPressed() {
  if (wordFinal.length <= 100) {
    if (frameCount == 1)
      wordCrude[0] = String.valueOf(key);
    else {
      if (noise == 0 || !(lastPressed == key)) {
        wordCrude[charLength] = String.valueOf(key);
        if (key == BACKSPACE || key == RETURN || key == ENTER || key == CODED) {
          wordCrude[charLength] = null;
          if (charLength >= 1 && key == BACKSPACE)
            wordCrude[charLength - 1] = null;
        }
        noise = -10;
      } else 
      noise++;
    }
  }
}
/*
class TextBox {
  private int xLoc, yLoc, bWidth, tSize, xMult, maxL;
  private String word[], combS;

  TextBox(int xLoc, int yLoc, int bWidth, int tSize, int maxL) {
    this.tSize = tSize;
    this.bWidth = bWidth;
    this.xLoc = xLoc;
    this.yLoc = yLoc;
    this.maxL = maxL;
    this.word = new String[maxL];
  }
  void setVisible(boolean tf) {
    if (keyPressed)
      word[combS.length() + 1] = String.valueOf(key);
     
}
}
*/