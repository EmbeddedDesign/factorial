/* Tetrahedron
// Create a regular tetrahedron
*/
class Tetrahedron {
    
  // generate a regular tetrahedron
  float[][] generate(float size) {
    noFill();
    beginShape();
    
    float[][] verts = new float[][]{
      { 1,  0, -1/sqrt(2) },
      { -1, 0, -1/sqrt(2) },
      { 0,  1,  1/sqrt(2) },
      { 0, -1,  1/sqrt(2) }
    };
    
    for (int i = 0; i < verts.length; i++) {
      for (int j = 0; j < verts[0].length; j++) {
        verts[i][j] = size * verts[i][j];
      }
    }
    
    vertex(verts[1][0],  verts[1][1], verts[1][2]);
    vertex(verts[2][0],  verts[2][1], verts[2][2]);
    vertex(verts[0][0],  verts[0][1], verts[0][2]);
    
    vertex(verts[2][0],  verts[2][1], verts[2][2]);
    vertex(verts[3][0],  verts[3][1], verts[3][2]);
    vertex(verts[0][0],  verts[0][1], verts[0][2]);
    
    vertex(verts[3][0],  verts[3][1], verts[3][2]);
    vertex(verts[1][0],  verts[1][1], verts[1][2]);
    vertex(verts[0][0],  verts[0][1], verts[0][2]);
    
    endShape();
    
    return verts;
  }
}