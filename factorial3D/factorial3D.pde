/* factorial3D
// Generate the base model (2!)
*/
MouseEvents mouseEvents = new MouseEvents();
BaseModelGen baseModel = new BaseModelGen();
ThreeFactorial threeFactorial = new ThreeFactorial();
FourFactorial fourFactorial = new FourFactorial();

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
  // check for mouse events
  mouseEvents.update();
  
  // generate a two factorial base model at the center of the canvas
  //baseModel.generate(0, 0, 0, 200);
  
  // generate a three factorial graphic at the center of the canvas
  threeFactorial.generate(0, 0, 0, 200);
  
  // generate a four factorial graphic at the center of the canvas
  //fourFactorial.generate(0, 0, 0, 200);
}

// mouseWheel event listener
// gets called every time the mouse wheel is moved
void mouseWheel(MouseEvent event) {
 mouseEvents.mouseWheel(event);
}

// mouseDragged event listener
// gets called every time a mouse button is held down and the mouse is moved
void mouseDragged() {
  mouseEvents.mouseDragged();
}

// mousePressed event listener
// gets called every time the right mouse button is pressed
void mousePressed() {
  mouseEvents.mousePressed(); 
}