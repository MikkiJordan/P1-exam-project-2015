class MenuPoint {  

  // pass by reference
  PVector _location; 
  PImage _picture; 
  int _tint1;
  int _tint2;

  // Constructor
  MenuPoint(PVector l, PImage p) { 
    _location = l; 
    _picture = p; 
    _tint1 = 255;
    _tint2 = 255;
  }

  // 
  void drawMenuPoint() {
    tint(_tint1, _tint2);
    image(_picture, _location.x, _location.y);
  }

  // When every button in the game is pressed, as certain sound should be played.
  boolean isPositionWithinButton(int x, int y) { 
    if (x > _location.x && x < _location.x+_picture.width && y > _location.y && y < _location.y+_picture.height) {
      type = "b";
      number = 6;
      sound.PlaySound();
    }
    
    return (x > _location.x && x < _location.x+_picture.width && y > _location.y && y < _location.y+_picture.height);
  }

  // Applying transparency to the opposite gender button selected.
  void addTint(int t1, int t2) {
    _tint1 = t1;
    _tint2 = t2;
  }
}