## Directory Structure
  The Snek file is the main directory which contains all the code and resource files.
## Major Classes and Functions
| Class | Class Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Snek` class| Used to hold everything together. |
| `SnekHead` class| Used to control the Snek itself containing the Snek's head and the rest of its body parts. |
| `SnekBody` class| Used to hold one of the Snek's body's x and y coordinates. |
| `SnekTail` class| Used to allow the game to know where the end of the Snek resides. |
| `Screen Strategy` class | Class DEfinition |
| `Button` class | Class DEfinition |
- Snek.pde contains the major game loops to setup the view of the game and makes any changes when the user interacts with the game
### `Snek` Class
#### Purpose:
| `Snek`'s Variables | Variable Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `v` | v def |
| `v` | v def |
| `v` | v def  |

| `Snek`'s Functions | Function Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `function` | fcn def |
| `function` | fcn def |
### `SnekHead` Class
#### Purpose: To hold the first part of the Snek which enables the game to control the rest of the Snek.
| `SnekHead`'s Variables | Variable Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `px` | An integer containing the x position of the SnekHead on the screen. |
| `py` | An integer containing the y position of the SnekHead on the screen. |
| `sx` | An integer determining how many pixels the SnekHead will be moving in the x direction. |
| `sy` | An integer determining how many pixels the SnekHead will be moving in the y direction. |
| `next` | A SnekPart that holds either a SnekBody or SnekTail. |
| `newPart` | A boolean determining if another SnekBody must be added to the Snek. |


| `SnekHead`'s Functions | Function Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `setSpeed` | Takes in two integers x and y and sets sx and sy to the variables respectively. |
| `setXY` | Takes in two integers x and y and resets the Snek. |
| `setTrue` | Sets the newPart variable to true. |
| `addBody` | Takes in a SnekPart and sets the SnekHead's next to this new SnekPart and the SnekHead's previous next to the SnekPart's next. |
| `update` | Updates the x and y of the SnekHead by adding its speed and passes its previous x and y to the head's next SnekPart to update. Creates a new Part if NewPart is true. |
| `eat` | Returns true if the Consumable passed collides/shares the same x and y with the SnekHead. |
| `borderCollide` | Returns true if the SnekHead's x and y are out of bounds. |
| `bodyCollide` | Returns true if the SnekHead's x and y collides/shares the same x and y with any of its SnekParts. |
### `SnekBody` Class
#### Purpose: To hold the x and y of one of the Snek's body parts.
| `SnekBody`'s Variables | Variable Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `px` | An integer containing the x position of the SnekHead on the screen. |
| `py` | An integer containing the y position of the SnekHead on the screen. |
| `next` | A SnekPart that holds either a SnekBody or SnekTail. |
#### Functions:
| `SnekBody`'s Functions | Function Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `getX` | Return the SnekPart's x coordinate. |
| `getY` | Return the SnekPart's x coordinate. |
| `setNext` | Takes in a SnekPart and sets the SnekBody's next to this new SnekPart. |
| `update` | Updates the x and y of the SnekBody with the passed x and y and passes the SnekBody's x and y to its next SnekPart. |
### `SnekTail` Class
#### Purpose: To allow the game to know when to stop updating the x and y coordinates of the SnekPart.

| `SnekTail`'s Functions | Function Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `update` | Do nothing as the end of the Snek. |
### `ScreenStrategy` Class
#### Purpose:
| `ScreenStrategy`'s Variables | Variable Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `v` | v def |
| `v` | v def |
| `v` | v def  |

| `ScreenStrategy`'s Functions | Function Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `function` | fcn def |
| `function` | fcn def |
#### Classes that use ScreenStrategy
  - MenuStrategy
    - Purpose:
  - GameStrategy
    - Purpose:
  - GameOverStrategy
    - Purpose:
### `ConsumableFactory`
  #### Purpose:
  #### Classes that use ScreenStrategy
  - Consumable
    - Purpose:
### `Button` Class
  #### Parameters: 
   - `String labelB`
   - `float xPos`
   - `float yPos`
   - `float widthB`
   - `float heightB` 
  #### Purpose:
  - 
  - The five buttons are `Play Game`, `Instructions`, `Pause`, `Quit`, and `Menu`.
  - Menu Screen:
    - `Play Game` sets up and displays the Play Game Screen
    - `Instructions` displays a pop-up dialog box with the instructions.
  - Game Screen
    - `Pause` stops the snek from moving and displays a pop-up dialog box and continues once the continue on the pop up is pressed.
    - `Quit` leaves the game and displays the Menu Screen.
  -  Game Over Screen
      - `Menu` displays the Menu Screen.

| `Button`'s Variables | Variable Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `String label` | The text to be displayed on the button. |
| `float xPosition` | The x position the button will be displayed on the GUI. |
| `float yPosition` | The y position the button will be displayed on the GUI.  |
| `float width` | The width of the button. |
| `float height` | The height of the button. |
| `color clr` | The fill color of the button. |

| `Buttons`'s Functions | Function Description |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `void Draw()` | Generates a Box containing one or more integers. |
| `boolean MouseIsOver()` | Generates a Block with 9 Boxes. |
## Extensions of Snek Game
 ### 1. Displaying Score on Game Over Screen
  //TODO
 ### 2. Difficulty Level
  //TODO
 #### 3. Leader Board
  //TODO
 #### 4. Decreasing Game Borders
  //TODO
