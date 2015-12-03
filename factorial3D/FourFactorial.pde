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
    strokeWeight(2);
    
    float[][] baseModelVerts = cube.generate(size);
    
    float radiusOfCircumsphere = size * sqrt(3.0);
    // circumsphere around the cube
    sphere.generate(0, radiusOfCircumsphere);
    
    // centroid of the cube
    //sphere.generate(0, radiusOfCircumsphere/50);
    
    // The individual calls below should be generalized into a loop something like the below
    //for (int i = 0; i < baseModelVerts.length; i++ ) {
    // threeFactorial.generate(baseModelVerts[i][0], baseModelVerts[i][1], baseModelVerts[i][2], radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    //}
     
    /*
    { 1,   1,  1 }
    { 1,   1, -1 }
    { 1,  -1,  1 }
    { 1,  -1, -1 }
    { -1,  1,  1 }
    { -1,  1, -1 }
    { -1, -1,  1 }
    { -1, -1, -1 }
    */
      
    //{ 1,   1,  1 }
    pushMatrix();
    translate(baseModelVerts[0][0], baseModelVerts[0][1], baseModelVerts[0][2]);
    rotateX(PI/4);
    rotateZ(-atan(1/sqrt(2)));
    rotateY(-PI/6);
    threeFactorial.generate(0, 0, 0, radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    popMatrix();
    
    //{ 1,   1, -1 }
    pushMatrix();
    translate(baseModelVerts[1][0], baseModelVerts[1][1], baseModelVerts[1][2]);
    rotateX(-PI/4);
    rotateZ(-atan(1/sqrt(2)));
    rotateY(-PI/6);
    threeFactorial.generate(0, 0, 0, radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    popMatrix();
    
    //{ 1,  -1,  1 }
    pushMatrix();
    translate(baseModelVerts[2][0], baseModelVerts[2][1], baseModelVerts[2][2]);
    rotateX(PI/2+PI/4);
    rotateZ(-atan(1/sqrt(2)));
    rotateY(-PI/6);
    threeFactorial.generate(0, 0, 0, radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    popMatrix();
    
    //{ 1,  -1, -1 }
    pushMatrix();
    translate(baseModelVerts[3][0], baseModelVerts[3][1], baseModelVerts[3][2]);
    rotateX(-PI/2-PI/4);
    rotateZ(-atan(1/sqrt(2)));
    rotateY(-PI/6);
    threeFactorial.generate(0, 0, 0, radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    popMatrix();
    
    //{ -1,  1,  1 }
    pushMatrix();
    translate(baseModelVerts[4][0], baseModelVerts[4][1], baseModelVerts[4][2]);
    rotateX(PI/4);
    rotateZ(atan(1/sqrt(2)));
    rotateY(PI/6);
    threeFactorial.generate(0, 0, 0, radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    popMatrix();
    
    //{ -1,  1, -1 }
    pushMatrix();
    translate(baseModelVerts[5][0], baseModelVerts[5][1], baseModelVerts[5][2]);
    rotateX(-PI/4);
    rotateZ(atan(1/sqrt(2)));
    rotateY(PI/6);
    threeFactorial.generate(0, 0, 0, radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    popMatrix();
    
    //{ -1, -1,  1 }
    pushMatrix();
    translate(baseModelVerts[6][0], baseModelVerts[6][1], baseModelVerts[6][2]);
    rotateX(PI/2+PI/4);
    rotateZ(atan(1/sqrt(2)));
    rotateY(PI/6);
    threeFactorial.generate(0, 0, 0, radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    popMatrix();
    
    //{ -1, -1, -1 }
    pushMatrix();
    translate(baseModelVerts[7][0], baseModelVerts[7][1], baseModelVerts[7][2]);
    rotateX(-PI/2-PI/4);
    rotateZ(atan(1/sqrt(2)));
    rotateY(PI/6);
    threeFactorial.generate(0, 0, 0, radiusOfCircumsphere / 4 / sqrt(3.0/8.0));
    popMatrix();
    
    //circumsphere aroung the entire assembly
    sphere.generate(0, 2 * size * sqrt(3.0));
    
    popMatrix();
  }
}