/* Sphere Tetrahedron
// Create a regular tetrahedron
*/
class Tetrahedron {
  float size = 350;
  // generate a regular tetrahedron
  void generate() {
    noFill();
    beginShape();
    
    //vertex(size,  size, size);
    //vertex(-size,  -size, size);
    //vertex(-size,  size, -size);
    //vertex(size,  -size, -size);
    
    vertex(-size,  -size, size);
    vertex(-size,  size, -size);
    vertex(size,  size, size);
    
    vertex(-size,  size, -size);
    vertex(size,  -size, -size);
    vertex(size,  size, size);
    
    vertex(size,  -size, -size);
    vertex(-size,  -size, size);
    vertex(size,  size, size);
    
    endShape();
  }
}