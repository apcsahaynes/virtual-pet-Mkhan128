VirtualPet myPet;

Button feedButton;
Button playButton;
Button cleanButton;

// How many milliseconds between each status update
// (increase to slow down, decrease to speed up)
final int UPDATE_INTERVAL = 10000;
int lastUpdateTime = 0;

// ---- Action message ----
String actionMessage = "";
int messageTime = 0;
final int MESSAGE_DURATION = 2000; // milliseconds to show the message

void setup() {
  size(600, 500);
  textFont(createFont("Arial", 16, true));
  img = loadImage("Background.jpg");
  img.resize(300,0);

  myPet = new VirtualPet("Coco");

  // Buttons sit along the bottom of the screen
  // Button(label, x, y, width, height)
  feedButton = new Button("Feed", 90, 430, 120, 45);
  playButton = new Button("Play", 240, 430, 120, 45);
  cleanButton = new Button("Bathe", 390, 430, 120, 45);
}

void draw() {
  background(245, 240, 255);

  // ---- Timed status update ----
  if (millis() - lastUpdateTime >= UPDATE_INTERVAL) {
    myPet.updateStatus();
    lastUpdateTime = millis();
  }

  // ---- Draw sections ----
  drawPetArea();
  drawStats(myPet);
  feedButton.display();
  playButton.display();
  cleanButton.display();
  drawMessage();
}

void mousePressed() {
  if (feedButton.isClicked(mouseX, mouseY)) {
    Food f = new Food("Watermelon", 3, 2, 2);
    myPet.feed(f);
    showMessage(f.getName() + " eaten!");
  }

  if (playButton.isClicked(mouseX, mouseY)) {
    Game g = new Game("Coin Toss", 2, 1);
    myPet.play(g);
    showMessage(g.getName() + " played!");
  }
  
  if(cleanButton.isClicked(mouseX, mouseY)){
    Cleans c = new Cleans(2);
    myPet.clean(c);
  }
}

// Call this to set a new message
void showMessage(String msg) {
  actionMessage = msg;
  messageTime = millis();
}
