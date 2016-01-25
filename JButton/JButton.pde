String ab = "Demo";
String bc = "";
Button a = new Button(30, 75, 50, ab);
Button b = new Button(30, 75, 100, bc); //establishes button's parameters (String textS

void setup() {
  size(500, 500); //sets size for the window
}

void draw() {
  background(255);
  a.setColor(0, 255, 0); //sets color to red
  a.setTextColor(0, 255, 0); //sets color to green
  a.setOutlineColor(0, 255, 0); //sets color to green
  a.align(CENTER, CENTER); //draws button from the middle 
  a.setText("hi"); //reset the button's text
  a.setVisible(true); //set the button to visible REQUIRED
  b.setVisible(true); //set the button to visible REQUIRED
}

void buttonActionPerformed(Button button) { //class that handles presses of buttons REQUIRED
  if(button == a)
  println(ab);
  if(button == b)
  println(bc);
}