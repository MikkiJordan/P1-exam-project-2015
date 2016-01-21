class MenuProperties {

  void MenuSetup() {
    // All the button pictures gets loaded
    Language = loadImage(lang + "SwitchLanguage.png"); //   
    instructions = loadImage(lang + "HowToPlay.png");  
    exit = loadImage(lang + "ExitButton.png"); //
    play = loadImage(lang + "PlayButton.png"); //
    title = loadImage(lang + "Title.png"); //
    back = loadImage(lang + "BackButton.png"); //
    resume = loadImage(lang + "ResumeButton.png"); //
    newgame = loadImage(lang + "NewGameButton.png");
    quit = loadImage(lang + "QuitButton.png"); //
    pause = loadImage("PauseButton.png"); //
    Background = loadImage(lang + "GameBackground.png");
    girl = loadImage(lang+"ChooseGirlButton.png");
    boy = loadImage(lang+"ChooseBoyButton.png");

    // All the pictures gets resized to fit the aspects
    resume.resize(270, 65);
    back.resize(105, 90);
    quit.resize(270, 65);
    pause.resize(125, 110);
    boy.resize(264, 264);
    girl.resize(264, 264);
    instructions.resize(270, 65);
    title.resize(500, 100);

    // Thier location is defined with vectors (could be usefull if scaling option were used.) 
    m1 = new MenuPoint(new PVector(width/2-instructions.width/2, height/1.2), instructions); 
    m2 = new MenuPoint(new PVector(width - boy.width - 25, height/4), boy); 
    m3 = new MenuPoint(new PVector(25, height/4), girl);
    m6 = new MenuPoint(new PVector(0, 0), Language);
    m7 = new MenuPoint(new PVector(width/2-title.width/2, width/48), title);
    m8 = new MenuPoint(new PVector(width-back.width, height-back.height), back);
    m9 = new MenuPoint(new PVector(width/2-resume.width/2, height - resume.height*6), resume);
    m11 = new MenuPoint(new PVector(width/2-quit.width/2, height- quit.height*3), quit);
    m12 = new MenuPoint(new PVector(width-pause.width, height-pause.height), pause);
  }

  // Properties for each button
  void ChangeMenuSettings() {
    // In main menu
    if (GamePaused == false) {
      if (m1.isPositionWithinButton (mouseX, mouseY)) { // Whatch instructions
          WatchMovie = true;
      }

      if (m2.isPositionWithinButton (mouseX, mouseY)) { // Maskuline gender has been picked
        Gender = "Boy";
        m3.addTint(255, 126);
        m2.addTint(255, 255);
        GenderSelected = true;
        GameStarted = true;
      }

      if (m3.isPositionWithinButton (mouseX, mouseY)) { // Femenine gender has been picked
        Gender = "Girl";
        m2.addTint(255, 126);
        m3.addTint(255, 255);
        GenderSelected = true;
        GameStarted = true;
      }

      if (m6.isPositionWithinButton (mouseX, mouseY)) { // Change languages
        if (lang == "Dan")
          lang = "Eng";
        else lang = "Dan";
        println(lang);
      }
    }

    // While the game is paused
    if (GamePaused != false) {
      if (m9.isPositionWithinButton (mouseX, mouseY)) // Stop watching instructions
        GamePaused = false;

      if (m11.isPositionWithinButton(mouseX, mouseY))
        exit();
    }
  }
}