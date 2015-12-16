/* Factorial class
// Create a factorial begining with polygon nPoints sides
*/
class Factorial {
  Circle circle = new Circle();
  BaseModel baseModel = new BaseModel();

  void generate(float xPos, float yPos, float radius, float nPoints) {
    //pg.strokeWeight((float)depth/(1+depth-nPoints));
    pg.pushMatrix();
    if (nPoints >= 3) {
      double[][] vertices = this.drawPolygon(xPos, yPos, radius, nPoints);
      circle.generate(0, radius*2);
      circle.generate(0, radius*4);
      this.populateVertices(vertices, radius, nPoints);
    }
    else {
      pg.pushMatrix();
      pg.translate(pg.width/2.0, pg.height/2.0);
      baseModel.generate(radius*2);
      pg.popMatrix();
    }
    pg.popMatrix();
  }

  double[][] drawPolygon(float xPos, float yPos, float radius, float nPoints) {
    double[][] vertices = new double[(int)nPoints][2];
    pg.translate(xPos, yPos);
    pg.rotate(((nPoints-2)*PI)/nPoints/2.0); //alternative pg.rotate(PI*(.5-1/nPoints));
    double angle = TWO_PI / nPoints;
    pg.beginShape();
    for(int i=0; i<nPoints; i++) {
      double a = i * angle;
      vertices[i][0] = cos((float)a) * radius;
      vertices[i][1] = sin((float)a) * radius;
      pg.vertex((float)vertices[i][0], (float)vertices[i][1]);
    }
    pg.endShape(CLOSE);
    return vertices;
  }

  void populateVertices(double vertices[][], float radius, float nPoints) {
    for (int i = 0; i < vertices.length; i++) {
      pg.pushMatrix();
      pg.translate((float)vertices[i][0], (float)vertices[i][1]);
      if (nPoints > 3) {
        //this works because magic
        pg.rotate((((nPoints-3)*PI)/(nPoints-1)/2.0) + (i*((PI)-(((nPoints-2)*PI)/nPoints))));
        this.generate(0, 0, radius/2, nPoints-1);
      } else {
        pg.rotate(PI/2 + (i*PI/2) + (i*PI/2/nPoints));
        baseModel.generate(radius);
      }
      pg.popMatrix();
    }
  }
}