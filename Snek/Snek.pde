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
//Images
PImage spriteHead;
PImage spriteBody;
PImage spriteNormalFood;
PImage spriteTripleFood;
PImage backgroundArt;

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
  setupArt();
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
      //reset python and score
      gameScreen.python.setXY(10, 10);
      gameScreen.python.setSpeed(0,0);
      gameScreen.movementLock = "Up";
      score = 0;
      keyCode = 0;
      
      currentScreen = 1;
      menuScreen.buttonPressed = false;
      
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
      gameOverScreen.buttonPressed = false;
    }
  }
}
void collision() {
  //button color change
  if (currentScreen == 0) {
    if (menuScreen.play_button.MouseIsOver())
      menuScreen.play_button.clr= color(150);
    else
      menuScreen.play_button.clr= color(230);
  } else if (currentScreen == 2) {
    if (gameOverScreen.menu_button.MouseIsOver())
      gameOverScreen.menu_button.clr= color (180);
    else
      gameOverScreen.menu_button.clr= color (214);
  }
 }

void mouseClicked() {
    //play game button pressed
    if (menuScreen.play_button.MouseIsOver() && currentScreen == 0) {
      //display play game screen
      menuScreen.buttonPressed = true;
    }
    if (gameOverScreen.menu_button.MouseIsOver() && currentScreen == 2) {
      gameOverScreen.buttonPressed = true;
    }
  }


void drawBackground() {
  background(backgroundArt);
}
void setupSound() {
  path1 = sketchPath(backAudioName);
  path2 = sketchPath(foodAudioName);
  backgroundFile = new SoundFile(this, path1);
  foodFile = new SoundFile(this, path2);
}
void setupArt(){
  spriteBody = loadImage("spritebody_2.png");
  spriteHead = loadImage("spritehead_2.png");
  spriteNormalFood = loadImage("spritenormalfood.png");
  spriteTripleFood = loadImage("spritetriplefood.png");
  backgroundArt = loadImage("background_1.png");
}
