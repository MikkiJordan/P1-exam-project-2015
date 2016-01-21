// A class to play all sounds in the game.
class SoundController {

  void PlaySound() {
    player = minim.loadFile(type+number+".wav");
    player.play();
  }
}