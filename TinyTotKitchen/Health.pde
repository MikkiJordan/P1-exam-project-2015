class Health {
  String PlayerIndicator_HP;
  int Player_TotalHealth, Player_DamageTaken = 20, Player_HealthGained;

  PImage Sequence;

  int number = 1, YouWonNumber = 1;
  int RestartGameTime;

  PFont font; 
  boolean YouWon, gameCompleted, gameLost;

  Health(int Health) {
    Player_TotalHealth = Health;
  }

  String TryAgain;
  void HealthShow() {

    // underlying health bar
    fill(0, 0, 0, 120);
    noStroke();
    rect(width/1.2, 25, 100, 30);

    // Red health bar
    noStroke();
    fill(255, 0, 0, 200 );
    rect(width/1.2, 25, Player_TotalHealth, 30); // one less so the boarders ain't getting messy

    // The frame & stroke
    noFill();
    stroke(0);
    strokeWeight(2); // A thicker stroke
    rect(width/1.2, 25, 100, 30);


    fill(255, 0, 0, 255); // the health bar text will be indicated as a red bar.

    font = loadFont("Health-Bar-Lobster.vlw");
    textFont(font, 20);

    textAlign(CORNER); // The text should be in the corner of the positioning 

    if (lang == "Dan") {
      PlayerIndicator_HP = "Liv";
      text(PlayerIndicator_HP, width/1.25, 48); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.
    }
    if (lang == "Eng") {
      PlayerIndicator_HP = "HEALTH";
      text(PlayerIndicator_HP, width/1.35, 48); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.
    }

    //    text(PlayerIndicator_HP, width/1.35, 48); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.

    // white text in the health bar with the health given as an integer and percent
    fill(255, 255, 255, 255); 
    text(Player_TotalHealth + " %", width/1.15, 48); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.


    if (Player_TotalHealth >= 50 ) {
      Sequence = loadImage("Healthy"  + Gender + "1.png");
      image(Sequence, 290, 120);
    }
    if (Player_TotalHealth <= 49 && Player_TotalHealth > 1 ) {
      Sequence = loadImage("NotHealthy" + Gender + "1.png");
      image(Sequence, 290, 120);
    }

    if (FoodEaten == 6 && Player_TotalHealth <= 49) {
      if (lang == "Eng")
        TryAgain = "You lost try again";

      if (lang == "Dan")
        TryAgain = "Du tabte, prøv igen";

      fill(255, 0, 0, 200 );
      textSize(30);
      text(TryAgain, 320, 100); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.

      RestartGameTime++;
      if (RestartGameTime == 100) {
        gameLost = true;
        MakeNewList();
        gameLost = false;
        Player_TotalHealth = 60;
        FoodEaten = 0;
        if (kitchen.level == 1)
          kitchen.level = 1;
        if (kitchen.level == 2)
          kitchen.level = 2;
        if (kitchen.level == 3)
          kitchen.level = 3;
        for (Foodlist food : List) { 
          food._x = food._originX;
          food._y = food._originY;
        }
      }
    }

    if (FoodEaten == 6 && Player_TotalHealth >= 50) { // hmmmmm
      YouWon = true;
      MakeNewList();
      YouWon = false;
      Yummy = false;
      FoodEaten = 0;
      kitchen.level++;

      player = minim.loadFile("s1.wav");
      player.play();

      if (kitchen.level > 3) {
        gameCompleted = true;
        player = minim.loadFile("Win.wav");
        player.play();
      }



      /* if (Yummy == false && CheckReaction == false) {
       Sequence = loadImage("YouWon" + Gender + number + ".png");
       image(Sequence, 290, 108);
       
       if (YouWon == true) {
       Animation.PlaySequence();
       kitchen.level++;
       FoodEaten = 0;
       Player_TotalHealth = 60;
       MakeNewList();
       YouWon = false;
       }
       }*/
    }

    // if the players health reaches 0, go to the main menu
    if (Player_TotalHealth <= 0) {
      Sequence = loadImage("Sick" + Gender + "1.png");
      image(health.Sequence, 290, 120);
    }

    if (Player_TotalHealth >= 100) {
      Player_TotalHealth = 100;
    }

    strokeWeight(1);
  }


  void LostGainHealth() { // HealthMeasurement don't work proberly
    for (Foodlist food : List) { 
      /*    if (food._Type == "u" &&  CheckReaction == true && StartChewing == false) {
       Sequence = loadImage("Disgusted" + Gender + number +".png");
       image(Sequence, 290, 108);
       Animation.PlaySequence();
       }
       
       if (healthTemp <= Player_TotalHealth && CheckReaction == true && StartChewing == false) { 
       Sequence = loadImage("Giggling" + Gender + number +".png");
       image(Sequence, 290, 108);
       Animation.PlaySequence();
       }*/
    }
  }
}