class Button {
  private String in, out;
  private int xMult, tSize, xLoc, yLoc, preventNoise;
  private String word[];

  Button(int tSize, int xLoc, int yLoc, String in) {
    this.in = in.toLowerCase(); //set the text input to lower case
    this.tSize = tSize;
    this.xMult = (2 * tSize)/3;
    this.xLoc = xLoc;
    this.yLoc = yLoc;
    this.word = new String[in.length()];
  }

  void setVisible(boolean tf) {
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
    textSize(tSize); //sets textSize to user input
    rect(xLoc, yLoc, xMult * out.length(), tSize + (tSize/4), tSize/4); //creates a rounded rect() around the text
    pushMatrix(); //pushes current xy plane
    translate(xLoc + (xMult * out.length())/2, yLoc + tSize/2); //makes the middle of the rect the origin of the xy plane
    fill(0); //sets fill to black
    textAlign(CENTER, CENTER); //sets text to center around the point inputed in the text()
    text(out, 0, 0); //writes text at origin
    fill(255); //sets fill back to white
    popMatrix(); //reverts to previously pushed xy plane

    if (mousePressed)    
      if (mouseX < xLoc + xMult * out.length() && mouseX > xLoc && mouseY < yLoc +  tSize + (tSize/4) && mouseY > yLoc)
        if (preventNoise == 0) {
          buttonActionPerformed(out);
          preventNoise = -8;
        } else if (preventNoise < 0) preventNoise++;
  }
}