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
    
    float[][] baseModelVerts = tetra.generate(size);
    
    float radiusOfCircumsphere = 2 * size * sqrt(3.0/8.0);
    sphere.generate(0, radiusOfCircumsphere);
    
    for (int i = 0; i < baseModelVerts.length; i++ ) {
      baseModelGen.generate(baseModelVerts[i][0], baseModelVerts[i][1], baseModelVerts[i][2], radiusOfCircumsphere);
    }
    
    popMatrix();
  }
}