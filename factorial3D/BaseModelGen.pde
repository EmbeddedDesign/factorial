/* BaseModelGen class
// Generate the base model (2!)
*/
class BaseModelGen {

  // call generate() to generate a base model
  void generate(float xPos, float yPos, float zPos, float size) {
    pushMatrix();
    translate(xPos, yPos, zPos);
    stroke(0);
    strokeWeight(2);
    line(0, size/2, 0, 0, -size/2, 0);
    Sphere sphere = new Sphere();
    
    sphere.generate(0, size/2);
    sphere.generate(size/2, size/2);
    sphere.generate(-size/2, size/2);
    sphere.generate(0, size);
    
    popMatrix();
  }
}