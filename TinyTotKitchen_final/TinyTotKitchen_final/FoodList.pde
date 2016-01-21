class Foodlist {
  
  // pass by reference
  float _x, _y, _r, _originX, _originY;

  // Determines whether food has been placed as selected on the plate
  boolean Selected, FoodPlaced;
  
  // Food properties needed here to work properly.
  int _FoodChoice;
  String _Type;

  // Different variables.
  PImage WrongAnswer = loadImage("WrongChoiceX.png"), CorrectAnswer = loadImage("CorrectChoice.png"), Food;

  // Correctness of the food eaten.
  String Wrong = "Disgusted", Correct = "Giggling";

  // Needed to make the animation work properly inside the Foodlist class
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

  // Show the list objects as predefined pictures.
  void display() {
    image(Food, _x, _y);
  }

  // Is the mouse's coordinates within one of the pictures?
  void checkMouse() {
    if (MousePressed == false) {
      if (mouseX > _x && mouseX < _x + Food.width && mouseY >  _y  && mouseY < _y + Food.height) {

        // Places the food on the plate (Look at the mousePressed function)
        Selected = true;
      } else {
        Selected = false;
      }
    }
  }

  //Everytime one item has been consumed a reaction will be shown.
  void FoodReaction() {
    if (ChewingAnimationFinished == true && health.YouWonYouLost == false) {
      if (_Type == "u")
        health.Sequence = loadImage(Wrong + Gender + DisgustedGigglingFrame +".png");

      if (_Type == "h") 
        health.Sequence = loadImage(Correct + Gender + DisgustedGigglingFrame +".png");
      image(health.Sequence, 290, 120);

      // When the emotion animation is completed, the item will respawn at the previously selected item's position and create a new type of food. 
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

          // Creates a new randomly selected picture of a food item.         
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

  // When the chewing animation is completed a check or cross will appear at the food.
  void Answer() {
    if (_Type == "u" && ChewingAnimationFinished == true) {
      WrongAnswer.resize(50, 50);
      image(WrongAnswer, _x-5, _y-10);
      if (FoodOnPlate == true && _Type == "u" && health.Player_TotalHealth > 0) {
        health.Player_TotalHealth -= health.Player_DamageTaken; 
        FoodOnPlate = false;
      }
    } 

    if (_Type == "h" && ChewingAnimationFinished == true && health.Player_TotalHealth < 100) {
      CorrectAnswer.resize(40, 40);
      image(CorrectAnswer, _x-5, _y-10);
      if (FoodOnPlate == true && _Type == "h") {
        health.Player_TotalHealth += health.Player_DamageTaken;
        FoodOnPlate = false;
      }
    }
  }


  // If an item has been placed on the plate different things happens.
  boolean CheckCollusion() {
    if ( _x > plate._x - 40  && _x < plate._x + plate._r/2 && _y > plate._y - 30 && _y < plate._y - plate._r2 + 10 ) {
      println("Dish is placed on plate 1");
      if (FoodPlaced == false) // Will check the sound toggle.
        PlayPlateSound();
      Answer(); // Determines whether the chosen food was bad or not and show a graphical representation of it.

      FoodReaction(); // Plays the emotion animation based on the food selected.
      return true;
    }

    FoodPlaced = false; // The sound will toggle between, placing the food and not
    return false;
  }

  // When a selected food has been placed on the plate, the program plays a random plate sound. 
  void PlayPlateSound() {
    if (FoodPlaced == false) {
      type = "p";
      number = (int) random(1, 7);
      sound.PlaySound();
      FoodPlaced = true;
    }
  }
}