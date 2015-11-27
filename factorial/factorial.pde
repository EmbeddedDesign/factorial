/**
 * Comments go here.
 */


void setup() {
  size(400, 400);
  stroke(0);
}

void draw() {
  background(50, 50, 50);
  drawCircle();
  smooth();
}

void drawCircle(){
  strokeWeight(3);
    ellipse(200, 200, 55, 55);
}