int page;
int lang;
int gender;
MenuPoint m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14;

PImage background, boy, girl, exit, instructions, play, danish, english, dexit, dinstructions, dplay;


void setup(){ //function to setup everything is only called once
  size(800,480); //size of the screen width,height
  page = 0;
  instructions = loadImage("HowToPlayButton.png"); 
  background = loadImage("MenuBackground.png"); 
  boy = loadImage("ChooseBoyButton.png");
  girl = loadImage("ChooseGirlButton.png");
  exit = loadImage("ExitButton.png");
  play = loadImage("PlayButton.png");
  danish = loadImage("SwitchToDanish.png");
  english = loadImage("SwitchToEnglish.png");
  dexit = loadImage("DanishExitButton.png");
  dinstructions = loadImage("DanishHowToPlayButton.png");
  dplay = loadImage("DanishPlayButton.png");
  lang =0;
  
  m1 = new MenuPoint(new PVector(width/2-instructions.width/2,height-100), instructions); 
  m2 = new MenuPoint(new PVector(510,100),boy); 
  m3 = new MenuPoint(new PVector(25,100),girl);
  m4 = new MenuPoint(new PVector(width-exit.width,height-exit.height),exit); 
  m5 = new MenuPoint(new PVector(width/2-play.width/2,height-250),play); 
  m6 = new MenuPoint(new PVector(0,0), danish);
  /*m7 = new MenuPoint(new PVector(width/2-title.width/2,10), title);*/
  m8 = new MenuPoint(new PVector(width/2-dinstructions.width/2,height-100), dinstructions);
  m9 = new MenuPoint(new PVector(width-dexit.width,height-dexit.height),dexit); 
  m10 = new MenuPoint(new PVector(width/2-dplay.width/2,height-250),dplay);
  m11 = new MenuPoint(new PVector(0,0), english);
  /*m12 = new MenuPoint(new PVector(width/2-dtitle.width/2,10), dtitle);*/
  m13 = new MenuPoint(new PVector(width-exit.width,height-exit.height),exit);
  m14 = new MenuPoint(new PVector(width-dexit.width,height-dexit.height),dexit); 
}

void draw(){ //function that keeps getting called
  image (background,0,0); 
  if (page == 0){
    m1.drawMenuPoint();
    m2.drawMenuPoint();
    m3.drawMenuPoint();
    m4.drawMenuPoint();
    m5.drawMenuPoint();
    m6.drawMenuPoint();
    /*m7.drawMenuPoint();*/
  }
  else if (page == 1){
    m2.drawMenuPoint();
    m3.drawMenuPoint();
    m8.drawMenuPoint();
    m9.drawMenuPoint();
    m10.drawMenuPoint();
    m11.drawMenuPoint();
    /*m12.drawMenuPoint();*/
  }
  else if (page ==2){
    //how to play
    image (background,0,0);
    m13.drawMenuPoint();
  }
  else if (page ==3){
    //game it self
    background(255);
  }
  else if (page ==4){
    //how to play danish
    image (background,0,0);
    m14.drawMenuPoint();
  }
  
}

void mouseReleased(){ //fuction to catch where mouse released
  if (page == 0){
    if (m6.isPositionWithinButton (mouseX,mouseY)){
    page = 1;
    lang = 1;
    }
    if (m9.isPositionWithinButton (mouseX,mouseY)){ 
      exit();
     }
    if (m2.isPositionWithinButton (mouseX,mouseY)){
      gender = 1;
      m3.addTint(255,126);
      m2.addTint(255,255);
    }
    if (m3.isPositionWithinButton (mouseX,mouseY)){
      gender = 0;
      m2.addTint(255,126);
      m3.addTint(255,255);
    }
    if (m1.isPositionWithinButton (mouseX,mouseY)){
      page = 2;
    }
    if (m5.isPositionWithinButton (mouseX,mouseY)){
      page = 3;
    }
  }
  else if (page == 2){
    if (m13.isPositionWithinButton (mouseX,mouseY)){
      page = 0;
    }
  }
  else if (page == 1){
    if (m11.isPositionWithinButton (mouseX,mouseY)){
      page = 0;
      lang = 0;
    }
    if (m4.isPositionWithinButton (mouseX,mouseY)){ 
      exit();
    }
     if (m2.isPositionWithinButton (mouseX,mouseY)){
      gender = 1;
      m3.addTint(255,126);
      m2.addTint(255,255);
    }
    if (m3.isPositionWithinButton (mouseX,mouseY)){
      gender = 0;
      m2.addTint(255,126);
      m3.addTint(255,255);
    }
    if (m8.isPositionWithinButton (mouseX,mouseY)){
      page = 4;
    }
    if (m10.isPositionWithinButton (mouseX,mouseY)){
      page = 3;
    }
  }
  else if (page == 4){
   if (m14.isPositionWithinButton (mouseX,mouseY)){
      page = 1;
    }
  }
  
  else {}
/*
  if(page == 0){ // if on page 0 (menu page) then
    if (m1.isPositionWithinButton (mouseX,mouseY)){ //if on m1 then start game
      page = 1; // page 1 game itself
      lives = 5; // have 5 lives
      score = 0; //score is 0
      e.clear(); // clears all enemys
      shots.clear(); // clears all shots
     }
    if (m2.isPositionWithinButton (mouseX,mouseY)){ //if on m2 then
      page = 2; //switch to instructions
     }
    if (m3.isPositionWithinButton (mouseX,mouseY)){ //if on m3 then
      page = 3; //switch to controles
     }*/
    /*if (m4.isPositionWithinButton (mouseX,mouseY)){ //if on m4 then
      exit(); //exit processing
     }/*
  } else{ //else you
    if (m5.isPositionWithinButton (mouseX,mouseY)){ //if on m5 then
      page = 0; // back to main menu
     }
  }*/
}
  