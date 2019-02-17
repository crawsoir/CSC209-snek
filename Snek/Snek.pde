import java.util.Random;
    Random r = new Random();
    String foodArray[] = {"Normal", "Triple"};
    ConsumableFactory CFactory = new ConsumableFactory();
    Consumable food = CFactory.getConsumable(foodArray[r.nextInt(2)]);
    
    SnekHead python = new SnekHead(10,10);
    int scl=20;
    int cols = 600/scl;
    int rows = 600/scl;
    int score = 0;
      
    void setup(){
        size(600,600);
        noStroke();
        frameRate(30);
        food.pickLocation();
    }
    void draw(){
        drawBackground(); 
        fill(255);
        rectMode(CENTER);
        //simple score text
        fill(255);
        textSize(25);
        text("Score: " + score, 5, 28);
        
        python.update();
        if (python.eat(food)){
           food.update();
           food = CFactory.getConsumable(foodArray[r.nextInt(2)]);
           food.pickLocation(); 
            python.setTrue();
        }
        food.draw();
    }
    void keyPressed(){
        if(keyCode == UP){
            python.setSpeed(0,-scl);
        }
        if(keyCode == DOWN){
            python.setSpeed(0,scl);
        }
        if(keyCode == LEFT){
            python.setSpeed(-scl,0);
        }
        if(keyCode == RIGHT){
            python.setSpeed(scl,0);
        }
        
    }
    void drawBackground(){
        background(0); 
    }
