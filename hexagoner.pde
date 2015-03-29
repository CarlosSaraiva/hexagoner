ArrayList<ArrayList<Hexagon>> hexagons = new ArrayList<ArrayList<Hexagon>>();
float raio = 30;
Grid grid;
color[][] cores = {{#5A5A5A, #FFFFFF, #FFFFFF, #FC8108, #FC8108, #5A5A5A},
                   //{#5A5A5A, #FFFFFF, #FFFFFF, #FFFFFF, #5A5A5A, #5A5A5A},
                   //{#5A5A5A, #5A5A5A, #5A5A5A, #FC8108, #FC8108, #5A5A5A},
                   {#FC8108, #FC8108, #5A5A5A, #5A5A5A, #FFFFFF, #FFFFFF},
                   //{#FFFFFF, #FFFFFF, #FC8108, #FC8108, #5A5A5A, #5A5A5A},
                   //{#FFFFFF, #FFFFFF, #5A5A5A, #5A5A5A, #FC8108, #FC8108},
                   //{#FFFFFF, #FFFFFF, #FFFFFF, #5A5A5A, #5A5A5A, #5A5A5A},
                  };


void setup() {
  size(1290, 720, P2D);
  smooth(8);
  generateHexagons();
  grid = new Grid(hexagons);
}

void draw() {
  background(255);  
  grid.draw();  

}

void mouseClicked()
{
  hexagons.clear();
  generateHexagons();
}

void generateHexagons()
{
  for(int i = 0; i < 15; i++)
  {
    ArrayList<Hexagon> temp = new ArrayList<Hexagon>();
    for(int j = 0; j < 30; j++)
    {     
      temp.add(new Hexagon(raio, cores[int(random(2))]));  
      //temp.add(new Hexagon(raio));  
      //temp.add(new Hexagon(raio, cores[0]));        
    }
    hexagons.add(temp);
  }
}