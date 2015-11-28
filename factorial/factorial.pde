/**
 * Procedurally generate factorial art.
 * Based on concept by Awesometologist
 * http://awesometologist.deviantart.com/
 */

// Number of iterations to run
int depth = 2;
PGraphics pg;
PImage img;

// Setup function
void setup() {
  surface.setTitle("Factorial");
  size(500, 500);
  pg = createGraphics(500, 500);
  //surface.setResizable(true);
  stroke(0);
  noLoop();
  img = loadImage("output.png");
}

// draw
void draw() {
  pg.beginDraw();
  image(img, 0, 0);
  image(img, 25, 25);
  //points(inscribe(width/2, height/2, width/2-10,2), 5);
  //pg.endDraw();
  //pg.save("output.png");
}

// Draw a circle
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the circle
void circle(float x, float y, float radius){
  pg.strokeWeight(2);
  pg.fill(#00ffff, 50);
  pg.ellipse(x, y, 2*radius, 2*radius);
}

// Draw circles at coordinates (not to be confused with Processing point() function)
// radius - radius of the points
void points(double[][] intersections, float radius){
  pg.fill(#000000);
  for (int i = 0; i < intersections.length ; i++) {
    pg.ellipse((float) intersections[i][0], (float) intersections[i][1], 2*radius, 2*radius);
  }
}

// Draw a polygon
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the polygon
// npoints - number of points on the polygon
double[][] polygon(float x, float y, float radius, int npoints) {
  pg.fill(#ffc0cb, 200);
  double angle = TWO_PI / npoints;
  // create an array of vertices for returning to inscribe()
  double[][] vertices = new double[npoints][2];
  pg.beginShape();
  //loop on an integer to avoid precision issues
  //previously looping while a < TWO_PI, and npoints==7 caused array index violations
  for (int i = 0; i < npoints; i++) {
    double a = i * angle;
    // adding (Pi/2 - Pi/npoints) to angle ensures
    // the bottom face of the reguar polygon is parallel to the X axis
    double sx = x + cos((float) (a + (PI/2 - PI/npoints))) * radius;
    double sy = y + sin((float) (a + (PI/2 - PI/npoints))) * radius;
    vertices[i][0] = sx;
    vertices[i][1] = sy;
    pg.vertex((float) sx, (float) sy);
  }
  pg.endShape(CLOSE);
  return vertices;
}

// Inscribe a polygon in a circle
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the object
// npoints - number of points on the polygon
double[][] inscribe(float x, float y, float radius, int npoints){
  circle(x, y, radius);
  return polygon(x, y, radius, npoints);
}