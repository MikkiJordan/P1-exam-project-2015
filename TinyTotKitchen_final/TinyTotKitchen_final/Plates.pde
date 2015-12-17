class Plates {
  int _x, _y, _r, _r2;

  Plates(int xTemp, int yTemp, int rTemp, int r2Temp) {
    _x = xTemp;
    _y = yTemp;
    _r = rTemp;
    _r2 = r2Temp;
  }

  void ShowPlates() {
    noFill();
    noStroke();
    ellipse(_x, _y, _r, _r2);
  }
}