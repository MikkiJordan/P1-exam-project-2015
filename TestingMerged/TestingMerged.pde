PImage Background;

float dimensions;
boolean Selected; 

int UnhealtyPicked, HealthyPicked, TotalAmount, FoodIndex;
int UnhealthyAmount = 4, HealthyAmount = 16;

int Spacing = 50;
int xOffset = 55, yOffset = 195;

int wideCount = 4, highCount = 5;

Foodlist[] List;
Plates plate;
Plates plate2;
Plates plate3;
Plates plate4;

void setup() { 
  size(800, 480);
  Background = loadImage("DanishGameBackground.png");

  plate = new Plates(360, 305, 80, 20);
  plate2 = new Plates(360, 342, 100, 20);
  plate3 = new Plates(470, 305, 80, 20);
  plate4 = new Plates(470, 342, 100, 20);

  TotalAmount = wideCount * highCount;
  List = new Foodlist[TotalAmount];


  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      List[FoodIndex++] = new Foodlist(x*Spacing+xOffset, y*(Spacing*1.15)+yOffset, 42);

      // for (int i = 0; i < HealthyAmount + UnhealthyAmount; i++ ) {
      int UnhealtyRandomNumber = int(random(1, TotalAmount ));

      if (UnhealtyRandomNumber >= UnhealthyAmount + 1)
        PickHealthy();

      if (UnhealtyRandomNumber <= UnhealthyAmount)
        PickUnHealthy();
    }
  }
}

void draw() {

  image(Background, 0, 0);
  plate.ShowPlates();
  plate2.ShowPlates();
  plate3.ShowPlates();
  plate4.ShowPlates();
  for (Foodlist food : List) {
    food.display();
    food.checkMouse();
    food.CheckCollusion();
  }
}
//should be read "For each food IN List do....
void mousePressed() {
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
}

void PickHealthy() {
  HealthyPicked++;
  print(FoodIndex);
  if (HealthyPicked <= HealthyAmount)
    println(" is healthy item has been selected");

  if (HealthyPicked >= HealthyAmount + 1 && UnhealtyPicked >= UnhealthyAmount + 1)
    println(" Nothing has been selected");

  if (UnhealtyPicked <= UnhealthyAmount && HealthyPicked >= HealthyAmount + 1 )
    PickUnHealthy();
}

void PickUnHealthy() {
  print(FoodIndex);
  UnhealtyPicked++;
  if (UnhealtyPicked >= UnhealthyAmount + 1 && HealthyPicked <= UnhealthyAmount)
    PickHealthy();

  if (UnhealtyPicked <= UnhealthyAmount)
    println(" is unhealthy item has been selected");
}