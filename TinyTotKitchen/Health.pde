class Health {
  String PlayerIndicator_HP = "HEALTH";
  int Player_TotalHealth, Player_DamageTaken = 20, Player_HealthGained;

  PImage Sequence;

  int number = 1, YouWonNumber = 1;
  int RestartGameTime;

  PFont font; 
  int healthTemp;

  Health(int Health) {
    Player_TotalHealth = Health;
  }

  void HealthShow() {
    if (lang == "Dan")
      PlayerIndicator_HP = "Liv";


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
    text(PlayerIndicator_HP, width/1.35, 48); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.


    // white text in the health bar with the health given as an integer and percent
    fill(255, 255, 255, 255); 
    text(Player_TotalHealth + " %", width/1.15, 48); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.


    if (Player_TotalHealth >= 50 ) {
      Sequence = loadImage("Healthy"  + Gender + "1.png");
      image(Sequence, 290, 108);
    }
    if (Player_TotalHealth <= 49 && Player_TotalHealth > 1 ) {
      Sequence = loadImage("NotHealthy" + Gender + "1.png");
      image(Sequence, 290, 108);
    }
    if (Player_TotalHealth <= 0) {
      Sequence = loadImage("Sick" + Gender + "1.png");
      image(health.Sequence, 290, 108);
    }

    if (FoodEaten == 6 ) {

      Sequence = loadImage("YouWon" + Gender + number + ".png");
      image(Sequence, 290, 108);
      Animation.PlaySequence();
      kitchen.level = 2;
    }

    // if the players health reaches 0, go to the main menu
    if (Player_TotalHealth <= 0) {
      Player_TotalHealth = 0;
      RestartGameTime++;
      if (RestartGameTime == 100) {
        GenderSelected = false;
        GameStarted = false;
        GamePaused = false;
        Player_TotalHealth = 100;
        FoodEaten = 0;
        m3.addTint(255, 255);
        m2.addTint(255, 255);
      }
    }

    if (Player_TotalHealth >= 100) {
      Player_TotalHealth = 100;
    }

    strokeWeight(1);
  }

  /*
  void LostGainHealth() { // HealthMeasurement don't work proberly
   if (food._Type == "u" && CheckReaction == true && StartChewing == false) {
   Sequence = loadImage("Disgusted" + Gender + number +".png");
   image(Sequence, 290, 108);
   Animation.PlaySequence();
   }
   
   if (food._Type == "u" && CheckReaction == true && StartChewing == false) { 
   Sequence = loadImage("Giggling" + Gender + number +".png");
   image(Sequence, 290, 108);
   Animation.PlaySequence();
   }
   }*/
}