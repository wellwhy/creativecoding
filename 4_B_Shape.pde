class Shape
{
  int type;
  float x, y, size;
  color c;


  float[] yTopLeft = {height * .33};

  float[] yMiddle = new float[1];

  float[] yBotRight = new float[1];

  //0=up , 1=right, 2=down, 3=left
  int direction;
  int currentDirection;
  int newDirection;

  int velocity = 10;


  Shape(int type, int direction, float x, float y, float size, color c)
  {
    this.type = type;
    this.direction = direction;
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }

  void setup()
  {
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

    switch(direction)
    {
    case 0:
      y = y - velocity;
      break;
    case 1:
      x = x + velocity;
      break;
    case 2:
      y = y + velocity;
      break;
    case 3:
      x = x - velocity;
      break;
    }
    
    if(x > width+100)
      x = -100;
    if(y > height+100)
      y = -100;
    if(x < -101)
      x = width+100;
    if(y < -101)
      y = height+100;
      
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


  void decelOrAccel(int which)
  {
    //1 = accelerate, -1 = decelerate

    switch(which)
    {
    case -1:
      velocity = 0;
      break;
    case 1:
      velocity = 10;
      break;
    }
  }
  void changeDirection()
  {
    //storing currentDirection and setting a random new direction
    currentDirection = direction;
    newDirection = (int) random(4);
    while (newDirection == direction)
      newDirection = (int) random(4);

    //apply random direction, end
    direction = newDirection;
  }
}