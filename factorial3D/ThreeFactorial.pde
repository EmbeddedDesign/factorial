/* ThreeFactorial class
// Test class to generate three factorial (3!)
*/
class ThreeFactorial {
  float size = 350;
  // declate/instantiate/initialize a new 2! base model
  BaseModelGen baseModelGen = new BaseModelGen();
  Tetrahedron tetra = new Tetrahedron();
  Sphere sphere = new Sphere();
  void generate() {
    pushMatrix();
    strokeWeight(5);
    tetra.generate();
    sphere.generate(0, size*2);
    baseModelGen.generate(size, size, size);
    baseModelGen.generate(size, -size, -size);
    baseModelGen.generate(-size, size, -size);
    baseModelGen.generate(-size, -size, size);
    popMatrix();
  }
}