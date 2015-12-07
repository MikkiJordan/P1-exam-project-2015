Character c1;

Kitchen k1;


boolean Selected; // Defining a boolean called Selected, which will control whether the user has clicked the square within it's boarders.1
boolean eatClicked;

float ItemPosX, ItemPosY, MouseTempPosX, MouseTempPosY, dimensions; // defining different floats


//level 1 - start, 2 - lunch, 3 - dinner, 4 - finished
int level = 1;
//language. 0 - English, 1 - Danish.
int lang = 0;
int page;
int gender;
int x = 10;
int y = 20;
int numFoods = 74;
PImage[] images = new PImage[numFoods];
Food[] Foods = new Food[numFoods];

MenuPoint m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20, m21, m22, m23, m24, m25;

PImage background, boy, girl, exit, instructions, play, danish, english, dexit, dinstructions, dplay, title, dtitle, back, dback, newgame, dnewgame, resume, dresume, dquit, quit, pause;

void setup() {
  size(800, 480);
  dimensions = 60;
  ItemPosX = width/2;
  ItemPosY = height/2;

  c1 = new Character();
  
  k1 = new Kitchen();
  
  c1.animationLoad();
  
  page = 0;
  gender = 0;
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
  title = loadImage("Title.png");
  dtitle = loadImage("DanishTitle.png");
  back = loadImage("BackButton.png");
  dback = loadImage("DanishBackButton.png");
  newgame = loadImage("NewGameButton.png");
  dnewgame = loadImage("DanishNewGameButton.png");
  resume = loadImage("ResumeButton.png");
  dresume = loadImage("DanishResumeButton.png");
  dquit = loadImage("DanishQuitButton.png");
  quit = loadImage("QuitButton.png");
  pause = loadImage("PauseButton.png");
  lang =0;
  
  m1 = new MenuPoint(new PVector(width/2-instructions.width/2,height-100), instructions); 
  m2 = new MenuPoint(new PVector(510,100),boy); 
  m3 = new MenuPoint(new PVector(25,100),girl);
  m4 = new MenuPoint(new PVector(width-exit.width,height-exit.height),exit); 
  m5 = new MenuPoint(new PVector(width/2-play.width/2,height-250),play); 
  m6 = new MenuPoint(new PVector(0,0), danish);
  m7 = new MenuPoint(new PVector(width/2-title.width/2,10), title);
  m8 = new MenuPoint(new PVector(width/2-dinstructions.width/2,height-100), dinstructions);
  m9 = new MenuPoint(new PVector(width-dexit.width,height-dexit.height),dexit); 
  m10 = new MenuPoint(new PVector(width/2-dplay.width/2,height-250),dplay);
  m11 = new MenuPoint(new PVector(0,0), english);
  m12 = new MenuPoint(new PVector(width/2-dtitle.width/2,10), dtitle);
  m13 = new MenuPoint(new PVector(width-back.width,height-back.height),back);
  m14 = new MenuPoint(new PVector(width-dback.width,height-dback.height),dback); 
  m15 = new MenuPoint(new PVector(width-newgame.width,height-newgame.height),newgame);
  m16 = new MenuPoint(new PVector(width-dnewgame.width,height-dnewgame.height),dnewgame);
  m17 = new MenuPoint(new PVector(width/2-resume.width/2,height-400),resume);
  m18 = new MenuPoint(new PVector(width/2-dresume.width/2,height-400),dresume);
  m19 = new MenuPoint(new PVector(width/2-quit.width/2,height-200),quit);
  m20 = new MenuPoint(new PVector(width/2-dquit.width/2,height-200),dquit);
  m21 = new MenuPoint(new PVector(width-pause.width,height-pause.height),pause);
  m22 = new MenuPoint(new PVector(width/2-instructions.width/2,height-300),instructions);
  m23 = new MenuPoint(new PVector(width/2-dinstructions.width/2,height-300),dinstructions);
  m24 = new MenuPoint(new PVector(width-back.width,height-back.height),back);
  m25 = new MenuPoint(new PVector(width-dback.width,height-dback.height),dback);
 
  
  
   //healthy foods
  images[0] = loadImage("Milk.png");
  images[1] = loadImage("OrangeJuice.png");
  images[2] = loadImage("Water.png");
  
  images[3] = loadImage("Cheese.png");
  images[4] = loadImage("Bread.png");
  images[5] = loadImage("Egg.png");
  images[6] = loadImage("Jam.png");
  images[7] = loadImage("Sandwich.png");
  images[8] = loadImage("Pasta.png");
  images[9] = loadImage("Rice.png");
  
  images[10] = loadImage("Apple.png");
  images[11] = loadImage("Banana.png");
  images[12] = loadImage("Cherries.png");
  images[13] = loadImage("Grapes.png");
  images[14] = loadImage("Mango.png");
  images[15] = loadImage("Orange.png");
  images[16] = loadImage("Pear.png");
  images[17] = loadImage("Strawberry.png");
  images[18] = loadImage("Watermelon.png");
  images[19] = loadImage("Avocado.png");
  images[20] = loadImage("Coconut.png");
  images[21] = loadImage("DragonFruit.png");
  images[22] = loadImage("Mangustan.png");
  images[23] = loadImage("Kiwi.png");
  images[24] = loadImage("Papaya.png");
  images[25] = loadImage("Peach.png");
  images[26] = loadImage("Pineapple.png");
  images[27] = loadImage("Plum.png");
  images[28] = loadImage("Blueberries.png");
  images[29] = loadImage("Fig.png");
  images[30] = loadImage("Raspberry.png");
 
  images[31] = loadImage("Chicken.png");
  images[32] = loadImage("Ham.png");
  images[33] = loadImage("Bacon.png");
  images[34] = loadImage("Sausage.png");
  images[35] = loadImage("Beef.png");
  images[36] = loadImage("Fish.png");
  images[37] = loadImage("Turkey.png");
  
  images[38] = loadImage("Broccoli.png");
  images[39] = loadImage("Carrot.png");
  images[40] = loadImage("Cucumber.png");
  images[41] = loadImage("Tomato.png");
  images[42] = loadImage("Asparagus.png");
  images[43] = loadImage("Beetroot.png");
  images[44] = loadImage("Corn.png");
  images[45] = loadImage("Eggplant.png");
  images[46] = loadImage("Garlic.png");
  images[47] = loadImage("Lettuce.png");
  images[48] = loadImage("Mushroom.png");
  images[49] = loadImage("Onion.png");
  images[50] = loadImage("OnionStem.png");
  images[51] = loadImage("Paprika.png");
  images[52] = loadImage("Potato.png");
  images[53] = loadImage("Pumpkin.png");
  images[54] = loadImage("Radish.png");
  images[55] = loadImage("Zucchini.png");
  images[56] = loadImage("Beans.png");
  images[57] = loadImage("Cauliflower.png");
  images[58] = loadImage("Celery.png");
  images[59] = loadImage("GreenPeas.png");
  images[60] = loadImage("Olives.png");
  images[61] = loadImage("Spinach.png");
  
  //unhealthy foods
  images[62] = loadImage("Chips.png");
  images[63] = loadImage("Doughnuts.png");
  images[64] = loadImage("Coke.png");
  images[65] = loadImage("Hamburger.png");
  images[66] = loadImage("Hotdog.png");
  images[67] = loadImage("Pizza.png");
  images[68] = loadImage("SprinkledCake.png");
  images[69] = loadImage("Chocolate.png");
  images[70] = loadImage("ChocolateRoll.png");
  images[71] = loadImage("Cupcake.png");
  images[72] = loadImage("FrenchFries.png");
  images[73] = loadImage("IceCream.png");
}

void draw() {
  clear();
  print(page);
  rectMode(CENTER);
  image (background,0,0); 
  if (page == 0){
    m1.drawMenuPoint();
    m2.drawMenuPoint();
    m3.drawMenuPoint();
    m4.drawMenuPoint();
    m5.drawMenuPoint();
    m6.drawMenuPoint();
    m7.drawMenuPoint();
  }
  else if (page == 1){
    m2.drawMenuPoint();
    m3.drawMenuPoint();
    m8.drawMenuPoint();
    m9.drawMenuPoint();
    m10.drawMenuPoint();
    m11.drawMenuPoint();
    m12.drawMenuPoint();
  }
  else if (page ==2){
    //how to play
    //image (background,0,0);
   if (lang == 2){
    m14.drawMenuPoint();
   }else{
    m13.drawMenuPoint();
   }
  }
  else if (page ==3){
    //game it self
    k1.setlang(lang);
    c1.setgender(gender);
    c1.animationLoad();
    
    //Display the environment
    k1.display();

    //Display the character
    c1.display();
   // c1.chew();
    //c1.reactions();
    
    if(eatClicked == true){
    c1.chewingDisplay();
    }
    
    image(images[52],ItemPosX, ItemPosY);
    if (mouseX > ItemPosX - dimensions && mouseX < ItemPosX + dimensions && mouseY > ItemPosY - dimensions && mouseY < ItemPosY + dimensions) {
      Selected = true;
    } else {
      Selected = false;
    }
  }
  else if (page == 5){
    if (lang == 1){
      m23.drawMenuPoint();
      m16.drawMenuPoint();
      m18.drawMenuPoint();
      m20.drawMenuPoint();
    }else {
      m15.drawMenuPoint();
      m17.drawMenuPoint();
      m19.drawMenuPoint();
      m22.drawMenuPoint();
    }
  }
  else if (page ==4){
    if (lang == 2){
    m25.drawMenuPoint();
   }else{
    m24.drawMenuPoint();
   }
  }
  else{
  }
}

void mousePressed() {
  // If the the boolean is true we would like the square to have the mouse coordinates
  if (Selected == true) {
    MouseTempPosX = mouseX;
    MouseTempPosY = mouseY;
  }
}

void mouseDragged() {
  // The square should also have the mouse coordinates when its dragged
  if (Selected == true) {
    ItemPosX = mouseX; 
    ItemPosY = mouseY;
    
  }
}


void mouseReleased(){ 
  if (page == 0){
    if (m6.isPositionWithinButton (mouseX,mouseY)){
    page = 1;
    lang = 1; //<>//
    }
    if (m9.isPositionWithinButton (mouseX,mouseY)){ 
      exit();
     }
    if (m2.isPositionWithinButton (mouseX,mouseY)){
      gender = 2;
      m3.addTint(255,126);
      m2.addTint(255,255);
    }
    if (m3.isPositionWithinButton (mouseX,mouseY)){
      gender = 1;
      m2.addTint(255,126);
      m3.addTint(255,255);
    }
    if (m1.isPositionWithinButton (mouseX,mouseY)){
      page = 2;
    }
    if (m5.isPositionWithinButton (mouseX,mouseY)){
      if(gender != 0){
        page = 3;
      }
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
      lang = 0; //<>//
    }
    if (m4.isPositionWithinButton (mouseX,mouseY)){ 
      exit();
    }
     if (m2.isPositionWithinButton (mouseX,mouseY)){
      gender = 2;
      m3.addTint(255,126);
      m2.addTint(255,255);
    }
    if (m3.isPositionWithinButton (mouseX,mouseY)){
      gender = 1;
      m2.addTint(255,126);
      m3.addTint(255,255);
    }
    if (m8.isPositionWithinButton (mouseX,mouseY)){
      page = 2;
    }
    if (m10.isPositionWithinButton (mouseX,mouseY)){
      if(gender != 0){
        page = 3;
      }
    }
  }
  else if (page == 4){
   if (m24.isPositionWithinButton (mouseX,mouseY)){
      page = 5;
    }
    if (m25.isPositionWithinButton (mouseX,mouseY)){
      page = 5;
      }
    
  }
  else if(page == 3){
    if(m21.isPositionWithinButton(mouseX,mouseY)){
      page = 5;
    }
    if (mouseX >= 310 && mouseX <= 513 && mouseY >= 20 && mouseY <= 62) {
      eatClicked = true;
      println("Eat: "+eatClicked);
    }
  }
  else if (page == 5){
    if (m22.isPositionWithinButton (mouseX,mouseY)){
      page = 2;
    }
    if (m22.isPositionWithinButton (mouseX,mouseY)){
     page = 4; 
    }
    if (m23.isPositionWithinButton (mouseX,mouseY)){
      page = 4;
    }
    
    if (m19.isPositionWithinButton (mouseX,mouseY)){
      exit();
    }
    if (m20.isPositionWithinButton (mouseX,mouseY)){
      exit();
    }
    if (m17.isPositionWithinButton (mouseX,mouseY)){
      page = 3;
    }
    if (m18.isPositionWithinButton (mouseX,mouseY)){
      page = 3;
    }
    if (m15.isPositionWithinButton (mouseX,mouseY)){
      println("boo");
      page = 0;
    }
    if (m16.isPositionWithinButton (mouseX,mouseY)){
      page = 1;
      println("rawr");
    }
  }
}
  