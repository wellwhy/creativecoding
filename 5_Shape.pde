class Shape
{
  int type, rDir;
  float r, x, y, xVel, yVel, sizeX, sizeY, velocity, xOffset, yOffset;
  color c;
  boolean pin, gravity;
  String complexShape;

  Shape(float x, float y, float xVel, float yVel, int type, float size, color c, boolean gravity)
  {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;

    this.type = type;
    this.sizeX = size;
    this.sizeY = size;
    this.c = c;
    this.gravity = gravity;
  }

  Shape(float x, float y, float xVel, float yVel, int type, float sizeX, float sizeY, color c, boolean gravity)
  {
    this.x = x;
    this.y = y;
    this.xVel = xVel;
    this.yVel = yVel;

    this.type = type;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.c = c;
    this.gravity = gravity;
  }

  void setup()
  {
    //sets rotation direction of bullet
    rDir = (int) random(-2, 2);
    if (rDir >= 0)
      rDir = 1;
    if (rDir < 0)
      rDir = -1;
  }

  void draw()
  {
    if (!(y>height+100))
    {
      fill(c);
      {
        if (pin)
        {
          switch(type) // 0 = arc, 1 = rect, 2 = ellipse
          {
          case 0:
            pushMatrix();
            translate(x, y);
            rotate(radians(r));
            arc(xOffset, yOffset, sizeX, sizeY, -PI/2, PI/2);
            popMatrix();
            break;
          case 1:
            //push and pop allows translates to be individually maintained
            pushMatrix();

            rectMode(CENTER);

            //what the x y position of the shape will be
            translate(x, y);

            //how many degrees the shape is rotated
            rotate(radians(r));

            //shape is drawn
            rect(xOffset, yOffset, sizeX, sizeY);

            popMatrix();
            break;
          case 2:
            pushMatrix();
            //what the x y position of the shape will be
            translate(x, y);

            //how many degrees the shape is rotated
            rotate(radians(r));

            //shape is drawn
            ellipse(xOffset, yOffset, sizeX, sizeY);

            popMatrix();
            break;
          }
        } else
        {
          switch(type) // 0 = arc, 1 = rect, 2 = ellipse
          {
          case 0:
            //lead the pin method in here by setting a shape's boolean true, you need to offset by translating the child the same as the parent, not offset, and
            // offset using arc(x,y...)
            pushMatrix();
            translate(x, y);
            rotate(radians(r));
            arc(0, 0, sizeX, sizeY, -PI/2, PI/2);
            popMatrix();
            break;
          case 1:
            //push and pop allows translates to be individually maintained
            pushMatrix();

            rectMode(CENTER);

            //what the x y position of the shape will be
            translate(x, y);

            //how many degrees the shape is rotated
            rotate(radians(r));

            //shape is drawn
            rect(0, 0, sizeX, sizeY);

            popMatrix();
            break;
          case 2:
            ellipse(x, y, sizeX, sizeY);
            break;
          }
        }


        x +=(xVel);
        y +=(yVel);

        if (gravity) //aka is a bullet
        {
          yVel+=10;
          r+= random(1, 50) * rDir;
        }
      }
    }
  }
}