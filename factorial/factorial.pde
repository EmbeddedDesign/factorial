/**
 * Procedurally generate factorial art.
 * Based on concept by Awesometologist
 * http://awesometologist.deviantart.com/
 */

// Number of iterations to run
int depth = 3;
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
}

// draw
void draw() {
  baseModelGen(width/2,height/2,width/4-5);
  pg.save("output" + (2) + ".png");
  img = loadImage("output" + (2) + ".png");
  image(pg, 0, 0);
}

// Draw a circle
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the circle
void circle(float x, float y, float radius){
  pg.stroke(0);
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

// Generate a circle with a line through the center. Use the endpoints of this line as the centerpoints of two more circles
// x - X coordinate of centerpoint for center circle
// y - Y coordinate of centerpoint for center circle
// radius - radius of the center circle
void baseModelGen(float x, float y, float radius) {
  pg.beginDraw();
  pg.imageMode(CENTER);
  pg.translate(pg.width, 0);  
  pg.rotate(radians(90));
  double pts[][] = inscribe(x, y, radius, 2);
  for (int i = 0;  i < pts.length; i++) {
    
  circle((float) pts[i][0], (float) pts[i][1], radius);    
  }
  pg.endDraw();  
}

// Returns the set of rotation angles the sublayer will need to be rotated for applying to the next layer
// Array length will be equal to the layer number being passed
// n - represents the target layer, for which you need to generate n rotation values
float[] getRotationAngles(int n) {
  float[] retVals = new float[n];
  retVals[0] = PI;
  if (n % 2 == 0) retVals[0] += (TWO_PI / n) / 2;
  for (int i = 1; i < n; i++) {
    retVals[i] = retVals[i-1] + (TWO_PI / n);
  }
  return retVals;
}

// Because getRotationAngles assumes you will start with the upward facing vertex (for odd layers)
// OR clockwise one vertex from top-center (for even layers)
// we need to be able to determine which vertex in the array to begin pasting at to have the correct rotation for each paste
// vertices - array of vertices that is returned from inscribe
// outputs the integer top-level array index for the starting vertex
int getStartingVertex(double[][] vertices) {
  int index = 0;
  double minY = vertices[0][1];
  //for ODD layers, the point with the lowest Y coord will be the starting point
  for (int i = 0; i < vertices.length; i++) {
    if (vertices[i][1] < minY) {
      minY = vertices[i][1];
      index = i;
    }
  }
  if (vertices.length % 2 == 0) {
    //EVEN layer - there will be 2 points with same Y, the one with larger X is start point
    int index2 = 0;
    double minY2 = vertices[0][1];
    for (int i = 0; i < vertices.length; i++) {
      if (vertices[i][1] < minY2 && i != index) index2 = i;
    }
    if (vertices[index2][0] > vertices[index][0]) index = index2;
  }
  return index;
}