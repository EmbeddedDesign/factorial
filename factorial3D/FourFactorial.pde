/* FourFactorial class
// Test class to generate four factorial (4!)
*/
class FourFactorial {
  // declate/instantiate/initialize a new 2! base model
  ThreeFactorial threeFactorial = new ThreeFactorial();
  Cube cube = new Cube();
  Sphere sphere = new Sphere();
  
  void generate(float xPos, float yPos, float zPos, float size) {
    pushMatrix();
    translate(xPos, yPos, zPos);
    strokeWeight(5);
    
    float[][] baseModelVerts = cube.generate(size);
    
    //float radiusOfCircumsphere = 2 * size * sqrt(3.0/8.0);
    //sphere.generate(0, radiusOfCircumsphere);
    
    //for (int i = 0; i < baseModelVerts.length; i++ ) {
    //  threeFactorial.generate(baseModelVerts[i][0], baseModelVerts[i][1], baseModelVerts[i][2], radiusOfCircumsphere);
    //}
    
    popMatrix();
  }
}