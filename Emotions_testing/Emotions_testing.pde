PImage Sequence;
int number = 1;
int updateSpeed = 0;

void setup() {
  size(640, 360);
  frameRate(30);
}
void draw() { 
  background(255);

  Sequence = loadImage("ChewingBoy"+number+".png");
  image(Sequence, 0, 0);

  updateSpeed++;
  if (updateSpeed == 6) {

    println(updateSpeed);
    number++;
    if (number == 4)
      number = 1;
    updateSpeed = 0;
  }
}