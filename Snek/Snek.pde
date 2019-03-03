import java.util.Random;
import processing.sound.*;

    //Button menu_button = new Button("Menu", 200, 200, 200, 100, (214));
    //0: Initial Screen
    //1: Game Screen
    int currentScreen = 0;
    MenuStrategy menuScreen = new MenuStrategy();
    GameStrategy gameScreen = new GameStrategy();
    
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
      
    void setup(){
        size(600, 600);
        noStroke();
        frameRate(15);
        rectMode(CORNER);
        setupSound();
        backgroundFile.play();
        gameScreen.food.pickLocation();
        
    }
    void draw(){
        collision();
        drawBackground(); 
        fill(255);
        rectMode(CENTER);
        //welcome screen
        if (currentScreen == 0){
          menuScreen.display();
          if (menuScreen.buttonPressed){
            currentScreen = 1;
          }
        }
        //play game screen
        if (currentScreen == 1) {
          gameScreen.display();
        }
        //gameover screen
        if (currentScreen == 2) {
            //gameOverScreen.display();
          //textSize(40);
    //text("Game Over", width / 2.5, 100);
    //textSize(25);
    //menu_button.Draw();
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

void drawBackground() {
  background(0);
}
void setupSound() {
  path1 = sketchPath(backAudioName);
  path2 = sketchPath(foodAudioName);
  backgroundFile = new SoundFile(this, path1);
  foodFile = new SoundFile(this, path2);
}
