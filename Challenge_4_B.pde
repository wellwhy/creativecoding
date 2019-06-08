// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 3

// Variables

Shape shape1, shape2, shape3;
Shape[] bonusArray = new Shape[1];
Shape loopTempShape;
int harmony;
color[][] colorHarmonies = { {color(204, 74, 227), color(139, 61, 153), color(78, 0, 255), color(255, 223, 64), color(204, 154, 20)}  ,
                             {color(67, 105, 178), color(255, 60, 25), color(0, 87, 255), color(146, 204, 20), color(125, 178, 9)}    ,
                             {color(190, 13, 136), color(101, 12, 232), color(0, 87, 255), color(12, 232, 214), color(13, 255, 44)}  };


// Initialize
void setup()
{
  background(255);
  //fullScreen();
  size(1000,1000);
  noStroke();

  harmony = (int) random(3);
  bonusArray[0] = new Shape((int) random(3), (int) random(4), random(width), random(height), random(20, 200), colorHarmonies[harmony][(int) random(5)]);


  for (int i = 1; i < 50; i++)
  {
    bonusArray = (Shape[]) expand(bonusArray, bonusArray.length + 1);
    bonusArray[bonusArray.length - 1] = new Shape((int) random(3), (int) random(4), random(width), random(height), random(20, 200), colorHarmonies[harmony][(int) random(5)]);
  }
  println(bonusArray.length);
}

// Main loop
void draw()
{
  clear();
  background(255);

  for (int i = 0; i < bonusArray.length; i++)
  {
    bonusArray[i].draw();
  }
}

// Events
void mousePressed()
{
  if (mouseButton == LEFT)
  {
    for (int i = 0; i < bonusArray.length; i++)
    {
      if ((mouseX > bonusArray[i].x - bonusArray[i].size && mouseX < bonusArray[i].x + bonusArray[i].size) &&
        (mouseY > bonusArray[i].y - bonusArray[i].size && mouseY < bonusArray[i].y + bonusArray[i].size))
      {
        bonusArray[i].randomizeColor();
      }
    }
  }

  if (mouseButton == RIGHT)
  {
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    for (int i = 0; i < bonusArray.length; i++)
    {
      bonusArray[i].decelOrAccel(-1);
      bonusArray[i].changeDirection();
      bonusArray[i].decelOrAccel(1);
    }
  }
}
