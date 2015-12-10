class MenuProperties {

  void MenuSetup() {
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

    m1 = new MenuPoint(new PVector(width/2-instructions.width/2, height/1.2), instructions); 

    //   m4 = new MenuPoint(new PVector(width - exit.width, height - exit.height), exit); 
    //   m5 = new MenuPoint(new PVector(width / 2-play.width / 2, height - 250), play); 
    m6 = new MenuPoint(new PVector(0, 0), Language);
    m7 = new MenuPoint(new PVector(width/2-title.width/2, width/48), title);
    m8 = new MenuPoint(new PVector(width-back.width, height-back.height), back);
    m9 = new MenuPoint(new PVector(width/2-resume.width/2, height - resume.height*6), resume);
 //   m10 = new MenuPoint(new PVector(width-newgame.width, height-newgame.height), newgame);
    m11 = new MenuPoint(new PVector(width/2-quit.width/2, height- quit.height*3), quit);

    m12 = new MenuPoint(new PVector(width-pause.width, height-pause.height), pause);
  }

  void ChangeMenuSettings() {

    if (GamePaused == false) {
      // fix play, instructions interference with pause..


      // if (m1.isPositionWithinButton (mouseX, mouseY)) { // Whatch instructions
      //    instructions = true;


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

      /*  if (m4.isPositionWithinButton (mouseX, mouseY))  // Exit game
       exit();
       */
      /*  if (m5.isPositionWithinButton (mouseX, mouseY)) // Start the game
       if (GenderSelected == true)
       GameStarted = true;
       */
      if (m6.isPositionWithinButton (mouseX, mouseY)) { // Change languages
        if (lang == "Dan")
          lang = "Eng";
        else lang = "Dan";
        println(lang);
      }

      //  if (m8.isPositionWithinButton (mouseX, mouseY)) // Stop watching instructions
      //  GamePaused = false;
    }

    if (GamePaused != false) {

      if (m9.isPositionWithinButton (mouseX, mouseY)) // Stop watching instructions
        GamePaused = false;

/*      if (m10.isPositionWithinButton(mouseX, mouseY)) {
        GamePaused = false;
        Gender = null;
        GenderSelected = false;
        GameStarted = false;
        m2.addTint(255, 255);
        m3.addTint(255, 255);
        health.Player_TotalHealth = 60;
      }
*/
      if (m11.isPositionWithinButton(mouseX, mouseY))
        exit();
    }
  }
}