/* Factorial class
// Create a factorial begining with polygon nPoints sides
*/
class Factorial {
  Circle circle = new Circle();
  BaseModel baseModel = new BaseModel();

  void generate(float xPos, float yPos, float radius, float nPoints) {
    //pg.strokeWeight((float)depth/(1+depth-nPoints));
    pg.pushMatrix();
    double[][] vertices = new double[(int)nPoints][2];
    int i = 0;
    if (nPoints >= 3) {
      pg.translate(xPos, yPos);
      // alternatively pg.rotate(PI*(.5-1/nPoints));
      pg.rotate(((nPoints-2)*PI)/nPoints/2.0);
      float angle = TWO_PI / nPoints;
      pg.beginShape();
        for (float a = 0; a < TWO_PI; a += angle) {
          if ( i < nPoints) {
            float sx = cos(a) * radius;
            float sy = sin(a) * radius;
            vertices[i][0] = sx;
            vertices[i][1] = sy;
            pg.vertex(sx, sy);
            i++;
        }
      }
      pg.endShape(CLOSE);
      circle.generate(0, radius*2);
      circle.generate(0, radius*4);
      for (int j = 0; j < vertices.length; j++) {
       pg.pushMatrix();
       pg.translate((float)vertices[j][0], (float)vertices[j][1]);
       if (nPoints > 3) {
         // This works because magic
         pg.rotate((((nPoints-3)*PI)/(nPoints-1)/2.0) + (j*((PI)-(((nPoints-2)*PI)/nPoints))));
         generate(0, 0, radius/2, nPoints-1);
       }
       else if (nPoints == 3) {
         pg.rotate(PI/2 + (j*PI/2) + (j*PI/2/nPoints));
         baseModel.generate(radius);
       }
       pg.popMatrix();
      }
    }
    else {
      pg.pushMatrix();
      pg.translate(pg.width/2.0, pg.height/2.0);
      baseModel.generate(radius*2);
      pg.popMatrix();
    }
    pg.popMatrix();
  }
}