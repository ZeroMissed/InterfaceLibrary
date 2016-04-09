class Button {
  private String in, out, word[];
  private int tSize, oxLoc, oyLoc, xLoc, yLoc, preventNoise, br, bg, bb, tr, tg, tb, or, og, ob;
  private float bHeight, bWidth;
  private boolean noHLClick, noHLHover; // don't highlight button on click or on hover

  Button(int tSize, int oxLoc, int oyLoc, String in) {
    this.in = in.toLowerCase(); //set the text input to lower case
    this.tSize = tSize;
    this.oxLoc = oxLoc;
    this.oyLoc = oyLoc;
    this.xLoc = oxLoc;
    this.yLoc = oyLoc;
  }

  void setVisible(boolean tf) {
    pushStyle();
    if (tf) {
      word = new String[in.length()];
      //assigns the value of each char to a String array to add proper capitalization
      for (int i = 0; i < in.length(); i++) {
        word[i] = String.valueOf(in.charAt(i));
        //sets the char after a space to capital
        if (i > 0)
          if (word[i - 1].equals(" ")) {
            word[i] = word[i].toUpperCase();
          }
      }
      word[0] = word[0].toUpperCase(); //sets first letter in the input string to capital
      out = join(word, ""); //joins the string array back into one string

      textSize(tSize);
      bHeight = tSize + (tSize/4); //sets the button's height based on the text size
      bWidth = textWidth(out) + 20; //sets the button's witdh based on the xMult and the length of the string
      if (!(br == 0)||!(bg == 0)||!(bb == 0))
        fill(br, bg, bb);
      if (!(or == 0)||!(og == 0)||!(ob == 0))
        stroke(or, og, ob);
      rect(xLoc, yLoc, bWidth, bHeight, tSize/4); //creates a rounded rect() around the text
      
      if (mouseX < xLoc + bWidth && mouseX > xLoc && mouseY < yLoc +  tSize + (tSize/4) && mouseY > yLoc) {
        if (!noHLHover) {
          fill(0, 50); //sets fill to transparent black
          rect(xLoc, yLoc, bWidth, bHeight, tSize/4); //creates a transparent black rounded rect() over the button
        }
        if (mousePressed){
          if (!noHLClick)
            rect(xLoc, yLoc, bWidth, bHeight, tSize/4); //creates a transparent black rounded rect() over the button
        if (preventNoise == 0) {
          buttonActionPerformed(this);
          preventNoise = -8;
        } else if (preventNoise < 0) 
          preventNoise++;
        }
      }

      pushMatrix(); //pushes current xy plane
      translate(xLoc + bWidth/2, yLoc + tSize/2); //makes the middle of the rect the origin of the xy plane
      textAlign(CENTER, CENTER); //sets text to center around the point inputed in the text()
      fill(0); //sets the fill to black
      if (!(tr == 0)||!(tg == 0)||!(tb == 0))
        fill(tr, tg, tb);
      text(out, 0, 0); //writes text at origin
      popMatrix(); //reverts to previously pushed xy plane
    }
    popStyle();
  }

  void setLoc(int x, int y) {
    oxLoc = x;
    oyLoc = y;
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

  void noHighlightOnHover() {
    noHLHover = true;
  }

  void noHighlightOnClick() {
    noHLClick = true;
  }
  void setText(String text) {
    if(!text.equalsIgnoreCase(""))
    in = text;
  }
  void setTextSize(int size) {
    this.tSize = size;
  }
}