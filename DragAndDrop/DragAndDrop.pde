float ItemPosX, ItemPosY;
float dimensions = 60;
boolean Selected, NotSelected;
float MouseTempPosX, MouseTempPosY;

void setup() {
  size(400, 400);

  ItemPosX = width/2;
  ItemPosY = height/2;
}

void draw() {
  background(255);

  rectMode(CENTER);
  rect(ItemPosX, ItemPosY, dimensions, dimensions);

  if (mouseX > ItemPosX - dimensions && mouseX < ItemPosX + dimensions && mouseY > ItemPosY - dimensions && mouseY < ItemPosY + dimensions) {
    Selected = true;
  }
  else Selected = false;
}

void mousePressed() {
  if (Selected == true) {
    MouseTempPosX = mouseX;
    MouseTempPosY = mouseY;
  }
}

void mouseDragged(){
  ItemPosX = MouseTempPosX;
  ItemPosY = MouseTempPosY;
}

void mouseReleased(){
 NotSelected = false;
}