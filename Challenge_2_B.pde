// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 2

//Variables
int delay = 3000;
int mult = 1;

float[] ellipsesX = new float[100];
float[] ellipsesY = new float[100];

float tempOrganizer;

float tempRandomX;
float tempRandomY;
String modifier = "COOL";
String gradients = "GRADIENTS";
String[] variants = {"COOL", "RAD", "TUBULAR", "NICE", "AMAZING", 
  "SUPER DUPER", "#ERROR^&!@", "thebomb.com", "☺"};

//Initialization
void setup()
{
  size(1920,1080);
  //fullScreen();
  noStroke();
  background(255);

  newEllipses();
}

//Main loop
void draw()
{
  refresh();
  textAlign(CENTER);
  textSize(100);
  text(gradients + " ARE " + modifier, width/2, height/2);
  text(frameRate, width-200, height);
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

    //stores locations for refresh every 3 seconds
    ellipsesX[i] = tempRandomX;
    ellipsesY[i] = tempRandomY;
  }

  for (int i = 0; i < 100; i++)
  {
    for (int j = 0; j < 100; j++)
    {
      if (ellipsesX[i] < ellipsesX[j])
      {
        tempOrganizer = ellipsesX[j];
        ellipsesX[j] = ellipsesX[i];
        ellipsesX[i] = tempOrganizer;
      }
    }
  }
  println(ellipsesX);


  for (int i = 0; i<100; i ++)
  {
    fill(color(255-(2*i), 0, 0));
    ellipse(ellipsesX[i], ellipsesY[i], 100, 100);
  }
}




void refresh()
{
  background(255);

  for (int i = 0; i<100; i ++)
  {
    fill(color(255-(2*i), 0, 0));
    ellipse(ellipsesX[i], ellipsesY[i], 100, 100);
  }
}