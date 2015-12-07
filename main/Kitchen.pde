class Kitchen {

  PImage _background, _breakfast, _lunch, _dinner, _eat, _emptyStar, _goldenStar, _pauseButton;

  Kitchen() {
    _emptyStar = loadImage("EmptyStar.png");
    _goldenStar = loadImage("GoldStar.png");
    _pauseButton = loadImage("PauseButton.png");
    _background = loadImage("GameBackground.png");
    _breakfast = loadImage("BreakfastButton.png");
    _lunch = loadImage("LunchButton.png");
    _dinner = loadImage("DinnerButton.png");
    _eat = loadImage("EatButton.png");
  }
  
//Display images regarding the language
  void setlang(int l){
    if (l == 0) {
      _background = loadImage("GameBackground.png");
      _breakfast = loadImage("BreakfastButton.png");
      _lunch = loadImage("LunchButton.png");
      _dinner = loadImage("DinnerButton.png");
      _eat = loadImage("EatButton.png");

    } else if (l == 1) {
      _background = loadImage("DanishGameBackground.png");
     _breakfast = loadImage("DanishBreakfastButton.png");
      _lunch = loadImage("DanishLunchButton.png");
      _dinner = loadImage("DanishDinnerButton.png");
      _eat = loadImage("DanishEatButton.png");
    }
  }

  void display() {
    //Game background
    image(_background, 0, 0);
    //Levels
    image(_breakfast, width-220, 110);
    image(_lunch, width-220, 160);
    image(_dinner, width-220, 210);
    //Eat button
    image(_eat, 310, 20);
    //Pause button
    image(_pauseButton, 677, 373);

    //Amount of golden stars regarding the level. Level 1 = 0 golden stars, level 4 = 4 golden stars.
    if (level == 1) {
      image(_emptyStar, 530, 110);
      image(_emptyStar, 530, 160);
      image(_emptyStar, 530, 210);
    } else if (level == 2) {
      image(_goldenStar, 530, 110);
      image(_emptyStar, 530, 160);
      image(_emptyStar, 530, 210);
    } else if (level == 3) {
      image(_goldenStar, 530, 110);
      image(_goldenStar, 530, 160);
      image(_emptyStar, 530, 210);
    } else if (level == 4) {
      image(_goldenStar, 530, 110);
      image(_goldenStar, 530, 160);
      image(_goldenStar, 530, 210);
    }
  }
}