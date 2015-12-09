class Foodlist {
  float _x, _y, _r, _originX, _originY ;
  boolean Selected, FoodPlaced;
  int _FoodChoice;
  String _Type;
  PImage WrongAnswer = loadImage("WrongChoiceX.png"), CorrectAnswer = loadImage("CorrectChoice.png"), Food;

  // Contructor
  Foodlist(int xTemp, float yTemp, int FoodIdentificationNumber, String FoodType) {
    _x = xTemp;
    _y = yTemp;
    _originX = _x;
    _originY = _y;
    _FoodChoice = FoodIdentificationNumber;
    _Type = FoodType;
    Food = loadImage(_Type + FoodNumberPicked + ".png");
  }

  // Custom method for drawing the object
  void display() {

    image(Food, _x, _y);
  }

  void checkMouse() {
    if (MousePressed == false) {
      if (mouseX > _x && mouseX < _x + Food.width && mouseY >  _y  && mouseY < _y + Food.height) {
        Selected = true;
      } else {
        Selected = false;
      }
    }
  }


  void Answer() {
    // This actually works O.O  
    if (_Type == "u" && StartChewing == true) {
      WrongAnswer.resize(50, 50);
      if (EatClicked == true && _Type == "u") {
        health.Player_TotalHealth -= health.Player_DamageTaken;
        EatClicked = false;
      }
      image(WrongAnswer, _x-5, _y-10);
    } 

    if (_Type == "h" && StartChewing == true) {
      CorrectAnswer.resize(40, 40); // hmmmm
      if (EatClicked == true && _Type == "h") {
        health.Player_TotalHealth += health.Player_DamageTaken;
        EatClicked = false;
      }
      image(CorrectAnswer, _x-5, _y-10);
    }
  }

  boolean CheckCollusion() {
    if ( _x > plate._x - 40  && _x < plate._x + plate._r/2 && _y > plate._y - 30 && _y < plate._y - plate._r2 + 10 ) {
      println("Dish is placed on plate 1");
      if (FoodPlaced == false)
        PlayPlateSound();
      Answer();
      // Make boolean list

      return true;
    }
    /*
    if (_x > plate2._x - 45 && _x < plate2._x + plate2._r/2 && _y > plate2._y - 30 && _y < plate2._y - plate2._r2 + 10 ) {    
     println("Dish is placed on plate 2");
     if (FoodPlaced == false)
     PlayPlateSound();
     Answer();
     return true;
     }
     
     if ( _x > plate3._x - 40 && _x < plate3._x + plate3._r/2  && _y > plate3._y - 30 && _y < plate3._y - plate3._r2 + 10) {    
     println("Dish is placed on plate 3");
     if (FoodPlaced == false)
     PlayPlateSound();
     Answer();
     return true;
     }
     
     if (_x > plate4._x - 45 && _x < plate4._x + plate4._r/2 && _y > plate4._y - 30 && _y < plate4._y - plate4._r2 + 10 ) {    
     println("Dish is placed on plate 4");
     if (FoodPlaced == false)
     PlayPlateSound();
     Answer();
     return true;
     }*/

    FoodPlaced = false;
    return false;
  }

  void PlayPlateSound() {
    if (FoodPlaced == false) {
      type = "p";
      number = (int) random(1, 7);
      sound.PlaySound();
      FoodPlaced = true;
    }
  }
}