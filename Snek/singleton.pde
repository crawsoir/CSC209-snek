public class Singleton {
  
  private Singleton snake = null;
  
  //Avoid creating more than one snake
  private Singleton() {}

  public Singleton getSnake(){
    
    if(snake == null) {
      //if the snake is not created
      
      snake = new Singleton();
          
    }
    
    return snake;
    
  }
  
}
