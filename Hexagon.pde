class Hexagon
{
	float angle = 60, startAngle = 30, r;
	PShape[] hexagon = new PShape[6];	
	color[] cores;
	
	Hexagon(float r, color[] cores)
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

	void createHexagon()
	{
		for(int i = 0; i < 6; i++)
		{
			float prox = i + 1;
			hexagon[i] = createShape(TRIANGLE,0, 0, cos(radians(i * angle + startAngle)) * r, sin(radians(i * angle + startAngle)) * r, cos(radians(prox * angle + startAngle)) * r, sin(radians(prox * angle + startAngle)) * r);
			hexagon[i].setStroke(cores[i]);
			hexagon[i].setFill(cores[i]);
		}	
		
	}

	void draw() 
	{
		for(int i = 0; i < 6; i++)
		{
			shape(hexagon[i]);
		}
	}


}
