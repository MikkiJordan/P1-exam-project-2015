PImage Background;

float dimensions; // defining different floats
boolean Selected; // Defining a boolean called Selected, which will control whether the user has clicked the square within it's boarders.

int UnhealtyPicked, HealthyPicked, UnhealthyAmount, HealthyAmount;

int Spacing = 50;
int xOffset = 50;
int yOffset = 210;
int FoodIndex = 0;
int TotalAmount;
Foodlist[] List;

void setup() {
  int wideCount = 4;
  int highCount = 5;
  TotalAmount = wideCount * highCount;
  List = new Foodlist[TotalAmount];


  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      List[FoodIndex++] = new Foodlist(x*Spacing+xOffset, y*(Spacing*1.125)+yOffset);
    }
  }

  size(800, 480);
  Background = loadImage("DanishGameBackground.png");

  for (int i = 0; i < HealthyAmount + UnhealthyAmount; i++ ) {
    int UnhealtyRandomNumber = int(random(1, UnhealthyAmount + HealthyAmount ));

    if (UnhealtyRandomNumber >= UnhealthyAmount + 1)
      PickHealthy();

    if (UnhealtyRandomNumber <= UnhealthyAmount)
      PickUnHealthy();
  }
}

class MakeList {
  float TempPosX, TempPosY;

  MakeList(float PosX, float PosY) {
    TempPosX = PosX;
    TempPosY = PosY;
  }

  void showList() {
    ellipse(TempPosX, TempPosY, dimensions, dimensions);
  }
}

void draw() {
  image(Background, 0, 0);
  for (Foodlist food : List) {
    food.display();
    food.checkMouse();
  }
}

void mousePressed() {
  for (Foodlist food : List) {
    // If the the boolean is true we would like the square to have the mouse coordinates
    if (food.Selected == true) {      
      food.x = mouseX; 
      food.y = mouseY;
    }
  }
}

void mouseDragged() {
  for (Foodlist food : List) {
    // The square should also have the mouse coordinates when its dragged
    if (food.Selected == true) {
      food.x = mouseX; 
      food.y = mouseY;
    }
  }
}

void PickHealthy() {
  HealthyPicked++;

  if (HealthyPicked <= HealthyAmount)
    println("One healthy item has been selected");

  if (HealthyPicked >= HealthyAmount + 1 && UnhealtyPicked >= UnhealthyAmount + 1)
    println("Nothing has been selected");

  if (UnhealtyPicked <= UnhealthyAmount && HealthyPicked >= HealthyAmount + 1 )
    PickUnHealthy();
}

void PickUnHealthy() {
  UnhealtyPicked++;
  if (UnhealtyPicked >= UnhealthyAmount + 1 && HealthyPicked <= UnhealthyAmount)
    PickHealthy();

  if (UnhealtyPicked <= UnhealthyAmount)
    println("One unhealthy item has been selected");
}