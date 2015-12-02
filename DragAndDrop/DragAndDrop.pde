float ItemSizeX, ItemSizeY;
float dimensions = 60;

void setup() {
  size(400, 400);

  ItemSizeX = width/2;
  ItemSizeY = height/2;
}

void draw() {
  background(255);

  rectMode(CENTER);
  rect(ItemSizeX, ItemSizeY, dimensions, dimensions);

  if (mouseX > ItemSizeX - dimensions && mouseX < ItemSizeX + dimensions && mouseY > ItemSizeY - dimensions && mouseY < ItemSizeY + dimensions)
    println("good");
    
  else println("bad");
}