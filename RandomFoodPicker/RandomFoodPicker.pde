int UnhealtyPicked, HealthyPicked, UnhealthyAmount, HealthyAmount;

void setup() {
  
  UnhealthyAmount = 4;
  HealthyAmount = 16;

  for (int i = 0; i < HealthyAmount + UnhealthyAmount; i++ ) {
    int UnhealtyRandomNumber = int(random(1, UnhealthyAmount + HealthyAmount ));
   /* for (int k=0; k < 1; k++) {
         ForcePick++; 
       
       if (ForcePick >= 10 && UnhealtyPicked <= 4) {
       UnhealtyRandomNumber = int(random(1, 4));
       ForcePick = 0;
       }
    }*/

    if (UnhealtyRandomNumber >= UnhealthyAmount + 1)
      PickHealthy();

    if (UnhealtyRandomNumber <= UnhealthyAmount)
      PickUnHealthy();
  }
}

void PickHealthy() {
  HealthyPicked++;

  if (HealthyPicked <= HealthyAmount)
    println("One healthy item has been selected");

  if (HealthyPicked >= HealthyAmount + 1 && UnhealtyPicked >= UnhealthyAmount + 1)
    println("Nothing has been selected");

  if (UnhealtyPicked <= UnhealthyAmount && HealthyPicked >= HealthyAmount + 1 )
    PickUnHealthy();
}

void PickUnHealthy() {
  UnhealtyPicked++;
  if (UnhealtyPicked >= UnhealthyAmount + 1 && HealthyPicked <= UnhealthyAmount)
    PickHealthy();

  if (UnhealtyPicked <= UnhealthyAmount)
    println("One unhealthy item has been selected");
  // ForcePick = 0;
}