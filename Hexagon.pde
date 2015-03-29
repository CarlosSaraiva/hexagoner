class Hexagon
{
	float angle = 60, startAngle = 30, r;
	PShape hexagon;	
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

	void draw() 
	{
		shape(hexagon);
	}


}
