String ab = "tWENTy oNe";
String bc = "qUE sOn ESOS";
Button a = new Button(30, 75, 50, ab);
Button b = new Button(30, 75, 100, bc);


void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  a.align("","");
  b.align("","");
  a.setVisible(true);
  b.setVisible(true);
}

void buttonActionPerformed(String buttonText) {
  if(buttonText.equalsIgnoreCase(ab))
  println(ab);
  if(buttonText.equalsIgnoreCase(bc))
  println(bc);
}