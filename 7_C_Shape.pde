class Shape
{
  int type;
  float x, y, size;
  color c;

  float[] yTopLeft = {height * .33};

  float[] yMiddle = new float[1];

  float[] yBotRight = new float[1];

  Shape(int type, float x, float y, float size, color c)
  {
    this.type = type;
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }

  void setup()
  {
    //for (int i = 0; yTopLeft[i] > 0; i++)
    //{
    //  xTopLeft = expand(xTopLeft, xTopLeft.length+1);
    //  xTopLeft[i] = i;

    //  yTopLeft = expand(yTopLeft, yTopLeft.length+1);
    //  yTopLeft[i] = (height * (1/3)) - (i * ((height*(1/3)) / (width * (1/3))));
    //}
    //println(yTopLeft.length);
    //println(xTopLeft.length);
  }

  void draw()
  {
    fill(c);

    switch(type) // 0 = arc, 1 = rect, 2 = ellipse
    {
    case 0:
      arc(x, y, size, size, 0, PI);
      break;
    case 1:
      rectMode(CENTER);
      rect(x, y, size, size);
      break;
    case 2:
      ellipse(x, y, size, size);
      break;
    }
  }

  void randomizeColor()
  {
    c = color(random(255), random(255), random(255));
  }

  void determineType()
  {
    //develops the top left's boundary line
    for (int i = 0; yTopLeft[i] > 0; i++)
    {
      yTopLeft = expand(yTopLeft, yTopLeft.length+1);
      yTopLeft[i+1] = (height * (.33)) - (i * ((height*(.33) / (width * (.33)))));
    }

    int forLoopCounter = 0;
    for (int i = (int) (width * .66); i < width; i++)
    {
      yBotRight = expand(yBotRight, yBotRight.length+1);
      yBotRight[forLoopCounter] = height - (forLoopCounter * ((height*(.33) / (width * (.33)))));
      forLoopCounter++;
    }

    //checks for location
    if (x <= yTopLeft.length -1)
    {
      if ( y <= yTopLeft[(int) x])
      {
        type = 1;
      }
    }

    if (x <= yTopLeft.length -1)
    {
      if ( y >= yTopLeft[(int) x])
      {

        type = 0;
      }
    }

    if (x >= yTopLeft.length -1)
    {
      if ( x <= (width * .66))
      {
        type = 0;
      }
      if ((int) x - (int)(width*.66) >= 0)
      {
        if ( y >= yBotRight[(int) x - (int)(width*.66)])
        {
          type = 2;
        } else
          type = 0;
      }
    }
  }
}