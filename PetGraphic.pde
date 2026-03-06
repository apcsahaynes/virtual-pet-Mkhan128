PImage img;

void drawPetArea() {
  image(img,50,20);
  /*
  fill(220, 210, 245);
  stroke(180, 160, 220);
  strokeWeight(2);
  rect(20, 20, 380, 390, 16);
*/

  // Draw whichever graphic option you're using
  drawPetGraphic();
}

float r = random(0,255);
float g = random(0,255);
float b = random(0,255);

// =============================================
// OPTION A: Drawing with Processing shapes
// Replace or add to the placeholder below!
// =============================================

void drawPetGraphic() {

  // ---- Placeholder shape ----
  // Replace this with your own drawing,
  // or swap it for an image (see Option B below).

  // Body
  fill(r, g, b);
  noStroke();
  ellipseMode(CENTER);
  ellipse(210, 220, 140+myPet.getWeight(), 120+myPet.getWeight());

  // Head
  fill(r, g, b);
  ellipse(210, 145, 100, 90);

  // Eyes
  fill(50);
  ellipse(190, 138, 14, 14);
  ellipse(230, 138, 14, 14);

  // Eye shine
  fill(255);
  ellipse(195, 134, 5, 5);
  ellipse(235, 134, 5, 5);

  // Nose
  fill(255, 160, 180);
  ellipse(210, 152, 10, 7);

  // Mouth
  if(myPet.getHappinessLevel()>30){
  noFill();
  stroke(80);
  strokeWeight(2);
  arc(210, 160, 24, 14, 0, PI);
  }
  else if(myPet.getHappinessLevel()<=30 && myPet.getHappinessLevel()>15){
  noFill();
  stroke(80);
  strokeWeight(2);
  line(195,160,225,160);
  }
  else{
   noFill();
   stroke(80);
   strokeWeight(2);
   arc(210,170,24,14,PI,TWO_PI);
  }
  

  // Ears
  fill(170, 210, 255);
  noStroke();
  triangle(178, 108, 168, 75, 195, 100);
  triangle(242, 108, 252, 75, 225, 100);

  // Inner ears
  fill(255, 180, 200);
  triangle(180, 105, 172, 82, 193, 100);
  triangle(240, 105, 248, 82, 227, 100);
}
