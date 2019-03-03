import java.util.Random;
import ddf.minim.*;
    //0: Initial Screen
    //1: Game Screen
    int gameScreen = 0;
    Button play_button = new Button("Play Game", 300, 300, 200, 100);
    Random r = new Random();
    String foodArray[] = {"Normal", "Triple"};
    String movementLock = "Up"; //Direction that will be locked from player usage.
    ConsumableFactory CFactory = new ConsumableFactory();
    Consumable food = CFactory.getConsumable(foodArray[r.nextInt(2)]);
    SnekHead python = new SnekHead(10,10);
    int scl = 20;
    int cols = 600 / scl;
    int rows = 600 / scl;
    int score = 0;
    
    Minim minim; 
    AudioPlayer player;
        
    void setup(){
        size(600, 600);
        noStroke();
        frameRate(15);
        food.pickLocation();
        //create sound player
        minim = new Minim(this);
        player = minim.loadFile("pop.mp3");

    }
    void draw(){
        drawBackground(); 
        fill(255);
        rectMode(CENTER);
        //simple score text
        fill(255);
        //welcome screen
        if (gameScreen == 0){
          textSize(40);
          text("SNEK", width / 2, 100);
          textSize(25);
          play_button.Draw();        
        }
        //play game screen
        if (gameScreen == 1) {
          textSize(25);
          textAlign(LEFT, LEFT);
          text("Score: " + score, 5, 28);
        
          python.update();
          if (python.eat(food)){
            //rewind pop sound and play
            player.rewind();
            player.play();
            food.update();
            food = CFactory.getConsumable(foodArray[r.nextInt(2)]);
            food.pickLocation(); 
            python.setTrue();
          }
          food.draw();
        }
    }
    void mousePressed(){
      //play game button pressed
      if (play_button.mousePressed()){
        //display play game screen
        gameScreen = 1;
     }
    }
    void keyPressed(){
      if(gameScreen == 1){
        if(keyCode == UP && !(movementLock.equals("Up"))){
          python.setSpeed(0, -scl);
          movementLock = "Down";
        }
        if(keyCode == DOWN && !movementLock.equals("Down")){
          python.setSpeed(0, scl);
          movementLock = "Up";
        }
        if(keyCode == LEFT && !movementLock.equals("Left")){
          python.setSpeed(-scl, 0);
          movementLock = "Right";
        }
        if(keyCode == RIGHT && !movementLock.equals("Right")){
          python.setSpeed(scl, 0);
          movementLock = "Left";
        }
      }
    }
    void drawBackground(){
      background(0); 
    }
