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
    strokeWeight(3);
    
    float[][] baseModelVerts = cube.generate(size);
    
    float radiusOfCircumsphere = size * sqrt(3.0);
    sphere.generate(0, radiusOfCircumsphere);
    
    for (int i = 0; i < baseModelVerts.length; i++ ) {
     threeFactorial.generate(baseModelVerts[i][0], baseModelVerts[i][1], baseModelVerts[i][2], radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    }
    
    // circumsphere aroung the entire assmbly
    sphere.generate(0, 5 * radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    
    popMatrix();
  }
}