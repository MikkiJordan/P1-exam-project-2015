class Foodlist {
  float x, y;
  boolean Selected;

  // Contructor
  Foodlist(int xTemp, float yTemp) {
    x = xTemp;
    y = yTemp;
  }

  // Custom method for drawing the object
  void display() {
    fill(255);
    ellipse(x, y, 20, 20);
  }

  void checkMouse() {
    if (mouseX > x - 20 && mouseX < x + 20 && mouseY >  y - 20 && mouseY < y + 20) {
      Selected = true;
    } else {
      Selected = false;
    }
  }
}