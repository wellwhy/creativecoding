// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 1

//Variables
boolean shadeMode = true; //1
boolean triadMode = false; //2
boolean compMode = false; //3
boolean tetradicMode = false; //4
int side = 250;
float r = random(255);
float g = random(255);
float b = random(255);

//shadeMode squares
color farLeft1 = color(r, g, b, random(255));
color left1 = color(r, g, b, random(255));
color right1 = color(r, g, b, random(255));
color farRight1 = color(r, g, b, random(255));

//triadMode squares
color left2 = color(r, g, b);
color middle2 = color(b, r, g);
color right2 = color(g, b, r);

//compMode squares
color left3 = color(r, g, b);
color right3 = color(b, r-g, r);

//tetradicMode squares
color farLeft4 = color(r, g, b);
color left4 = color(b, r, b);
color right4 = color(b, r-g, r);
color farRight4 = color(r, b, r);

//doesn't work
//color farLeft4 = color(r, g, b);
//color left4 = color((1/3f)*r, r, b);
//color right4 = color(b, r-g, r);
//color farRight4 = color((2/3f)*r, b, r);

//Initialization
void setup()
{
  size(2000, 1000);
}

//Main loop
void draw()
{
  clear();
  noStroke();

  if (shadeMode)
  {
    fill(farLeft1);
    rect((width/2)-125-450, (height/2)-125, side, side);

    fill(left1);
    rect((width/2)-125-150, (height/2)-125, side, side);

    fill(farRight1);
    rect((width/2)-125+150, (height/2)-125, side, side);

    fill(right1);
    rect((width/2)-125+450, (height/2)-125, side, side);
  }

  if (triadMode)
  {
    fill(left2);
    rect((width/2)-125-300, (height/2)-125, side, side);

    fill(middle2);
    rect((width/2)-125, (height/2)-125, side, side);

    fill(right2);
    rect((width/2)-125+300, (height/2)-125, side, side);
  }

  if (compMode)
  {
    fill(left3);
    rect((width/2)-125-300, (height/2)-125, side, side);

    fill(right3);
    rect((width/2)-125+300, (height/2)-125, side, side);
  }

  if (tetradicMode)
  {
    fill(farLeft4);
    rect((width/2)-125-450, (height/2)-125, side, side);

    fill(left4);
    rect((width/2)-125-150, (height/2)-125, side, side);

    fill(farRight4);
    rect((width/2)-125+150, (height/2)-125, side, side);

    fill(right4);
    rect((width/2)-125+450, (height/2)-125, side, side);
  }
}


//Events/Input
void mousePressed()
{
  if (shadeMode)
  {
    farLeft1 = color(r, g, b, random(255));
    left1 = color(r, g, b, random(255));
    right1 = color(r, g, b, random(255));
    farRight1 = color(r, g, b, random(255));
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    r = random(255);
    g = random(255);
    b = random(255);

    //set shadeMode squares
    if (shadeMode)
    {
      farLeft1 = color(r, g, b, random(255));
      left1 = color(r, g, b, random(255));
      right1 = color(r, g, b, random(255));
      farRight1 = color(r, g, b, random(255));
    }

    //set triadMode squares
    if (triadMode)
    {
      left2 = color(r, g, b);
      middle2 = color(b, r, g);
      right2 = color(g, b, r);
    }

    //set compMode squares
    if (compMode)
    {
      left3 = color(r, g, b);
      right3 = color(b, r-g, r);
    }

    //set tetradicMode squares
    if (tetradicMode)
    {
      farLeft4 = color(r, g, b);
      left4 = color(b, r, b);
      right4 = color(b, r-g, r);
      farRight4 = color(r, b, r);
    }
  }

  if (key == '1')
  {
    shadeMode = true;
    triadMode = false;
    compMode = false;
    tetradicMode = false;
  }

  if (key == '2')
  {
    shadeMode = false;
    triadMode = true;
    compMode = false;
    tetradicMode = false;
  }

  if (key == '3')
  {
    shadeMode = false;
    triadMode = false;
    compMode = true;
    tetradicMode = false;
  }

  if (key == '4')
  {
    shadeMode = false;
    triadMode = false;
    compMode = false;
    tetradicMode = true;
  }
}

//Custom functions or methods