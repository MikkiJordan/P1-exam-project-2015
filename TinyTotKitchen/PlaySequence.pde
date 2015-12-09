class AnimationSequence {

  void PlaySequence() {
    frameRate(6);
    i++;
    health.number++;
    if (health.number == 4)
      health.number = 1;

    if ( i >= 4 ) { 
      CheckReaction = false;
      i = 0;

    }
  }

  void ChewingSequence() {
    frameRate(6);
    i++;
    health.number++;
    if (health.number >= 4)
      health.number = 1;
    if ( i >= 12 ) { 
      i = 0;
      StartChewing = false;
      if (StartChewing == false) {
        CheckReaction = true;
        health.number = 1;
        //      health.LostGainHealth();

        frameRate(30);
        for (Foodlist food : List) {
          food._x = food._originX;
          food._y = food._originY;
        }
      }
    }
  }
}