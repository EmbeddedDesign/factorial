/* ThreeFactorial class
// Test class to generate three factorial (3!)
*/
class ThreeFactorial {
  // declate/instantiate/initialize a new 2! base model
  BaseModelGen baseModelGen = new BaseModelGen();
  Tetrahedron tetra = new Tetrahedron();
  Sphere sphere = new Sphere();
  void generate(float xPos, float yPos, float zPos, float size) {
    pushMatrix();
    translate(xPos, yPos, zPos);
    strokeWeight(5);
    tetra.generate(size);
    float radiusOfEnclosingSphere = size * sqrt(3);
    sphere.generate(0, radiusOfEnclosingSphere);
    baseModelGen.generate(size, size, size, size);
    baseModelGen.generate(size, -size, -size, size);
    baseModelGen.generate(-size, size, -size, size);
    baseModelGen.generate(-size, -size, size, size);
    popMatrix();
  }
}