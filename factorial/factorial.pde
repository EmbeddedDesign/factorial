/**
 * Procedurally generate factorial art.
 * Based on concept by Awesometologist
 * http://awesometologist.deviantart.com/
 */

// Setup function
void setup() {
  size(400, 400);
  stroke(0);
}

// draw
void draw() {
  background(255, 255, 255);
  inscribe(200,200,100,5);
  smooth();
  saveFrame("output.png");
}

// Draw a circle
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the circle
void circle(float x, float y, float radius){
  strokeWeight(2);
  fill(#00ffff, 50);
  ellipse(x, y, 2*radius, 2*radius);
}

// Draw circles at coordinates (not to be confused with Processing point() function)
// radius - radius of the points
void points(float[][] intersections, float radius){
  fill(#000000);
  for (int i = 0; i < intersections.length ; i++) {
    ellipse(intersections[i][0], intersections[i][1], 2*radius, 2*radius);
  }
}

// Draw a polygon
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the polygon
// npoints - number of points on the polygon
void polygon(float x, float y, float radius, int npoints) {
  fill(#ffc0cb, 200);
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

// Inscribe a polygon in a circle
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the object
// npoints - number of points on the polygon
void inscribe(float x, float y, float radius, int npoints){
  circle(x, y, radius);
  polygon(x, y, radius, npoints);
}