class Background
{
  PImage image;
  String fileName;
  int millisBegin, elapsedTime, startTime, endTime, startTime2, endTime2;
  boolean animating, secondHappened;

  Background(String fileName)
  {
    this.fileName = fileName;
  }


  void setup()
  {
    image = loadImage(fileName);
  }

  void draw()
  {
    image(image, 0, 0);



    if (animating)
    {
      elapsedTime = millis() - millisBegin;
      if (elapsedTime >= startTime && elapsedTime <= endTime)
      {
        rect(0, 0, width, height);
      } else
      {
        if (elapsedTime >= startTime2 && elapsedTime <= endTime2)
        {
          secondHappened = true;
          rect(0, 0, width, height);
        }

        if (secondHappened) 
        {
          animating = false;
          elapsedTime = 0;
          startTime2 = 0;
          endTime2 = 0;
          secondHappened = false;
        }
      }
    }
  }


  void left()
  {
    fill(255, 0, 0);
    animating = true;
    millisBegin = millis();
    startTime = 0;
    endTime = 150;
  }

  void right()
  {
    fill(255, 0, 0);
    animating = true;
    millisBegin = millis();
    startTime = 400;
    endTime = 500;
    startTime2 = 700;
    endTime2 = 800;
  }

  void down()
  {
    fill(0, 255, 255);
    animating = true;
    millisBegin = millis();
    startTime = 0;
    endTime = 500;
  }
}