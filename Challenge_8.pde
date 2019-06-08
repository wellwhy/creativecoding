// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 8

//Variables
String[] file;
Haiku generator = new Haiku();
//Initialization
void setup()
{
  size(1000, 1000, P2D);
  generator.setup();
}

//Main loop
void draw()
{
  generator.draw();
}


//Events/Input
void mousePressed()
{
}

void keyPressed()
{
  if (key == ' ')
  {
    generator.randomize();
  }
}

//Custom functions or methods