/* Sphere Tetrahedron
// Create a regular tetrahedron
*/
class Tetrahedron {
  // generate a regular tetrahedron
  void generate(float size) {
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