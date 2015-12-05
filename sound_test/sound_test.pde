import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
// The Minim library will now be refered to as minim 
Minim minim;
//AudioPlayer is a part of the minim library, that that will allow us to play a sound our choice. (We have used mp3. because this format is supported)
AudioPlayer player;
int number = 1;
String type = "b";
void setup() {
  size(100, 100);
}

void draw() {
  minim = new Minim(this);
  player = minim.loadFile(type+number+".wav");
}


void mousePressed() {
  player.play();
  number++;
  if (number >= 8 && type == "b") {
    number = 1;
    type = "s";
  }
  if (type == "p" && number >= 8) {
    number = 1;
    type = "b";
  }

  if (type == "s" && number >= 3) {
    number = 1;
    type = "p";
  }
}