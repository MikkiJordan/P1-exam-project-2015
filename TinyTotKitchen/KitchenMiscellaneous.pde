class KitchenMiscellaneous {

  PImage _background, _breakfast, _lunch, _dinner, _eat, _emptyStar, _goldenStar, _pauseButton;
  int level = 0;

  void Show() {
    _emptyStar = loadImage("EmptyStar.png");
    _goldenStar = loadImage("GoldStar.png");
    _breakfast = loadImage(lang+"BreakfastButton.png");
    _lunch = loadImage(lang+"LunchButton.png");
    _dinner = loadImage(lang+"DinnerButton.png");
    //_eat = loadImage(lang+"EatButton.png");
    _pauseButton = loadImage("PauseButton.png");

    //Levels
    image(_breakfast, width-220, 110);
    image(_lunch, width-220, 160);
    image(_dinner, width-220, 210);
    //Eat button
   // image(_eat, 310, 20);
    //Pause button
    image(_pauseButton, 677, 373);

    // Stars properties
    image(_emptyStar, 530, 110);
    image(_emptyStar, 530, 160);
    image(_emptyStar, 530, 210);

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