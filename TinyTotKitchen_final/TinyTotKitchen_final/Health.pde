class Health {
  // Health properties
  int Player_TotalHealth, Player_DamageTaken = 20;

  // Different variables.
  PImage Sequence;

  // Different variables.
  int number = 1, YouWonNumber = 1;

  // Determines whether something should be played.
  boolean YouWonYouLost, playLosingSound, playLosingAnimation, playWinningAnimation;

  // Constructor
  Health(int Health) {
    Player_TotalHealth = Health;
  }

  // Makes sure the correct emotion will be shown
  void HealthShow() {
    if (Player_TotalHealth >= 50 ) {
      Sequence = loadImage("Healthy"  + Gender + "1.png");
      image(Sequence, 290, 120);
    }
    if (Player_TotalHealth <= 49 && Player_TotalHealth > 1 ) {
      Sequence = loadImage("NotHealthy" + Gender + "1.png");
      image(Sequence, 290, 120);
    }

    if (Player_TotalHealth <= 0) {
      Sequence = loadImage("Sick" + Gender + "1.png");
      image(health.Sequence, 290, 120);
    }

    // If the game has been lost the losing animation is called, the health points are restored and a new list is created.
    if (FoodEaten == 6 && Player_TotalHealth <= 49) {
      playLosingAnimation = true;
      YouWonYouLost = true;
      MakeNewList();
      YouWonYouLost = false;

      Player_TotalHealth = 60;
      FoodEaten = 0;

      player = minim.loadFile("Lost.wav");
      player.play();
      health.playLosingSound = false;

      for (Foodlist food : List) { 
        food._x = food._originX;
        food._y = food._originY;
      }
    }

    // If the game has been won the winning animation is called, the health points are restored, the level will increase and a new list is created.
    if (FoodEaten == 6 && Player_TotalHealth >= 50) {
      health.playWinningAnimation = true;
      YouWonYouLost = true; // Toggle to prevent a NullExceptionError.
      MakeNewList();
      YouWonYouLost = false;
      FoodEaten = 0;
      kitchen.level++;

      Player_TotalHealth = 60;
      player = minim.loadFile("s1.wav");
      player.play();

      // This sound will be active after the second level, and will in addition to "s1" play as well.
      if (kitchen.level > 2) {
        player = minim.loadFile("Win.wav");
        player.play();
      }
    }
  }
}