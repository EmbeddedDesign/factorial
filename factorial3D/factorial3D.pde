/* factorial3D
// Generate the base model (2!)
*/

// Define some variables
float wheelAccumulator = 2;
float mouseYValue = 0;
float mouseXValue = 0;
ThreeFactorial threeFactorial = new ThreeFactorial();

// setup
void setup() {
  surface.setTitle("Factorial 3D");
  size(700, 700, P3D);
  smooth(8);
  // this makes it so that we can see lines we draw through fills
  //hint(DISABLE_OPTIMIZED_STROKE);
}

// draw
void draw() {
  // turn on the lights, set the background to white
  lights();
  background(255);
  
  // center the frame
  translate(width/2, height/2, 0);
  
  // update mouse values
  rotateX(-mouseYValue/float(width) * PI);
  rotateY(mouseXValue/float(height) * PI);
  scale(wheelAccumulator/5);
  
  // generate a three factorial graphic at the center of the canvas
  threeFactorial.generate();
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