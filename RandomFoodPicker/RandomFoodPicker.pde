int forcer, UnhealtyPicked, HealthyPicked;

void setup() {
  size(400, 400);

  for (int i = 0; i < 16; i++ ) {
    int UnhealtyRandomNumber = int(random(1, 20));

    for (int k=0; k < 2; k++) {
      forcer+=k; 

      if (forcer == 5 ) {
        UnhealtyRandomNumber = int(random(1, 4));
        forcer = 0;
      }

      if (UnhealtyRandomNumber >= 5)
        PickHealthy();

      if (UnhealtyRandomNumber <= 4)
        PickUnHealthy();
    }
  }
}

void PickHealthy() {
  HealthyPicked++;
  
  if (HealthyPicked <= 16)
  println("One healthy item has been selected");
  
  if (HealthyPicked >= 17)
  println("Nothing was selected");
}

void PickUnHealthy() {

  UnhealtyPicked++;
  if (UnhealtyPicked >= 5)
    PickHealthy();

  if (UnhealtyPicked <= 4)
    println("One unhealthy item has been selected");
}