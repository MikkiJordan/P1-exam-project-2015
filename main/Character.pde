class Character {

  PImage _healthy, _unhealthy, _chewing, _disgusted, _happy;

  int _gender = 1;
  int healthbar = 60;
  int healthbarBefore = 0;
  int numFrames = 4;
  int frame = 0;
  PImage[] chewing = new PImage[numFrames];
  PImage [] disgusted = new PImage[numFrames];
  int _cycle;

 // int time, sec;

  //gender = 0 - boy,   gender = 1 - girl.

  Character() { 
      _healthy = loadImage("HealthyBoy.png"); 
      _unhealthy = loadImage("NotHealthyBoy.png");  
      _happy = loadImage("HappyBoy.png");
  }
  
  void setgender(int g){
    _gender = g;
    if (_gender == 2) {
      _healthy = loadImage("HealthyBoy.png"); 
      _unhealthy = loadImage("NotHealthyBoy.png");  
      _happy = loadImage("HappyBoy.png");
    }  
      if (_gender == 1) {  
      _healthy = loadImage("HealthyGirl.png");    
      _unhealthy = loadImage("NotHealthyGirl.png");       
      _happy = loadImage("HappyGirl.png");
    }
  }

  void display() {  
    //Health more than 50, healthy
    if (healthbar >= 50) {
      image(_healthy, 290, 109);
    }

    //Health below than 50, unhealthy
    if (healthbar < 50) {
      image(_unhealthy, 290, 109);
    }
  }
  
  void animationLoad(){
   for(int i =0; i<numFrames; i++){
    if(_gender == 2){
    chewing[i] = loadImage("ChewingBoy"+i+".png");
    disgusted[i] = loadImage("DisgustedBoy"+i+".png");
  } else if (_gender == 1){
    chewing[i] = loadImage("ChewingGirl"+i+".png");
    disgusted[i] = loadImage("DisgustedGirl"+i+".png");
  }
  }
  }
  
  void chewingDisplay(){ 
    frameRate(10);
    frame++;
  if (frame>=numFrames){
   frame=0;
   _cycle = _cycle +1;
  }
  if (_cycle<=3){
  image(chewing[frame], 290, 109);
  } else{
    _cycle = 0;
    eatClicked = false;
  }
  }
  
  
  //Reactions regarding food choices
  //Food is unhealthy, tongue out. It should only be shown for a few seconds
  
  void disgustedDisplay(){
   // if (healthbar < healthbarBefore)
   frameRate(10);
   frame++;
  if (frame>=numFrames){
   frame=0;
   _cycle = _cycle +1;
  }
  if (_cycle<=3){
  image(disgusted[frame], 500, 114);
  } else{
    _cycle = 0;
  }
  }

  void happyDisplay() {
    //Food is healthy, happy. It should only be shown for a few seconds
    if (healthbar >= healthbarBefore) {
      image(_happy, 350, 114);
    }

  }
}