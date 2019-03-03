/***************************************************************************************
*    Title: Processing Button Class
*    Author: Unknown
*    Date: 3 July 2015
*    Code version: Java Processing 
*    Availability: http://startingelectronics.org
*
***************************************************************************************/
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
  color clr;
  
  Button(String labelB, float xpos, float ypos, float widthB, float heightB, color newC) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    clr = newC;
  }
  
  void Draw() {
    fill(clr);
    stroke(141);
    rect(x, y, w, h, 10);
    
    fill(0);
    //textSize(25);
    text(label, x + (w / 5), y + (h / 2));
  }
 
  //boolean mouseClicked(){
  //  if (MouseIsOver()){
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}
//  boolean MouseIsOver() {
//    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
//      return true;
//    }
//    return false;
// }
  boolean MouseIsOver()
  {
    return (mouseX<=x+w) && (mouseY<=y+h) && (mouseX>=x) && (mouseY>=y);
  }
}
