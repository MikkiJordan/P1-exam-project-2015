int i;

String Gender;

PImage Background;

float dimensions;
boolean Selected, MousePressed, StartChewing, CheckReaction;

int UnhealtyPicked, HealthyPicked, TotalAmount, FoodIndex;
int UnhealthyAmount = 4, HealthyAmount = 16;

int Spacing = 50;
int xOffset = 55, yOffset = 195;

int wideCount = 4, highCount = 5;
float r, g, b;

Health health;

Foodlist[] List;
Plates plate;
Plates plate2;
Plates plate3;
Plates plate4;

void setup() { 
  Gender = "Boy"; // if girl is selected it should turn to "Girl"

  frameRate(30);
  size(800, 480);
  Background = loadImage("DanishGameBackground.png");

  health = new Health(100);

  plate = new Plates(360, 305, 80, 20);
  plate2 = new Plates(360, 342, 100, 20);
  plate3 = new Plates(470, 305, 80, 20);
  plate4 = new Plates(470, 342, 100, 20);

  TotalAmount = wideCount * highCount;
  List = new Foodlist[TotalAmount];

  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      List[FoodIndex++] = new Foodlist(x*Spacing+xOffset, y*(Spacing*1.15)+yOffset, 42, r, g, b);
      int UnhealtyRandomNumber = int(random(1, TotalAmount ));
      
      if (UnhealtyRandomNumber >= UnhealthyAmount + 1)
        PickHealthy();

      if (UnhealtyRandomNumber <= UnhealthyAmount)
        PickUnHealthy();
    }
  }
}

void PickHealthy() {
  HealthyPicked++;
  if (HealthyPicked <= HealthyAmount) {
    //These values can be changed to whatever, for example to pick a random picture..
    r = random(200);
    g = random(255);
    b = random(150);

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
    //These values can be changed to whatever, for example to pick a random picture..
    r = 255;
    g = 0;
    b = 0;
    println("One unhealthy item has been selected");
  }
}

void draw() {
  image(Background, 0, 0);
  health.HealthShow();
  health.LostGainHealth();
  plate.ShowPlates();
  plate2.ShowPlates();
  plate3.ShowPlates();
  plate4.ShowPlates();
  for (Foodlist food : List) { //should be read "For each food IN List do....
    food.display();
    food.checkMouse();
    food.CheckCollusion();
  }
  Chewing();
  //**** ****//
  fill(0);
  rect(300, 25, 250, 75);
}

/** move to health would probably be a good idea... + change boy to an string.. **/
void Chewing() {
  if (StartChewing == true && i < 12 ) {
    health.Sequence = loadImage("Chewing" + Gender + health.number+".png");
    image(health.Sequence, 290, 108);
    health.updateSpeed++;
    if (health.updateSpeed == 6) {
      i++;
      health.number++;
      if (health.number >= 4)
        health.number = 1;
      health.updateSpeed = 0;
    }
    if ( i >= 12 ) { // 
      health.Player_DamageTaken = 40;
      health.Player_TotalHealth -= health.Player_DamageTaken;
      i = 0;
      StartChewing = false;
      if (StartChewing == false) {
        CheckReaction = true;
        health.number = 1;
        health.LostGainHealth();
      }
    }
  }
}

void mousePressed() {
  ///**** *****///
  if (mouseX > 300 && mouseX < 300+250 && mouseY > 25 && mouseY < 25 + 75) {
    StartChewing = true;
  }

  MousePressed = true;
  for (Foodlist food : List) {
    // If the the boolean is true we would like the square to have the mouse coordinates
    if (food.Selected == true) {      
      food._x = mouseX; 
      food._y = mouseY;
    }
  }
}

void mouseDragged() {
  for (Foodlist food : List) {
    // The square should also have the mouse coordinates when its dragged
    if (food.Selected == true) {
      food._x = mouseX; 
      food._y = mouseY;
    }
  }
}

void mouseReleased() {
  for (Foodlist food : List) {
    if (food.CheckCollusion() == false) {
      food._x = food._originX;
      food._y = food._originY;
      println("Dish were not placed on one of the plates");
    }
  }
  MousePressed = false;
}