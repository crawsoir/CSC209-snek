
    SnekHead python = new SnekHead(10,10);
    Food food=new Food();
    int scl=20;
    int cols = 600/scl;
    int rows = 600/scl;
    
    void setup(){
        size(600,600);
        noStroke();
        frameRate(7);
        food.pickLocation();
    }
    void draw(){
        drawBackground(); 
        fill(255);
        rectMode(CENTER);
        python.update();
        if (python.eat(food)){
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
