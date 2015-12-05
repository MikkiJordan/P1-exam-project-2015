class Health {
  String PlayerIndicator_HP = "HEALTH";
  int Player_TotalHealth, HealthMeasurement, Player_DamageTaken, Player_HealthGained;

  PImage Sequence;
  int number = 1, YouWonNumber = 1, updateSpeed;
  int time;

  Health(int Health) {
    Player_TotalHealth = Health;
    HealthMeasurement = Player_TotalHealth;
  }

  void HealthShow() {
    //if (lang = dansish)
    //PlayerIndicator_HP = "Liv";

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
    textSize(20);   // With the size of 20px.

    textAlign(CORNER); // The text should be in the corner of the positioning 

    text(PlayerIndicator_HP, width/1.38, 48); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.

    // white text in the health bar with the health given as an integer and percent
    fill(255, 255, 255, 255); 
    text(Player_TotalHealth + " %", width/1.16, 48); // The String PlayerIndicator_HP's data will be implemented and will in addition show the players health next to it, in the given position.

    /** 
     
     This is what should be changed so it only get damaged when something wrong has been eaten
     
     **/


    if (Player_TotalHealth >= 50 ) {
      Sequence = loadImage("Healthy"  + Gender + "1.png");
      image(Sequence, 290, 108);
    }
    if (Player_TotalHealth <= 49 && Player_TotalHealth > 1 ) {
      Sequence = loadImage("NotHealthy" + Gender + "1.png");
      image(Sequence, 290, 108);
    }
    if (Player_TotalHealth <= 0) {
      health.Sequence = loadImage("Sick" + Gender + "1.png");
      image(health.Sequence, 290, 108);
    }

    //  time++;
    if (time >= 100) {
      Sequence = loadImage("YouWon" + Gender + YouWonNumber + ".png");
      image(Sequence, 290, 108);
      updateSpeed++;
      if (updateSpeed == 6) {
        YouWonNumber++;
        if (YouWonNumber == 4)
          YouWonNumber = 1;
        updateSpeed = 0;
      }
    }

    // if the players health reaches 0, go to the main menu
    if (Player_TotalHealth <= 0) {
      Player_TotalHealth = 0;
      // Go to main menu...
    }
    strokeWeight(1);
  }

  void LostGainHealth() { // HealthMeasurement don't work proberly
    if (HealthMeasurement > health.Player_TotalHealth && CheckReaction == true && StartChewing == false) {
      Sequence = loadImage("Disgusted" + Gender + number +".png");
      image(Sequence, 290, 108);
      updateSpeed++;
      if (updateSpeed == 8) {
        i++;
        number++;
        if (number == 4)
          number = 1;
        updateSpeed = 0;
      }
      if ( i >= 4 ) { 
        CheckReaction = false;
        i = 0;
      }
    }

    if (HealthMeasurement < health.Player_TotalHealth && CheckReaction == true && StartChewing == false) {
      Sequence = loadImage("Giggling" + Gender + number +".png");
      image(Sequence, 290, 108);
      updateSpeed++;
      if (updateSpeed == 8) {
        i++;
        number++;
        if (number == 4)
          number = 1;
        updateSpeed = 0;
      }
      if ( i >= 4 ) { 
        CheckReaction = false;
        i = 0;
      }
    }
  }
}