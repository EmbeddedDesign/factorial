/**
 * Comments go here.
 */


void setup() {
  size(400, 400);
  stroke(0);
}

void draw() {
  background(255, 255, 255);
  inscribe(200,200,100,5);
  smooth();
  saveFrame("output.png");
}

void drawCircle(float x, float y, float radius){
  strokeWeight(2);
  ellipse(x, y, 2*radius, 2*radius);
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void inscribe(float x, float y, float radius, int npoints){
  drawCircle(x, y, radius);
  polygon(x, y, radius, npoints);
}