/* ThreeFactorial class
// Test class to generate three factorial (3!)
*/
class ThreeFactorial {
  // declate/instantiate/initialize a new 2! base model
  BaseModelGen baseModelGen = new BaseModelGen();
  Tetrahedron tetra = new Tetrahedron();
  Sphere sphere = new Sphere();
  
  void generate(float xPos, float yPos, float zPos, float size) {
    strokeWeight(2);
    pushMatrix();
    translate(xPos, yPos, zPos);
    
    pushMatrix();
    float rotationAngle = atan((sqrt(2.0)/2.0));
    rotateX(rotationAngle);
    float[][] baseModelVerts = tetra.generate(size);
    
    float radiusOfCircumsphere = 2 * size * sqrt(3.0/8.0);
    
    // Rotation angles to centroid from each of the vertices
    /*{ 1,  0, -1/sqrt(2) }
    rotateX(-PI/2);
    rotateZ(-PI/2+rotationAngle);
      
    //{ -1, 0, -1/sqrt(2) }
    rotateX(-PI/2);
    rotateZ(-PI/2-rotationAngle);
      
    //{ 0,  1,  1/sqrt(2) }
    rotateX(rotationAngle);
      
    //{ 0, -1,  1/sqrt(2) }
    rotateX(-rotationAngle);
    */
      
    // Iteratvily place and rotae base models on vertices
    // Rotations are based upon signs of each coordinate as documented above
    for (int i = 0; i < baseModelVerts.length; i++ ) {
     pushMatrix();
     translate(baseModelVerts[i][0], baseModelVerts[i][1], baseModelVerts[i][2]);
     if (baseModelVerts[i][1] == 0.0) {
       rotateX(-PI/2);
       if (baseModelVerts[i][0] > 0) {
         rotateZ(-PI/2+rotationAngle);
       }
       else if (baseModelVerts[i][0] < 0) {
         rotateZ(-PI/2-rotationAngle);
       }
     }
     else {
       if (baseModelVerts[i][1] > 0) {
         rotateX(rotationAngle);
       }
       else if (baseModelVerts[i][1] < 0) {
         rotateX(-rotationAngle);
       }
     }
     baseModelGen.generate(0, 0, 0, radiusOfCircumsphere);
     popMatrix();
    }
    
    popMatrix();
    
    // centroid of the tetrahedron
    //sphere.generate(0, radiusOfCircumsphere/50);
    
    // circumsphere around the tetrahedron
    sphere.generate(0, radiusOfCircumsphere);
    
    // circumsphere around the entire assembly
    sphere.generate(0, radiusOfCircumsphere*2);
    
    popMatrix();
  }
}