import java.util.Random;
import processing.sound.*;
//0: Initial Screen
//1: Game Screen
int gameScreen = 0;
Button play_button = new Button("Play Game", 200, 200, 200, 100, (214));
Button menu_button = new Button("Menu", 200, 200, 200, 100, (214));
Random r = new Random();
String foodArray[] = {"Normal", "Triple"};
String movementLock = "Up"; //Direction that will be locked from player usage.
ConsumableFactory CFactory = new ConsumableFactory();
Consumable food = CFactory.getConsumable(foodArray[r.nextInt(2)]);
SnekHead python = new SnekHead(10, 10);
//Background music
SoundFile backgroundFile;
String backAudioName = "Testing.mp3";
String path1;
//Background sound for food collection
SoundFile foodFile;
String foodAudioName = "Temp1.mp3";
String path2;

int scl = 20;
int cols = 600 / scl;
int rows = 600 / scl;
int score = 0;

void setup() {
  
  size(600, 600);
  noStroke();
  frameRate(15);
  rectMode(CORNER);
  food.pickLocation();
  setupSound();
  backgroundFile.play();
}
void draw() {
  collision();
  drawBackground(); 
  fill(255);
  //simple score text
  fill(255);

  //welcome screen
  if (gameScreen == 0) {
    textSize(40);
    text("SNEK", width / 2.5, 100);
    textSize(25);
    play_button.Draw();
  }
  //gameover screen
  if (gameScreen == 2) {
    textSize(40);
    text("Game Over", width / 2.5, 100);
    textSize(25);
    menu_button.Draw();
  }
  //play game screen
  if (gameScreen == 1) {
    textSize(25);
    textAlign(LEFT, LEFT);
    text("Score: " + score, 5, 28);

    python.update();
    if (python.eat(food)) {
      food.update();
      food = CFactory.getConsumable(foodArray[r.nextInt(2)]);
      food.pickLocation(); 
      python.setTrue();
      //Play sound
      foodFile.play();
    }
    food.draw();
  }
}
void collision() {
  //button color change
  if (gameScreen == 0) {
    if (play_button.MouseIsOver())
      play_button.clr= color(180);
    else
      play_button.clr= color(214);
  } else if (gameScreen == 2) {
    if (menu_button.MouseIsOver())
      menu_button.clr= color (180);
    else
      menu_button.clr= color (214);
  }
  //python collision with border
  if (gameScreen == 1) {
    if (python.borderCollide()) {
      gameScreen = 2;
    }
  }
}

void mouseClicked() {
  //play game button pressed
  if (gameScreen == 0){
  if (play_button.MouseIsOver()) {
    //display play game screen
    python.setXY(10,10);
    movementLock = "Up";
    gameScreen = 1;
  }
  }
  //if screen is gameover
  else if (gameScreen == 2){
    if (menu_button.MouseIsOver()){
     //display menu screen
     gameScreen = 0;
  }
  }
}
void keyPressed() {
  if (gameScreen == 1) {
    if (keyCode == UP && !(movementLock.equals("Up"))) {
      python.setSpeed(0, -scl);
      movementLock = "Down";
    }
    if (keyCode == DOWN && !movementLock.equals("Down")) {
      python.setSpeed(0, scl);
      movementLock = "Up";
    }
    if (keyCode == LEFT && !movementLock.equals("Left")) {
      python.setSpeed(-scl, 0);
      movementLock = "Right";
    }
    if (keyCode == RIGHT && !movementLock.equals("Right")) {
      python.setSpeed(scl, 0);
      movementLock = "Left";
    }
  }
}
void drawBackground() {
  background(0);
}
void setupSound() {
  path1 = sketchPath(backAudioName);
  path2 = sketchPath(foodAudioName);
  backgroundFile = new SoundFile(this, path1);
  foodFile = new SoundFile(this, path2);
}
