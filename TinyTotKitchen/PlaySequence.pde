class AnimationSequence {

  void PlaySequence() {
    frameRate(6);
    i++;
    health.number++;
    if (health.number >= 4)
      health.number = 1;
    if ( i >= 15 ) { 
      CheckReaction = false;
      i = 0;
      frameRate(30);
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
      Yummy = true;
      if (StartChewing == false) {
        CheckReaction = true;
        health.number = 1;
        health.LostGainHealth();

        frameRate(30);

      }
    }
  }
}