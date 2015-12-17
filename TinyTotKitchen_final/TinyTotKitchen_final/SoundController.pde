class SoundController {

  void PlaySound() {
    player = minim.loadFile(type+number+".wav");
    player.play();
  }
}