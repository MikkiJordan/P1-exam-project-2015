class AnimationSequence {

  void PlaySequence() {
    frameRate(6);
    frame++;
    health.number++;
    if (health.number >= 4)
      health.number = 1;
    if ( frame >= 15 ) { 
      CheckReaction = false;
      frame = 0;
      frameRate(30);
    }
  }

  void ChewingSequence() {
    frameRate(6);
    frame++;
    health.number++;
    if (health.number >= 4)
      health.number = 1;
    if ( frame >= 12 ) { 
      frame = 0;
      StartChewing = false;
      ChewingAnimationFinished = true;
      if (StartChewing == false) {
        CheckReaction = true;
        health.number = 1;

        frameRate(30);

      }
    }
  }
}