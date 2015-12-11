/* BaseModel
// Generate a base model (2!)
*/
class BaseModel {
  Circle circle = new Circle();
    
  // generate a base model
  void generate(float radius) {
    pg.line(0, radius/2, 0, -radius/2);
    
    circle.generate(0, radius);
    circle.generate(radius/2, radius);
    circle.generate(-radius/2, radius);
    circle.generate(0, radius*2);
  }
}