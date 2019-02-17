public class Collision {
  //Check if the snake collides with itself or the barrier
  //hx and hy are snake head coordinates
  //bx and by are snake body coordinates
  //brx and bry are barrier coordinates

  public static int hx;
  public static int hy;
  public static int bx;
  public static int by;
  public static int brx;
  public static int bry;
  public static boolean death = false;
  
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
    else if(this.hx == this.brx && this.hy == this.bry) {
      //if snake head collides with the barrier
      
      this.death = true;
      
    }
    
    return this.death;
    //returns whether it is game over
    
  }
  
}
