Button demoA = new Button(30, 75, 50, "Demo");
Button b = new Button(30, 75, 100, "Demo"); //establishes button's parameters (String textS

void setup() {
  size(500, 500); //sets size for the window
}

void draw() {
  background(255);
  demoA.setColor(0, 0, 0); //sets color to red
  demoA.setTextColor(0, 255, 0); //sets color to green
  demoA.setOutlineColor(0, 255, 0); //sets color to green
  demoA.align(CENTER, CENTER); //draws button from the middle 
  demoA.setText("hi"); //reset the button's text
  demoA.setVisible(true); //set the button to visible REQUIRED
  b.setVisible(true); //set the button to visible REQUIRED
  b.setColor(255, 0, 0);
}

void buttonActionPerformed(Button button) { //class that handles presses of buttons REQUIRED
  if(button == demoA)
  println("demoA");
  if(button == b)
  println("b");
}