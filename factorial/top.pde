/**
 * Procedurally generate factorial art.
 * Based on concept by Awesometologist
 * http://awesometologist.deviantart.com/
 */

// Number of iterations to run
int depth = 5;
PGraphics pg;
PImage img;
Factorial factorial = new Factorial();

// Setup function
void setup() {
  surface.setTitle("Factorial");
  //commenting this because OSX complains "size cannot be used here", works fine otherwise
  //size(600, 600);
  pg = createGraphics(1000, 1000);
  pg.beginDraw();
  // This needs to be set to something that works well for give depth/size
  pg.strokeWeight(.5);
  pg.background(255);
  //fill(0,255,255,15);
  pg.noFill();
  factorial.generate(pg.width/2.0, pg.height/2.0, pg.width/4.1, depth);
  pg.endDraw();
  img = pg.get(0, 0, pg.width, pg.height);
  img.resize(width, height);
  image(img, 0, 0);
  pg.save(depth + "factorial.png");
  noLoop();
}