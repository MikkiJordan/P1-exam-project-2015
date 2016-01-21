class KitchenMiscellaneous {

  // Declaring different variables
  PImage _background, _breakfast, _lunch, _dinner, _eat, _emptyStar, _goldenStar, _pauseButton;
  int level = 0;

  // Different icons for the HUD
  void Show() {
    _emptyStar = loadImage("EmptyStar.png");
    _goldenStar = loadImage("GoldStar.png");
    _breakfast = loadImage(lang+"BreakfastButton.png");
    _lunch = loadImage(lang+"LunchButton.png");
    _dinner = loadImage(lang+"DinnerButton.png");
    _pauseButton = loadImage("PauseButton.png");

    //Levels
    image(_breakfast, width-220, 110);
    image(_lunch, width-220, 160);
    image(_dinner, width-220, 210);
    image(_pauseButton, 677, 373);

    //Star's properties
    image(_emptyStar, 530, 110);
    image(_emptyStar, 530, 160);
    image(_emptyStar, 530, 210);

    // Showing a star for each level completed.
    if (level == 1 || level == 2 || level == 3 ) {
      image(_goldenStar, 530, 110);
      if (level == 2 || level == 3) {
        image(_goldenStar, 530, 160);
        if (level == 3)
          image(_goldenStar, 530, 210);
      }
    }
  }
}