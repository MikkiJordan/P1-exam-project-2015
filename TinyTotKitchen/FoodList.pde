class Foodlist {
  float _x, _y, _r, _originX, _originY ;
  boolean Selected, FoodPlaced;
  int _FoodChoice;
  String _Type;
  PImage WrongAnswer = loadImage("WrongChoiceX.png"), CorrectAnswer = loadImage("CorrectChoice.png"), Food;

  String name = "Disgusted";
  String name2 = "Giggling";

  int DisgustedGigglingFrame = 1; 
  int repeats = 1;

  // Contructor
  Foodlist(int xTemp, float yTemp, int FoodNumberPicked, String FoodType) {
    _x = xTemp;
    _y = yTemp;
    _originX = _x;
    _originY = _y;
    _Type = FoodType;
    _FoodChoice = FoodNumberPicked;
    Food = loadImage(_Type + _FoodChoice + ".png");
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


  void FoodReaction() {
    if (ChewingAnimationFinished == true && health.YouWonYouLost == false) {
      if (_Type == "u")
        health.Sequence = loadImage(name + Gender + DisgustedGigglingFrame +".png");

      if (_Type == "h") 
        health.Sequence = loadImage(name2 + Gender + DisgustedGigglingFrame +".png");
      image(health.Sequence, 290, 120);

      if (ChewingAnimationFinished == true && FoodEaten <= 6) { 
        frameRate(6);
        repeats++;
        DisgustedGigglingFrame++;
        if (DisgustedGigglingFrame >= 4)
          DisgustedGigglingFrame = 1;

        if (repeats == 5 ) { 
          DisgustedGigglingFrame = 1;
          repeats = 0;
          frameRate(30);
          ChewingAnimationFinished = false;

          StartChewing = false;        
          CheckReaction = true;
          _x = _originX;
          _y = _originY;

          // Creates a new picture of the selected food.         
          int newFood = (int) random(1, 2);
          if (newFood == 1)
            _Type = "h";

          if (newFood == 2)
            _Type = "u";

          if (_Type == "u")
            Food = loadImage(_Type + (int) random(1, 13) + ".png");
          if (_Type == "h")
            Food = loadImage(_Type + (int) random(1, 49) + ".png");
          image(Food, _x, _y);
        }
      }
    }
  }


  void Answer() {
    println(_Type);
    // This actually works O.O  
    if (_Type == "u" && ChewingAnimationFinished == true) {
      WrongAnswer.resize(50, 50);
      image(WrongAnswer, _x-5, _y-10);
      if (FoodOnPlate == true && _Type == "u" && health.Player_TotalHealth > 0) {
        health.Player_TotalHealth -= health.Player_DamageTaken; 
        FoodOnPlate = false;
      }
    } 

    if (_Type == "h" && ChewingAnimationFinished == true && health.Player_TotalHealth < 100) {
      CorrectAnswer.resize(40, 40); // hmmmm
      image(CorrectAnswer, _x-5, _y-10);
      if (FoodOnPlate == true && _Type == "h") {
        health.Player_TotalHealth += health.Player_DamageTaken;
        FoodOnPlate = false;
      }
    }
  }


  boolean CheckCollusion() {
    if ( _x > plate._x - 40  && _x < plate._x + plate._r/2 && _y > plate._y - 30 && _y < plate._y - plate._r2 + 10 ) {
      //    if(mouseX > plate._x - 80 && mouseX < plate._x + plate._r/2 && mouseY > plate._y - plate._r/2 + 40 && mouseY < plate._y +30 ){
      println("Dish is placed on plate 1");
      if (FoodPlaced == false)
        PlayPlateSound();
      Answer();

      FoodReaction();
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