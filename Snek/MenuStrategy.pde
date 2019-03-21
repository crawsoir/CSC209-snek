public class MenuStrategy implements ScreenStrategy {
  Button playButton = new Button("Play Game", 200, 200, 200, 80, (214));
  Button instructionsButton = new Button("Instructions", 200, 300, 200, 80, (214));
  boolean buttonPressed = false;

  public MenuStrategy() {
  }

  @Override
    public void display() {
    //this.mouseClicked();
    textSize(40);
    textAlign(CENTER);
    text("SNEK", width / 2, 100);
    textSize(25);
    playButton.Draw();
    instructionsButton.Draw();
  }
}
