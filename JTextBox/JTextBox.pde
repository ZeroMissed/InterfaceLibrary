TextBox demoA = new TextBox(30, 250, 250, 100);
void setup() {
  background(255);
  size(500, 500);
}

void draw() {
  background(255);
  demoA.setColor(255, 255, 255); //sets color to red
  demoA.setTextColor(255, 0, 0); //sets color to green
  demoA.setOutlineColor(255, 0, 0); //sets color to green
  demoA.align(CENTER, CENTER); //draws text box from the middle 
  demoA.setVisible(true); //set the text box to visible REQUIRED
}
void keyPressed() {
  demoA.keyPressed();
}