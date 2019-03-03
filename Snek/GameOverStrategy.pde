/**
 * Strategy for game over screen
 */

public class GameOverStrategy implements ScreenStrategy {
Button menu_button = new Button("Menu", 200, 200, 200, 100, (214));
boolean buttonPressed;
  public GameOverStrategy() {
  }
  void mouseClicked() {

    if (menu_button.MouseIsOver()) {
      buttonPressed = true;
    }
  }

  @Override
    public void display() {
    this.mouseClicked();
    textSize(40);
    text("Game Over", width / 2.5, 100);
    textSize(25);
    menu_button.Draw();
  }
}
