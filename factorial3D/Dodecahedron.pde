/* Dodecahedron
// Create a regular dodecahedron
*/
class Dodecahedron {
    
  // generate a regular dodecahedron
  float[][] generate(float size) {
    noFill();
    beginShape();
    
    float PHI = (1+ sqrt(5)) / 2;
    
    float[][] verts = new float[][]{
      { 1,   1,  1 },
      { 1,   1, -1 },
      { 1,  -1,  1 },
      { 1,  -1, -1 },
      { -1,  1,  1 },
      { -1,  1, -1 },
      { -1, -1,  1 },
      { -1, -1, -1 },
      { 0,  1/PHI, PHI },
      { 0, 1/PHI, -PHI },
      { 0, -1/PHI, PHI },
      { 0, -1/PHI, -PHI },
      { 1/PHI,  PHI, 0 },
      { 1/PHI, -PHI, 0 },
      { -1/PHI, PHI, 0 },
      { -1/PHI, -PHI, 0 },
      { PHI,  0, 1/PHI },
      { PHI, 0, -1/PHI },
      { -PHI, 0, 1/PHI },
      { -PHI, 0, -1/PHI },
    };
    
    for (int i = 0; i < verts.length; i++) {
      for (int j = 0; j < verts[0].length; j++) {
        verts[i][j] = size * verts[i][j];
      }
    }
    
    //vertex(verts[1][0],  verts[1][1], verts[1][2]);
    //vertex(verts[2][0],  verts[2][1], verts[2][2]);
    //vertex(verts[0][0],  verts[0][1], verts[0][2]);
    
    //vertex(verts[2][0],  verts[2][1], verts[2][2]);
    //vertex(verts[3][0],  verts[3][1], verts[3][2]);
    //vertex(verts[0][0],  verts[0][1], verts[0][2]);
    
    //vertex(verts[3][0],  verts[3][1], verts[3][2]);
    //vertex(verts[1][0],  verts[1][1], verts[1][2]);
    //vertex(verts[0][0],  verts[0][1], verts[0][2]);
    
    endShape();
    
    return verts;
  }
}