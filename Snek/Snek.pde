import java.util.Random;
import processing.sound.*;
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
        setupSound();
        backgroundFile.play();
        gameScreen.food.pickLocation();
        
    }
    void draw(){
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
    }
    
    
    void drawBackground(){
      background(0); 
    }
    void setupSound(){
      path1 = sketchPath(backAudioName);
      path2 = sketchPath(foodAudioName);
      backgroundFile = new SoundFile(this, path1);
      foodFile = new SoundFile(this, path2);
    }
