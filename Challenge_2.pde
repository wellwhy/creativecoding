// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 2

//Variables
int delay = 3000;
int mult = 1;

float[] ellipsesX = new float[100];
float[] ellipsesY = new float[100];
color[] storedColors = new color[100];

color tempRandomColor;
color tempRandomBackground = color (random(255), random(255), random(255));
float tempRandomX;
float tempRandomY;
String modifier = "SEIZURE";
String warning = "WARNING";
String[] variants = {"SEIZURE", "BEAVER", "EAGER", "EASTER", "LEISURE", 
  "FREEZER", "TEASER", "WEEZER", "METER", "GEEZER", "CAESAR"};

//Initialization
void setup()
{
  size(1920,1080);
  //fullScreen();
  noStroke();
  background(tempRandomBackground);

  newEllipses();
}

//Main loop
void draw()
{
  refresh();
  textAlign(CENTER);
  textSize(100);
  text(modifier + " " + warning, width/2, height/2);
  text(frameRate, width-200,height);

  if ((millis() > delay * mult))
  {
    tempRandomBackground = color (random(255), random(255), random(255));
    background(tempRandomBackground);
    newColors();
    mult++;
  }

  
}


//Events/Input
void mousePressed()
{
  modifier = variants[(int) random(variants.length - 1)];
}

//Custom functions or methods

void newEllipses()
{
  for (int i = 0; i < 100; i++)
  {
    tempRandomX = random(width);
    tempRandomY = random(height);

    tempRandomColor = color(random(255), random(255), random(255));
    storedColors[i] = tempRandomColor;

    fill(tempRandomColor);
    ellipse(tempRandomX, tempRandomY, 100, 100);

    //stores locations for refresh every 3 seconds
    ellipsesX[i] = tempRandomX;
    ellipsesY[i] = tempRandomY;

  }
}


void newColors()
{
  for (int i = 0; i < 100; i++)
  {
    tempRandomColor = color(random(255), random(255), random(255));
    fill(tempRandomColor);
    storedColors[i] = tempRandomColor;

    ellipse(ellipsesX[i], ellipsesY[i], 100, 100);
  }
}

void refresh()
{
  background(tempRandomBackground);
  
  for (int i = 0; i < 100; i++)
  {
    fill(storedColors[i]);

    ellipse(ellipsesX[i], ellipsesY[i], 100, 100);
  }
}
