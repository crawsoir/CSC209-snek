public class MenuStrategy implements ScreenStrategy {
  Button play_button = new Button("Play Game", 300, 300, 200, 100);
  boolean buttonPressed = false;
  
  public MenuStrategy() {
  }
  
  void mousePressed(){
    if (play_button.mousePressed()){
      buttonPressed = true;
    }
  }
  
  @Override
    public void display() {
    this.mousePressed();
    textSize(40);
    text("SNEK", width / 2, 100);
    textSize(25);
    play_button.Draw();
  }
}
