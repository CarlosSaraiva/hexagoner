class Grid{

  ArrayList<ArrayList<Hexagon>> matrix;
  int rows, cols;
  float altura, largura;

  Grid(ArrayList<ArrayList<Hexagon>> matrix)
  { 
    this.matrix = matrix;
    this.altura = matrix.get(0).get(0).r * 1.532;
    this.largura = matrix.get(0).get(0).r * 1.755;    
  }

  void draw()
  {
    float rowOffset = altura, colOffset = largura/2;

    for(ArrayList<Hexagon> col : matrix)
    {           
      pushMatrix();
      for(Hexagon row : col)
      {       
        row.draw();
        translate(this.largura, 0 );
      }     
      popMatrix();    
      
      translate(colOffset, rowOffset );
      colOffset = - colOffset;
    }
  }
}



