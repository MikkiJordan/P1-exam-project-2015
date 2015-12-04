class Foodlist {
  float _x, _y, _r, _originX, _originY ;
  boolean Selected, AssignValue = false;
  float r = random(255);
  float g = random(255);
  float b = random(255);

  // Contructor
  Foodlist(int xTemp, float yTemp, int rTemp) {
    _x = xTemp;
    _y = yTemp;
    _r = rTemp;
    _originX = _x;
    _originY = _y;
  }

  // Custom method for drawing the object
  void display() {
    fill(r, g, b, 255);
    stroke(0);
    ellipse(_x, _y, _r, _r);
  }

  void checkMouse() {
    if (mouseX > _x - _r && mouseX < _x + _r && mouseY >  _y - _r && mouseY < _y + _r) {
      Selected = true;
    } else {
      Selected = false;
    }
  }

  boolean CheckCollusion() {
    if ( _x > plate._x - 40  && _x < plate._x + plate._r/2 && _y > plate._y - 30 && _y < plate._y - plate._r2 + 10 ) {
      println("Dish is placed on plate 1");
      return true;
    }

    if (_x > plate2._x - 45 && _x < plate2._x + plate2._r/2 && _y > plate2._y - 30 && _y < plate2._y - plate2._r2 + 10 ) {    
      println("Dish is placed on plate 2");
      return true;
    }

    if ( _x > plate3._x - 40 && _x < plate3._x + plate3._r/2  && _y > plate3._y - 30 && _y < plate3._y - plate3._r2 + 10) {    
      println("Dish is placed on plate 3");
      return true;
    }

    if (_x > plate4._x - 45 && _x < plate4._x + plate4._r/2 && _y > plate4._y - 30 && _y < plate4._y - plate4._r2 + 10 ) {    
      println("Dish is placed on plate 4");
      return true;
    }
    return false;
  }
}