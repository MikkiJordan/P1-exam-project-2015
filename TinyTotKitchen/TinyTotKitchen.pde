import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

String type; // sound picking
int number = 1; // sound picking

String Gender, lang = "Dan";

PImage Background, GameWon, background, boy, girl, exit, instructions, play, Language, dplay, title, back, newgame, resume, quit, pause, Food, NewBackground;

boolean Selected, MousePressed, StartChewing, CheckReaction, FoodPicked, GameStarted, GamePaused, Instructions, GenderSelected;

int UnhealtyPicked, HealthyPicked, TotalAmount, FoodIndex, i; // re-define "i"
int UnhealthyAmount = 10, HealthyAmount = 10;
int ListSpacing = 60, ListxOffset = 20, ListyOffset = 155, ListwideCount = 4, ListhighCount = 5;

int FoodNumberPicked = 1;
String FoodType = "u";
boolean FoodOnPlate;
int FoodEaten;

boolean ChewingAnimationFinished;

Minim minim;
AudioPlayer player;
AnimationSequence Animation;
Health health;
Foodlist[] List;
Foodlist[] list2;
Plates plate;
Plates plate2;
Plates plate3;
Plates plate4;

SoundController sound;

MenuPoint m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12;

KitchenMiscellaneous kitchen;
MenuProperties Menu;

int LoosingWinningTimer, frame = 1;
PImage LostGame, WonGame, Victory;
void setup() { 

  frameRate(30);
  size(800, 480); 
  // Language = loadImage(lang + "SwitchLanguage.png"); //
  //  m6 = new MenuPoint(new PVector(0, 0), Language);  

  background = loadImage("MenuBackground.png");
  NewBackground = loadImage("Background.png");

  kitchen = new KitchenMiscellaneous();
  minim = new Minim(this);
  health = new Health(60);
  Animation = new AnimationSequence();
  plate = new Plates(365, 310, 190, -20);
  //  plate = new Plates(410, 332, 140, 45);
  //  plate2 = new Plates(360, 342, 100, 20);
  //  plate3 = new Plates(470, 305, 80, 20);
  //  plate4 = new Plates(470, 342, 100, 20);
  sound = new SoundController();
  Menu = new MenuProperties();


  TotalAmount = ListwideCount * ListhighCount;
  List = new Foodlist[TotalAmount];
  for (int x = 0; x < ListwideCount; x++) {
    for (int y = 0; y < ListhighCount; y++) {
      int UnhealtyRandomNumber = int(random(1, TotalAmount));

      if (UnhealtyRandomNumber >= UnhealthyAmount + 1) 
        PickHealthy();


      if (UnhealtyRandomNumber <= UnhealthyAmount) 
        PickUnHealthy();

      if (FoodPicked == true) {
        List[FoodIndex++] = new Foodlist(x*ListSpacing+ListxOffset, y*(ListSpacing)+ListyOffset, FoodNumberPicked, FoodType);
        FoodPicked = false;
      }
    }
  }
}

void PickHealthy() {
  HealthyPicked++;
  if (HealthyPicked <= HealthyAmount) {

    FoodNumberPicked = (int)random(1, 49);
    FoodType = "h";

    FoodPicked = true;
    println("One healthy item has been selected");
  }
  if (HealthyPicked >= HealthyAmount + 1 && UnhealtyPicked >= UnhealthyAmount + 1)
    println(" Nothing has been selected");

  if (UnhealtyPicked <= UnhealthyAmount && HealthyPicked >= HealthyAmount + 1 )
    PickUnHealthy();
}

void PickUnHealthy() {
  UnhealtyPicked++;
  if (UnhealtyPicked >= UnhealthyAmount + 1 && HealthyPicked <= UnhealthyAmount)
    PickHealthy();

  if (UnhealtyPicked <= UnhealthyAmount) {
    FoodNumberPicked = (int) random(1, 13);
    FoodType = "u";
    FoodPicked = true;
    println("One unhealthy item has been selected");
  }
}

void MakeNewList() {
  UnhealtyPicked = 0;  
  HealthyPicked = 0;
  FoodIndex = 0;
  List = new Foodlist[TotalAmount];

  if (health.YouWonYouLost == true) {
    for (int y = 0; y < ListhighCount; y++) {
      for (int x = 0; x < ListwideCount; x++) {
        int UnhealtyRandomNumber = int(random(1, TotalAmount));

        if (UnhealtyRandomNumber >= UnhealthyAmount + 1) {
          PickHealthy();
        }
        if (UnhealtyRandomNumber <= UnhealthyAmount) 
          PickUnHealthy();

        if (FoodPicked == true) {
          List[FoodIndex++] = new Foodlist(x*ListSpacing+ListxOffset, y*(ListSpacing)+ListyOffset, FoodNumberPicked, FoodType);
          FoodPicked = false;
        }
      }
    }
  }
}

void draw() {
  if (health.playLosingAnimation == true) {
    image (background, 0, 0); 
    LostGame = loadImage(lang+"LostGame"+Gender+".png");
    image(LostGame, width/2-LostGame.width/2, height/2-LostGame.height/2);
    LoosingWinningTimer++;
    if (LoosingWinningTimer == 30) {
      health.playLosingAnimation = false;
      LoosingWinningTimer = 0;
    }
  }

  if (health.playWinningAnimation == true) {
    image (background, 0, 0); 
    if (kitchen.level >= 3) {
      frame++;
      if (frame == 5)
        frame = 1;
      Victory = loadImage("GameWon" + Gender + frame + ".png");
      image(Victory, width/2-Victory.width/2, height/2-Victory.height/2);
    }

    if (kitchen.level == 1 || kitchen.level == 2) {
      WonGame = loadImage("LevelCompleted"+Gender+kitchen.level+".png");
      image(WonGame, width/2-WonGame.width/2, height/2-WonGame.height/2);
    }
    LoosingWinningTimer++;
    if (LoosingWinningTimer == 30) { 
      if ( kitchen.level >= 3) {
        GameStarted = false; 
        Gender = null;
        MakeNewList();// or we get a NullExceptionError error
        setup();
      }
      health.playWinningAnimation = false;
      LoosingWinningTimer = 0;
    }
  } 


  if (GameStarted != true || Gender == null) {
    Menu.MenuSetup(); // Needs to be loaded constantly 
    image (background, 0, 0); 
    m1.drawMenuPoint();
    m2.drawMenuPoint();
    m3.drawMenuPoint();
    //    m4.drawMenuPoint();
    //    m5.drawMenuPoint();
    m6.drawMenuPoint();
    m7.drawMenuPoint();
  }

  if (GenderSelected == true && GameStarted == true && health.playLosingAnimation != true && health.playWinningAnimation != true) {
    image (NewBackground, 0, 0); 
    m12.drawMenuPoint();

    kitchen.Show();
    health.HealthShow();
    plate.ShowPlates();
    //  plate2.ShowPlates();
    //  plate3.ShowPlates();
    //  plate4.ShowPlates();
    health.LostGainHealth();
    Chewing();

    for (Foodlist food : List) { //should be read as "For each food IN List do...."
      food.display(); //
      food.checkMouse();
      food.CheckCollusion();
    }
  }

  if (GamePaused == true && GameStarted == true ) {
    image (background, 0, 0); 
    Menu.MenuSetup();
    m9.drawMenuPoint();
    //    m10.drawMenuPoint();
    m11.drawMenuPoint();
  }
}

void Chewing() {
  if (StartChewing == true && i < 12 && GamePaused != true && FoodEaten <= 5) {
    health.Sequence = loadImage("Chewing" + Gender + health.number+".png");
    image(health.Sequence, 290, 120);
    Animation.ChewingSequence();
  }
}

void mousePressed() {
  if (GameStarted == true && GamePaused != true) {
    for (Foodlist food : List) {
      if (food.CheckCollusion() == true) { // You should only be able to press the "Eat button" when there are food on the plates

        //  if (mouseX > 320 && mouseX < 320 + kitchen._eat.width  && mouseY > 20 && mouseY < 20 + kitchen._eat.height) {
        FoodOnPlate = true;
        StartChewing = true;
        FoodEaten ++;
        if (FoodEaten <= 6) {
          player = minim.loadFile("Eating.wav");
          player.play();
        }

        MousePressed = true;
      }
      // If the the boolean is true we would like the square to have the mouse coordinates
      if (food.Selected == true) {      
        food._x = 390; 
        food._y = 300;

        //    food._x = mouseX - food.Food.width/2; 
        //   food._y = mouseY - food.Food.height/2;
      }
    }
  }
}

void mouseDragged() {
  if (GameStarted == true) {
    for (Foodlist food : List) {
      // The square should also have the mouse coordinates when its dragged
      if (food.Selected == true) {
        food._x = mouseX - food.Food.width/2; 
        food._y = mouseY - food.Food.height/2;
      }
    }
  }
}

void mouseReleased() {
  if (GameStarted != true || Gender == null || (GamePaused)) 
    Menu.ChangeMenuSettings();

  if (GamePaused == false) {
    if (m12.isPositionWithinButton(mouseX, mouseY)) 
      GamePaused = true;
  }


  if (GameStarted == true) {
    for (Foodlist food : List) {
      if (food.CheckCollusion() == true ) {
        FoodOnPlate = true;
        StartChewing = true;
        FoodEaten ++;
        if (FoodEaten <= 6) {
          player = minim.loadFile("Eating.wav");
          player.play();
        }
      }

      if (food.CheckCollusion() == false) {
        food._x = food._originX;
        food._y = food._originY;
        println("Dish were not placed on one of the plates");
      }
      MousePressed = false;
    }
  }
}