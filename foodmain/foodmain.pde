int x = 10;
int y = 20;
int numFoods = 74;
PImage[] images = new PImage[numFoods];
Food[] Foods = new Food[numFoods];

void setup(){
  size(800,480);
  //healthy foods
  images[0] = loadImage("Milk.png");
  images[1] = loadImage("OrangeJuice.png");
  images[2] = loadImage("Water.png");
  
  images[3] = loadImage("Cheese.png");
  images[4] = loadImage("Bread.png");
  images[5] = loadImage("Egg.png");
  images[6] = loadImage("Jam.png");
  images[7] = loadImage("Sandwich.png");
  images[8] = loadImage("Pasta.png");
  images[9] = loadImage("Rice.png");
  
  images[10] = loadImage("Apple.png");
  images[11] = loadImage("Banana.png");
  images[12] = loadImage("Cherries.png");
  images[13] = loadImage("Grapes.png");
  images[14] = loadImage("Mango.png");
  images[15] = loadImage("Orange.png");
  images[16] = loadImage("Pear.png");
  images[17] = loadImage("Strawberry.png");
  images[18] = loadImage("Watermelon.png");
  images[19] = loadImage("Avocado.png");
  images[20] = loadImage("Coconut.png");
  images[21] = loadImage("DragonFruit.png");
  images[22] = loadImage("Mangustan.png");
  images[23] = loadImage("Kiwi.png");
  images[24] = loadImage("Papaya.png");
  images[25] = loadImage("Peach.png");
  images[26] = loadImage("Pineapple.png");
  images[27] = loadImage("Plum.png");
  images[28] = loadImage("Blueberries.png");
  images[29] = loadImage("Fig.png");
  images[30] = loadImage("Raspberry.png");
 
  images[31] = loadImage("Chicken.png");
  images[32] = loadImage("Ham.png");
  images[33] = loadImage("Bacon.png");
  images[34] = loadImage("Sausage.png");
  images[35] = loadImage("Beef.png");
  images[36] = loadImage("Fish.png");
  images[37] = loadImage("Turkey.png");
  
  images[38] = loadImage("Broccoli.png");
  images[39] = loadImage("Carrot.png");
  images[40] = loadImage("Cucumber.png");
  images[41] = loadImage("Tomato.png");
  images[42] = loadImage("Asparagus.png");
  images[43] = loadImage("Beetroot.png");
  images[44] = loadImage("Corn.png");
  images[45] = loadImage("Eggplant.png");
  images[46] = loadImage("Garlic.png");
  images[47] = loadImage("Lettuce.png");
  images[48] = loadImage("Mushroom.png");
  images[49] = loadImage("Onion.png");
  images[50] = loadImage("OnionStem.png");
  images[51] = loadImage("Paprika.png");
  images[52] = loadImage("Potato.png");
  images[53] = loadImage("Pumpkin.png");
  images[54] = loadImage("Radish.png");
  images[55] = loadImage("Zucchini.png");
  images[56] = loadImage("Beans.png");
  images[57] = loadImage("Cauliflower.png");
  images[58] = loadImage("Celery.png");
  images[59] = loadImage("GreenPeas.png");
  images[60] = loadImage("Olives.png");
  images[61] = loadImage("Spinach.png");
  
  
  
  //unhealthy foods
  images[62] = loadImage("Chips.png");
  images[63] = loadImage("Doughnuts.png");
  images[64] = loadImage("Coke.png");
  images[65] = loadImage("Hamburger.png");
  images[66] = loadImage("Hotdog.png");
  images[67] = loadImage("Pizza.png");
  images[68] = loadImage("SprinkledCake.png");
  images[69] = loadImage("Chocolate.png");
  images[70] = loadImage("ChocolateRoll.png");
  images[71] = loadImage("Cupcake.png");
  images[72] = loadImage("FrenchFries.png");
  images[73] = loadImage("IceCream.png");
}

void draw(){
  int x = 10;
  int y = 20;
  for(int i = 0; i < numFoods; i++){
    Foods[i] = new Food(new PVector(x,y), images[i], true);
    x += 50;
    if(x >= 750){
      x = 10;
      y += 50;
    }
  }
  for(int i = 0; i < numFoods; i++){
    Foods[i].drawFood();
  }
  
}