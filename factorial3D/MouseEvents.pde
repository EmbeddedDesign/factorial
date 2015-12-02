/* MouseEvents class
// Do mouse things... squeak.
*/
class MouseEvents {
  // Define some variables
  String help = "Click+Drag Mouse/Arrow Keys = Rotate\nScroll Wheel = Zoom\n\"s\" = Save";
  float wheelAccumulator = 2;
  float mouseYValue = 0;
  float mouseXValue = 0;
  boolean mouseClicked = false;
  void update() {
    // update mouse values
    rotateX(-mouseYValue/float(width) * PI);
    rotateY(mouseXValue/float(height) * PI);
    scale(wheelAccumulator/5);
    if (mouseClicked) {
        fill(0);
        textSize(height/25);
        hint(DISABLE_DEPTH_TEST);
        camera();
        noLights();
        text(help, width/150, height/30); 
      }
      else {
        hint(ENABLE_DEPTH_TEST);
      }
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
  void mouseClicked() {
    if (mouseButton == RIGHT) {
      mouseClicked = !mouseClicked;
    }
    else {
      mouseClicked = false;
    }
  }

  void keyPressed() {
    if (key == 's') {
      save("ouput.png");
      println("saved");
    }
    else if (key == CODED) {
      if (keyCode == UP) {
        mouseYValue = mouseYValue + (height/10);
      }
      else if (keyCode == DOWN) {
        mouseYValue = mouseYValue - (height/10);
      }
      else if (keyCode == LEFT) {
        mouseXValue = mouseXValue + (width/10);
      }
      else if (keyCode == RIGHT) {
        mouseXValue = mouseXValue - (width/10);
      }
    }
  }
}