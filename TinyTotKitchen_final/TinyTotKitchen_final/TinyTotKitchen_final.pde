// Importing minim library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


// Sounds
String type; 
int number = 1;

// Characters and languages
String Gender, lang = "Dan";

// Food properties
int FoodNumberPicked = 1;
String FoodType = "u";

// Different variables and booleans
PImage Background, GameWon, background, boy, girl, exit, instructions, play, Language, dplay, title, back, newgame, resume, quit, pause, Food, NewBackground, LostGame, WonGame, Victory, instructionAnimation;
boolean Selected, MousePressed, StartChewing, CheckReaction, FoodPicked, GameStarted, GamePaused, Instructions, GenderSelected, ChewingAnimationFinished, WatchMovie, FoodOnPlate;

// List properties
int UnhealtyPicked, HealthyPicked, TotalAmount, FoodIndex, FoodEaten;
int UnhealthyAmount = 10, HealthyAmount = 10;
int ListSpacing = 60, ListxOffset = 20, ListyOffset = 155, ListwideCount = 4, ListhighCount = 5;

// Animation settings
int LoosingWinningTimer, frame = 1;

// Classes
Foodlist[] List;
Health health;
KitchenMiscellaneous kitchen;
MenuPoint m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12;
MenuProperties Menu;

Plates plate;
AnimationSequence Animation;
SoundController sound;
Minim minim;
AudioPlayer player;


void setup() { 
  frameRate(30);
  size(800, 480); 

// Loading the two backgrounds in the game. 
  background = loadImage("MenuBackground.png");
  NewBackground = loadImage("Background.png");

// Different objects are initialized
  kitchen = new KitchenMiscellaneous();
  minim = new Minim(this);
  health = new Health(60);
  Animation = new AnimationSequence();
  plate = new Plates(365, 310, 190, -20);
  sound = new SoundController();
  Menu = new MenuProperties();

// The list is created with two for loops, which represents x- and y-coordinates.
  TotalAmount = ListwideCount * ListhighCount;
  List = new Foodlist[TotalAmount];
  for (int x = 0; x < ListwideCount; x++) {
    for (int y = 0; y < ListhighCount; y++) {
      // One food will be picked
      int UnhealtyRandomNumber = int(random(1, TotalAmount));

      if (UnhealtyRandomNumber >= UnhealthyAmount + 1) 
        PickHealthy();


      if (UnhealtyRandomNumber <= UnhealthyAmount) 
        PickUnHealthy();

      // Increases the list by one, so the list has a new placehold for the next object
      if (FoodPicked == true) {
        List[FoodIndex++] = new Foodlist(x*ListSpacing+ListxOffset, y*(ListSpacing)+ListyOffset, FoodNumberPicked, FoodType);
        FoodPicked = false;
      }
    }
  }
}

// Properties of the individual items are set
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

// Each time the game has been won, the game has to make a new list with the same procedure as in the setup.
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

  //When the health is less than 50 and the player has eaten six items this function will be called (It could also have been placed inside the health class as well).
  // The function will show up the losing or winning sequence until the program has counted to 30 (The counting is influced by the framrate in the game itself)
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
    
    // The two first winning sequences should be played differently than the last one.
    if (kitchen.level == 1 || kitchen.level == 2) {
      WonGame = loadImage("LevelCompleted"+Gender+kitchen.level+".png");
      image(WonGame, width/2-WonGame.width/2, height/2-WonGame.height/2);
    }
    
    LoosingWinningTimer++;
    if (LoosingWinningTimer == 30) { 
      // If it is the last level everything should be resetted.
      if ( kitchen.level >= 3) {
        GameStarted = false; 
        Gender = null;
        MakeNewList();  // Else a NullExceptionError occur.
        setup();  // The program runs through the setup.
      }
      
      health.playWinningAnimation = false;
      LoosingWinningTimer = 0;
    }
  } 

  //  Start menu will be shown as long the gender and the game hasn't been selected / started.
  if (GameStarted != true || Gender == null) {
    // Needs to be loaded constantly 
    Menu.MenuSetup(); 
    image (background, 0, 0); 
    m1.drawMenuPoint();
    m2.drawMenuPoint();
    m3.drawMenuPoint();
    m6.drawMenuPoint();
    m7.drawMenuPoint();

    // If the tutorial has been clicked on, it should be played.
    if (WatchMovie == true) {
      frame++;
      instructionAnimation = loadImage(lang+frame + ".png");
      instructionAnimation.resize(width, height);
      image(instructionAnimation, 0, 0);
      if (frame == 52) {
        WatchMovie = false;
        frame = 0;
      }
    }
  }
  
  // While the game isn't playing the winning or losing sequence the 'HUD' should be viewable.
  if (GenderSelected == true && GameStarted == true && health.playLosingAnimation != true && health.playWinningAnimation != true) {
    // Needs to be loaded constantly 
    image (NewBackground, 0, 0); 
    m12.drawMenuPoint();
    kitchen.Show();
    health.HealthShow();
    plate.ShowPlates();
    Chewing();

    // Showing the listed food items, chekcs whether the mouse is pressing anything and collusion with the plate.
    for (Foodlist food : List) { //should be read as "For each food IN List do...."
      food.display(); //
      food.checkMouse();
      food.CheckCollusion();
    }
  }

  // Shows the pause screen.
  if (GamePaused == true && GameStarted == true ) {
    image (background, 0, 0); 
    Menu.MenuSetup();
    m9.drawMenuPoint();
    m11.drawMenuPoint();
  }
}


// Everytime the chewing is triggered, it should play the chewing animation.
void Chewing() {
  if (StartChewing == true && GamePaused != true && FoodEaten <= 5) {
    health.Sequence = loadImage("Chewing" + Gender + health.number+".png");
    image(health.Sequence, 290, 120);
    Animation.ChewingSequence();
  }
}

// what should the user be able to press on?
void mousePressed() {
  if (GameStarted == true && GamePaused != true) {
    for (Foodlist food : List) {
      if (food.CheckCollusion() == true) { // The character should eat the food when its on the plate

        FoodOnPlate = true;
        StartChewing = true;
        FoodEaten ++;
        if (FoodEaten <= 6) {
          player = minim.loadFile("Eating.wav");
          player.play();
        }
        MousePressed = true;
      }

      if (food.Selected == true) {      
        food._x = 390; 
        food._y = 300;
      }
    }
  }
}

// what should the user be able to release on?
void mouseReleased() {
  if (GameStarted != true || Gender == null || (GamePaused)) 
    Menu.ChangeMenuSettings();

  if (GamePaused == false) { // Its here because else we would get some complications with the functionality. This is the ingame pause button.
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