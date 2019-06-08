// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 4

// Variables

Shape[] bonusArray = new Shape[1];
Shape loopTempShape;
int harmony;
float lightningPoint1, lightningPoint12, lightningEnd, trackDist1, trackDist2;
color[][] colorHarmonies = { {color(0, 81, 176), color(0, 87, 189), color(0, 89, 194), color(0, 82, 178), color(0, 77, 168)}, 
  {color(0, 71, 38), color(0, 84, 44), color(0, 89, 47), color(0, 74, 39), color(0, 63, 34)}, 
  {color(192, 81, 43), color(205, 87, 46), color(210, 89, 47), color(195, 83, 44), color(184, 78, 41)}  };

// Initialize
void setup()
{
  background(95);
  //fullScreen();
  size(1000, 1000);
  noStroke();

  bonusArray[0] = new Shape(random(80, 120), 2, 2, random(width), random(height), random(10, 15), random(2), colorHarmonies[harmony][(int) random(5)]);


  for (int i = 1; i < 200; i++)
  {
    bonusArray = (Shape[]) expand(bonusArray, bonusArray.length + 1);
    bonusArray[bonusArray.length - 1] = new Shape(random(80, 120), 2, 2, random(width), random(height), random(10, 15), random(2), colorHarmonies[harmony][(int) random(5)]);
  }
}

// Main loop
void draw()
{
  clear();
  background(0);

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
}

void keyPressed()
{
  lightning();
}

void lightning()
{
  fill(255, 75);
  rect(0, 0, width, height);
  lightningPoint1 = random(width);
  lightningEnd = random(height - 750, height);
  stroke(232, 238, 102);
  strokeWeight(30);


  trackDist1 = 0;
  while (trackDist1 < lightningEnd)
  {
    trackDist2 = trackDist1 + random(100, 500);   
    lightningPoint12 = lightningPoint1 + random(-500, 500);

    line(lightningPoint1, trackDist1, lightningPoint12, trackDist2);
    trackDist1 = trackDist2;
    lightningPoint1 = lightningPoint12;
  }

  trackDist1 = 0;
  trackDist2 = 0;
  lightningPoint1 = 0;
  lightningPoint12 = 0;

  noStroke();
}
