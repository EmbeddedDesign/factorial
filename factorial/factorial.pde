/**
 * Procedurally generate factorial art.
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
void drawCircle(float x, float y, float radius){
  strokeWeight(2);
  fill(#00ffff, 50);
  ellipse(x, y, 2*radius, 2*radius);
}

// Draw a polygon
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the polygon
// npoints - number of points on the polygon
float[][] polygon(float x, float y, float radius, int npoints) {
  fill(#ffc0cb, 200);
  float angle = TWO_PI / npoints;
  // create an array of vertices for returning to inscribe()
  float[][] vertices = new float[npoints][2];
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    // adding (Pi/2 - Pi/npoints) to angle ensures
    // the bottom face of the reguar polygon is parallel to the X axis
    float sx = x + cos(a + (PI/2 - PI/npoints)) * radius;
    float sy = y + sin(a + (PI/2 - PI/npoints)) * radius;
    int i = (int) (a / angle);
    vertices[i][0] = sx;
    vertices[i][1] = sy;
    vertex(sx, sy);
  }
  endShape(CLOSE);
  return vertices;
}

// Inscribe a polygon in a circle
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the object
// npoints - number of points on the polygon
void inscribe(float x, float y, float radius, int npoints){
  drawCircle(x, y, radius);
  polygon(x, y, radius, npoints);
}