/* Sphere class
// Create spheres with given position and size without messing up the Matrix
*/
class Sphere {
  // generate a sphere at Y-Coordinate "yPos" of radius "radius"
  void generate(float yPos, float radius) {
    sphereDetail(50);
    stroke(0);
    strokeWeight(.15);
    noFill();
    //fill(0,255,255,50);
    pushMatrix();
    translate(0, yPos, 0);
    sphere(radius);
    popMatrix();
  }
}