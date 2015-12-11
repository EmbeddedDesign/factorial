/* Circle class
// Create circles with given position and size
*/
class Circle {
  // generate a circle at Y-Coordinate "yPos" of radius "radius"
  void generate(float yPos, float radius) {
    pg.pushMatrix();
    pg.translate(0, yPos);
    pg.ellipse(0, 0, radius, radius);
    pg.popMatrix();
  }
}