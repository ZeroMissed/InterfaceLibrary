
Button a = new Button(30, 75, 50, "heHe hehe");
Button b = new Button(30, 75, 100, "hELLO everyBody");


void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  a.setVisible(true);
  b.setVisible(true);
}

void buttonActionPerformed(String buttonText) {
  if(buttonText.equalsIgnoreCase("hehe hehe"))
  println("hehehehe");
  if(buttonText.equalsIgnoreCase("hello everybody"))
  println("hello");
}