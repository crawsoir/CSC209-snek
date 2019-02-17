public class GameModeFactory{
  public GameMode getMode(String mode){
    if (mode == null) 
      return null;
    
    if (mode.equalsIgnoreCase("EASY"))
      return new EasyMode();
    else if (mode.equalsIgnoreCase("HARD"))
      return new HardMode();
     return null;
  }
}
