/* MouseEvents class
// Do mouse things... squeak.
*/
class MouseEvents {
  // Define some variables
  float wheelAccumulator = 2;
  float mouseYValue = 0;
  float mouseXValue = 0;
  void update() {
    // update mouse values
    rotateX(-mouseYValue/float(width) * PI);
    rotateY(mouseXValue/float(height) * PI);
    scale(wheelAccumulator/5);
  }
  // mouseWheel event listener
  // gets called every time the mouse wheel is moved
  // scroll up to zoom in, scroll down to zoom out
  void mouseWheel(MouseEvent event) {
   wheelAccumulator = constrain(wheelAccumulator + event.getCount(), 1, 250);
  }
  
  // mouseDragged event listener
  // gets called every time a mouse button is held down and the mouse is moved
  // click any mouse button and drag to rotate
  void mouseDragged() {
    mouseYValue =  mouseYValue + (mouseY - pmouseY);
    mouseXValue =  mouseXValue + (mouseX - pmouseX);
  }
  
  // mousePressed event listener
  // gets called every time the right mouse button is pressed
  void mousePressed() {
    if (mouseButton == RIGHT) {
      
    }
  }
}