float ItemPosX, ItemPosY, MouseTempPosX, MouseTempPosY, dimensions; // defining different floats
boolean Selected; // Defining a boolean called Selected, which will control whether the user has clicked the square within it's boarders.

void setup() {
  size(400, 400); 
  dimensions = 60;
  ItemPosX = width/2;
  ItemPosY = height/2;
}

void draw() {
  background(255);
  rectMode(CENTER);
  rect(ItemPosX, ItemPosY, dimensions, dimensions);
  
  // Is the mouse within the square if so set the boolean to true otherwise it should be false
  if (mouseX > ItemPosX - dimensions && mouseX < ItemPosX + dimensions && mouseY > ItemPosY - dimensions && mouseY < ItemPosY + dimensions) {
    Selected = true;
  } else {
    Selected = false;
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