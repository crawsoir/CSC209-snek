import java.util.Random;
import processing.sound.*;


//0: Initial Screen
//1: Game Screen
int currentScreen = 0;
MenuStrategy menuScreen = new MenuStrategy();
GameStrategy gameScreen = new GameStrategy();
GameOverStrategy gameOverScreen = new GameOverStrategy();

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
  setupSound();
  backgroundFile.play();
  gameScreen.food.pickLocation();
}
void draw() {
  collision();
  drawBackground(); 
  fill(255);
  //welcome screen
  if (currentScreen == 0) {
    menuScreen.display();
    if (menuScreen.buttonPressed) {
      gameScreen.python.setXY(10, 10);
      gameScreen.movementLock = "Up";
      currentScreen = 1;
    }
  }
  //play game screen
  if (currentScreen == 1) {
    gameScreen.display();
    if (gameScreen.python.borderCollide()) {
      currentScreen = 2;
    }
  }
  //gameover screen
  if (currentScreen == 2) {
    gameOverScreen.display();
    if (gameOverScreen.buttonPressed) {
      currentScreen = 0;
    }
  }
}
void collision() {
  //button color change
  if (currentScreen == 0) {
    if (menuScreen.play_button.MouseIsOver())
      menuScreen.play_button.clr= color(180);
    else
      menuScreen.play_button.clr= color(214);
  } else if (currentScreen == 2) {
    if (gameOverScreen.menu_button.MouseIsOver())
      gameOverScreen.menu_button.clr= color (180);
    else
      gameOverScreen.menu_button.clr= color (214);
  }
 }

//Note: Temporary have this here as mouseClicked is bugged inside menuStrategy, it doesnt detect clicks but simply detects intersection!
//Same bug happens when u hover over the Menu button in the Gameover screen.
void mouseClicked() {
    //play game button pressed
    if (menuScreen.play_button.MouseIsOver()) {
      //display play game screen
      currentScreen = 1;
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
