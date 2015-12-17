class Health {
// Health properties
  int Player_TotalHealth, Player_DamageTaken = 20;

  PImage Sequence;

  int number = 1, YouWonNumber = 1;

  // Determines whether something should be played.
  boolean YouWonYouLost, playLosingSound, playLosingAnimation, playWinningAnimation;

  Health(int Health) {
    Player_TotalHealth = Health;
  }

  void HealthShow() {
       if (Player_TotalHealth >= 50 ) {
      Sequence = loadImage("Healthy"  + Gender + "1.png");
      image(Sequence, 290, 120);
    }
    if (Player_TotalHealth <= 49 && Player_TotalHealth > 1 ) {
      Sequence = loadImage("NotHealthy" + Gender + "1.png");
      image(Sequence, 290, 120);
    }
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

    if (FoodEaten == 6 && Player_TotalHealth >= 50) {
      health.playWinningAnimation = true;
      YouWonYouLost = true;
      MakeNewList();
      YouWonYouLost = false;
      FoodEaten = 0;
      kitchen.level++;

      Player_TotalHealth = 60;
      player = minim.loadFile("s1.wav");
      player.play();


      if (kitchen.level > 2) {
        player = minim.loadFile("Win.wav");
        player.play();
      }
    }

    if (Player_TotalHealth <= 0) {
      Sequence = loadImage("Sick" + Gender + "1.png");
      image(health.Sequence, 290, 120);
    }
  }
}