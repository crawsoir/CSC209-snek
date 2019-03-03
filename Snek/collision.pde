public class Collision {
  //Check if the snake collides with itself or the barrier
  //hx and hy are snake head coordinates
  //bx and by are snake body coordinates
  //brx and bry are barrier coordinates

  public int hx;
  public int hy;
  
  public int hw;
  public int hh;
  
  public int bx;
  public int by;
  
  public int brx;
  public int bry;
  public int brw;
  public int brh;
  
  public boolean death = false;
  
  public void snakeHead(int x, int y) {
    
    this.hx = x;
    this.hy = y;
      
  }
  
  public void snakeBody(int x, int y) {
    
    this.bx = x;
    this.by = y;
    
  }
  
  public void barrier(int x, int y) {
    
    this.brx = x;
    this.bry = y;
    
  }
  
  public boolean collision() {
    
    if(this.hx == this.bx && this.hy == this.by) {
      //if snake head collides with the snake body
      
      this.death = true;
      
    }

    //collision with border moved to snek head
    
    return this.death;
    //returns whether it is game over
    
  }
  
}
