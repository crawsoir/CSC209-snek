public class ConsumableFactory{
   public Consumable getConsumable(String mode){
    if (mode == null) 
      return null;
    
    if (mode.equalsIgnoreCase("NORMAL"))
      return new NormalFood();
    else if (mode.equalsIgnoreCase("TRIPLE"))
      return new TripleScoreFood();
     return null;
  }
}
  
