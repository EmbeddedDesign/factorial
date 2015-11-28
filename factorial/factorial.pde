/**
 * Procedurally generate factorial art.
 * Based on concept by Awesometologist
 * http://awesometologist.deviantart.com/
 */

// Number of iterations to run
int depth = 4;
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
  pg.beginDraw();
  baseModelGen(width / 2, height / 2, width / 4, 0);
  pg.save("output" + (2) + ".png");
  pg.clear();
  
  //double[][] coords = inscribe(pg.width / 2, pg.height / 2, pg.width / 4, 3, 0);
  //int start = getStartingVertex(coords);
  //float[] angles = getRotationAngles(3);
  
  //for (int i = 0; i < coords.length; i++) {
  //  int index = (i + start) % coords.length;
  //  baseModelGen((float) coords[index][0], (float) coords[index][1], pg.width / 8, angles[i]);
  //}
  //circle(pg.width / 2, pg.height / 2, pg.width / 2);
  
  generateLayerX(pg.width / 2, pg.height / 2, pg.height / 4, 0, depth);
  
  pg.save("output" + (3) + ".png");
  pg.endDraw();
  image(pg, 0, 0);
}

// Generic function to recursively build a generic layer
// x - X coord of center point
// y - Y coord of center point
// radius - radius of initial inscribe call
// theta - radial offset angle
// layer - integer layer number in set [2,)
void generateLayerX(float x, float y, float radius, double theta, int layer) {
  if (layer == 2) {
    baseModelGen(x, y, radius, (float) theta);
  } else {
    double[][] coords = inscribe(x, y, radius, layer, (float) theta);
    int start = getStartingVertex(coords);
    double[] angles = getRotationAngles(layer);
    
    for (int i = 0; i < coords.length; i++) {
      int index = (i + start) % coords.length;
      generateLayerX((float) coords[index][0], (float) coords[index][1], radius/2, angles[i]+theta, layer-1);
    }
    circle(x, y, radius*2);
  }
}

// Draw a circle
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the circle
void circle(float x, float y, float radius) {
  pg.stroke(0);
  pg.strokeWeight(1);
  pg.fill(#00ffff, 50);
  pg.ellipse(x, y, 2 * radius, 2 * radius);
}

// Draw circles at coordinates (not to be confused with Processing point() function)
// intersections - list of coordinates to draw points (intersections[i][0] = Xi / intersections[i][1] = Yi)
// radius - radius of the points
void points(double[][] intersections, float radius) {
  pg.fill(#000000);
  for (int i = 0; i < intersections.length ; i++) {
    pg.ellipse((float) intersections[i][0], (float) intersections[i][1], 2 * radius, 2 * radius);
  }
}

// Draw a polygon
// x - X coordinate of centerpoint
// y - Y coordinate of centerpoint
// radius - radius of the polygon
// npoints - number of points on the polygon
// theta - radian offset to rotate clockwise
double[][] polygon(float x, float y, float radius, int npoints, float theta) {
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
    double sx = x + cos((float) (a + (PI / 2 - PI / npoints) + theta)) * radius;
    double sy = y + sin((float) (a + (PI / 2 - PI / npoints) + theta)) * radius;
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
// theta - radian offset to rotate clockwise
double[][] inscribe(float x, float y, float radius, int npoints, float theta) {
  //we actually want the line case to point upwards, so rotate by extra PI/2
  if (npoints == 2) theta += PI / 2;
  circle(x, y, radius);
  return polygon(x, y, radius, npoints, theta);
}

// Generate a circle with a line through the center. Use the endpoints of this line as the centerpoints of two more circles
// x - X coordinate of centerpoint for center circle
// y - Y coordinate of centerpoint for center circle
// radius - radius of the center circle
// theta - radian offset to rotate whole model
void baseModelGen(float x, float y, float radius, float theta) {
  //pg.pushMatrix();
  double pts[][] = inscribe(x, y, radius, 2, theta);
  for (int i = 0;  i < pts.length; i++) {
    circle((float) pts[i][0], (float) pts[i][1], radius);    
  }
  circle(x, y, radius*2);
  //pg.popMatrix();
}

// Returns the set of rotation angles the sublayer will need to be rotated for applying to the next layer
// Array length will be equal to the layer number being passed
// n - represents the target layer, for which you need to generate n rotation values
double[] getRotationAngles(int n) {
  double[] retVals = new double[n];
  retVals[0] = PI;
  if (n % 2 == 0) retVals[0] += (PI / n);
  for (int i = 1; i < n; i++) {
    retVals[i] = retVals[i - 1] + (TWO_PI / n);
  }
  return retVals;
}

// Because getRotationAngles assumes you will start with the upward facing vertex (for odd layers)
// OR clockwise one vertex from top-center (for even layers)
// we need to be able to determine which vertex in the array to begin pasting at to have the correct rotation for each paste
// outputs the integer top-level array index for the starting vertex
// vertices - array of vertices that is returned from inscribe
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