import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class hexagoner extends PApplet {



List<List<Hexagon>> hexagons = new ArrayList<List<Hexagon>>();
float raio = 30;
Grid grid;
int[][] cores = {{0xff5A5A5A, 0xffFFFFFF, 0xffFFFFFF, 0xffFC8108, 0xffFC8108, 0xff5A5A5A},
                   //{#5A5A5A, #FFFFFF, #FFFFFF, #FFFFFF, #5A5A5A, #5A5A5A},
                   //{#5A5A5A, #5A5A5A, #5A5A5A, #FC8108, #FC8108, #5A5A5A},
                   {0xffFC8108, 0xffFC8108, 0xff5A5A5A, 0xff5A5A5A, 0xffFFFFFF, 0xffFFFFFF},
                   //{#FFFFFF, #FFFFFF, #FC8108, #FC8108, #5A5A5A, #5A5A5A},
                   //{#FFFFFF, #FFFFFF, #5A5A5A, #5A5A5A, #FC8108, #FC8108},
                   //{#FFFFFF, #FFFFFF, #FFFFFF, #5A5A5A, #5A5A5A, #5A5A5A},
                  };

public void setup() {
  size(1290, 720, P2D);
  smooth(8);
  generateHexagons();
  grid = new Grid(hexagons);
}

public void draw() {
  background(255);  
  grid.draw();  

  if(frameCount % 15 == 0)
  {
    mouseClicked();
    println("teste");
  }
}

public void mouseClicked()
{
  hexagons.clear();
  generateHexagons();
}

public void generateHexagons()
{

  synchronized(hexagons)
  {
    for(int i = 0; i < 25; i++)
    {
      ArrayList<Hexagon> temp = new ArrayList<Hexagon>();
      for(int j = 0; j < 25; j++)
      {     
        temp.add(new Hexagon(raio, cores[PApplet.parseInt(random(2))]));  
      }
      hexagons.add(temp);
    }
  
  }
}
class Grid{

  List<List<Hexagon>> matrix;
  int rows, cols;
  float altura, largura;

  Grid(List<List<Hexagon>> matrix)
  { 
    this.matrix = matrix;
    this.altura = matrix.get(0).get(0).r * 1.532f;
    this.largura = matrix.get(0).get(0).r * 1.755f;    
  }

  public void draw()
  {
    float rowOffset = altura, colOffset = largura/2;

    for(List<Hexagon> col : matrix)
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



class Hexagon
{
	float angle = 60, startAngle = 30, r;
	PShape hexagon;	
	int[] cores;
	
	Hexagon(float r, int[] cores)
	{
		this.r = r;		
		this.cores = cores;
		createHexagon();
	}

	Hexagon(float r)
	{
		this.r = r;				
		createHexagon();
	}

	public void createHexagon()
	{
		hexagon = createShape(GROUP);

		for(int i = 0; i < 6; i++)
		{
			float prox = i + 1;
			PShape triangule = createShape(TRIANGLE,0, 0, cos(radians(i * angle + startAngle)) * r, sin(radians(i * angle + startAngle)) * r, cos(radians(prox * angle + startAngle)) * r, sin(radians(prox * angle + startAngle)) * r);
			triangule.setStroke(cores[i]);
			triangule.setFill(cores[i]);
			hexagon.addChild(triangule);
		}	
		
	}

	public void draw() 
	{
		shape(hexagon);
	}


}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "hexagoner" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
