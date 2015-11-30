/* BaseModelGen class
// Generate the base model (2!)
*/
class BaseModelGen {
  //// define and initialize some variables
  //float xPos = 0.0;
  //float yPos = 0.0;
  //float zPos = 0.0;
  //// Create a new base model at the following coordinates
  //BaseModelGen () {
  //  xPos = x;
  //  yPos = y;
  //  zPos = z;
  //}
  // call generate() to generate a base model
  void generate(float xPos, float yPos, float zPos) {
    pushMatrix();
    translate(xPos, yPos, zPos);
    stroke(0);
    strokeWeight(3);
    line(0, height/4, 0, 0, -height/4, 0);
    Sphere sphere = new Sphere();
    sphere.generate(0, height/4);
    sphere.generate(height/4, height/4);
    sphere.generate(-height/4, height/4);
    sphere.generate(0, height/2);
    popMatrix();
  }
}