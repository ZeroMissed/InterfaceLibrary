int xLoc = 50;
int yLoc = 100; 
int bWidth = 300;
int maxL = 10;
int tSize = 30;
int nullFound;
int charLength;
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
  if (!(frameCount <=1))
    text(combS, 0, 0); //writes text at origin(the left, middle of rect())
  fill(255); //sets fill back to white
  popMatrix(); //reverts to previously saved xy plane
  charLength = 0;
  for (int i = 0; i < wordCrude.length; i++) {
    if(!(wordCrude[i] == null))
      charLength++;
  }
  wordFinal = new String[charLength];
  for (int i = 0; i < charLength; i++) {
        wordFinal[i] = wordCrude[i];
    println("copying.." + wordCrude[i]);
    print("crude ");
    println(wordCrude);
    print("refined ");
    println(wordFinal);

  }
  
  
  combS = join(wordFinal, "");
}

void keyPressed() {
    if(!(wordCrude.length == charLength))
    wordCrude[wordFinal.length] = String.valueOf(key);
    println(wordCrude);
    println(wordFinal);
    if (key == BACKSPACE || key == RETURN || key == ENTER || key == CODED) {
      wordCrude[wordFinal.length] = null;
      if (wordFinal.length >= 1 && key == BACKSPACE)
        wordCrude[wordFinal.length - 1] = null;
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
 
 if (!(wordCrude[0] == null) && wordCrude.length == 1)
 i = 1;
 
 }
 }
 */