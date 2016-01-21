class Plates {
  // Pass by reference
  int _x, _y, _r, _r2;

  // Constructor with properties of the invisible plate.
  Plates(int xTemp, int yTemp, int rTemp, int r2Temp) {
    _x = xTemp;
    _y = yTemp;
    _r = rTemp;
    _r2 = r2Temp;
  }

  //The plate will be shown with no fill, and stroke, to make it invisible.
  void ShowPlates() {
    noFill();
    noStroke();
    ellipse(_x, _y, _r, _r2);
  }
}