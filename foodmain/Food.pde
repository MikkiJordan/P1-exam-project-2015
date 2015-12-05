class Food{
  boolean _healthy;
  PVector _location;
  boolean _eaten;
  PImage _picture;
  
  Food(PVector loc, PImage pic, boolean health){
    _location = loc;
    _picture = pic;
    _healthy = health;
    _eaten = false;
  }
  
  void drawFood(){
    if (!_eaten){
      image(_picture, _location.x, _location.y);
    }
  }
  
  void eat(){
    _eaten = true;
  }
  
}