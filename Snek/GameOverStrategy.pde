/**
 * Strategy for game over screen
 */

public class GameOverStrategy implements ScreenStrategy {
  Button menu_button = new Button("Menu", 200, 200, 200, 100, (214));
  boolean buttonPressed;
  public GameOverStrategy() {
  }

  @Override
    public void display() {
    fill(255, 0, 0);
    textSize(40);
    text("Game Over", width / 2, 100);
    textSize(25);
    menu_button.Draw();
  }
}
