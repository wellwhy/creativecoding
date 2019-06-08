class Shape
{
  //0=up , 1=right, 2=down, 3=left
  int type, direction;
  int velocity = (int) random(1, 5);
  float x, y, size;
  color c;


  Shape(int type, int direction, float x, float y, float size, color c)
  {
    this.type = type;
    this.direction = direction;
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
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

    if (x > width+100) //throws shapes back in frame
      x = -100;
    if (y > height+100)
      y = -100;
    if (x < -101)
      x = width+100;
    if (y < -101)
      y = height+100;
  }
}