public class TextBox {
  private String wordCrude[], wordFinal[], combS;
  private int tSize, oxLoc, oyLoc, xLoc, yLoc, rectRadius, charLength, br, bg, bb, tr, tg, tb, or, og, ob, cursorInterval;
  private float bHeight, bWidth;

  public TextBox(int tSize, int oxLoc, int oyLoc, int bWidth) {
    this.bWidth = bWidth;
    this.oxLoc = oxLoc;
    this.oyLoc = oyLoc;
    this.xLoc = oxLoc;
    this.yLoc = oyLoc;
    this.tSize = tSize;
    this.rectRadius = tSize/4;      
    wordCrude = new String[100];
  }

  void setVisible(boolean tf) {
    pushStyle();
    background(255);
    if (tf) {
      bHeight = tSize + (tSize/4);
      textSize(tSize); //sets textSize to user input

      if (!(br == 255)||!(bg == 255)||!(bb == 255))
        fill(br, bg, bb);
      if (!(or == 0)||!(og == 0)||!(ob == 0))
        stroke(or, og, ob);

      rect(xLoc, yLoc, bWidth, tSize + (tSize/4), rectRadius); //creates a rect() around the text

      pushMatrix(); //saves current xy plane
      translate(xLoc + tSize/6, yLoc + tSize/2); //makes the left, middle of the rect the origin of the xy plane
      fill(0); //sets fill to black
      textAlign(LEFT, CENTER); //sets text x to left and center of the rect()
      if (!(tr == 0)||!(tg == 0)||!(tb == 0))
        fill(tr, tg, tb);
      if (!(frameCount <=1))
        text(combS, 0, 0); //writes text at origin(the left, middle of rect())
      fill(255); //sets fill back to white
      popMatrix(); //reverts to previously saved xy plane
      charLength = 0;
      for (int i = 0; i < wordCrude.length; i++) {
        if (!(wordCrude[i] == null))
          charLength++;
      }
      wordFinal = new String[charLength];
      for (int i = 0; i < charLength; i++) {
        wordFinal[i] = wordCrude[i];
      }
      combS = join(wordFinal, ""); //joins the string array back into one string
      this.cursor();
    }
    popStyle();
  }

  void keyPressed() {
    println("hi");
    if (!(wordCrude.length == charLength)) {
      wordCrude[wordFinal.length] = String.valueOf(key);

      if (key == BACKSPACE || key == RETURN || key == ENTER || key == CODED) 
        if (!(wordCrude.length == charLength)) 
          wordCrude[wordFinal.length] = null;
    }
    if (wordFinal.length >= 1 && key == BACKSPACE)
      wordCrude[wordFinal.length - 1] = null;
  }

  void setColor(int r, int g, int b) {
    this.br = r;
    this.bg = g;
    this.bb = b;
  }

  void setTextColor(int r, int g, int b) {
    this.tr = r;
    this.tg = g;
    this.tb = b;
  }

  void setOutlineColor(int r, int g, int b) {
    this.or = r;
    this.og = g;
    this.ob = b;
  }

  void cursor() {
    float cursorXLoc = textWidth(combS) + xLoc + tSize/6 + 2;
    if (cursorInterval <= 25) {
      line(cursorXLoc, yLoc + 5, cursorXLoc, yLoc + tSize);
    } else if(cursorInterval == 50) {
      cursorInterval = 0;
    }
        
    cursorInterval++;
  }

  void setLoc(int x, int y) {
    oxLoc = x;
    oyLoc = y;
  }

  void setWidth(int w) {
    bWidth = w;
  }

  void setRectRadius(int radius) { //set to zero for square
    rectRadius = radius;
  }

  void align(int x, int y) {
    if (x == LEFT)
      xLoc = oxLoc;
    if (x == CENTER)
      xLoc = int(oxLoc - bWidth/2);
    if (x == RIGHT)
      xLoc = int(oxLoc - bWidth);

    if (y == TOP)
      yLoc = oyLoc;
    if (y == CENTER)
      yLoc = int(oyLoc - bHeight/2);
    if (y == BOTTOM)
      yLoc = int(oyLoc - bHeight);
  }
}