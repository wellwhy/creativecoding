// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 7

//Variables
PImage img1, img2, img3;
float prevMouseX, prevMouseY;
float grabX, grabY, centerX, centerY, imgCenterX, imgCenterY, dropX, dropY, grabDifX, grabDifY;
boolean holding, usingPen, drawing;
color loopColor;
int alpha;
Shape[] signature = {new Shape(2, 0, 0, 10, color(255))};

//Initialization
void setup()
{

  size(1920, 1800, P2D);
  //ortho();
  rectMode(CENTER);
  noStroke();
  img1 = loadImage("1.png");
  img3 = loadImage("3.png");
  imageMode(CENTER);  //origin of image is center
  holding = false;
  dropX = width/2;
  dropY = height/2;
  grabX = dropX;
  grabY = dropY;
  alpha = 255;
}

//Main loop
void draw()
{
  background(0);
  //////////black table
  fill(80);
  rect(0, height-600, width*26, 1200);
  fill(128);
  rect(500, height-500, 800, 800);



  if (holding) //drawing
  {
    image(img1, grabX, grabY, 500, 500); //step 1

    if (centerY > height-800 && centerX < width/2 - 100 && alpha > 0)
    {
      println(alpha);
      alpha--;
    }

    tint(255, alpha);
    image(img3, grabX, grabY, 500, 500); //step 3

    tint(255);
    centerX = grabX;
    centerY = grabY;
  } else
  {
    image(img1, dropX, dropY, 500, 500); //step 1

    if (centerY > height-800 && centerX < width/2 - 100 && alpha >= 0)
    {
      println(alpha);
      alpha--;
    } 

    tint(255, alpha);
    image(img3, dropX, dropY, 500, 500); //step 3

    tint(255);
    centerX = dropX;
    centerY = dropY;
  }

  //if (holding)
  //{
  //  for (int i = 0; i < signature.length; i++)
  //  {
  //    if (prevMouseX < mouseX)
  //      signature[i].x += mouseX - prevMouseX;
  //    else
  //      signature[i].x += prevMouseX - mouseX;
  //  }
  //  prevMouseX = mouseX;
  //}

  if (holding) //setting position
  {
    grabX = mouseX - grabDifX;
    grabY = mouseY - grabDifY;
  }

  grabDifX = mouseX - grabX;
  grabDifY = mouseY - grabY;

  if (usingPen && drawing)
  {

    signature = (Shape[]) expand(signature, signature.length + 1); //new casing
    signature[signature.length - 1] = new Shape(2, mouseX, mouseY, 10, color(0, 0, 255));
  }

  for (int i = 0; i < signature.length; i++)
  {
    signature[i].draw();
  }

  ///////////developer liquid
  fill(207, 232, 133, 100);
  rect(500, height-500, 600, 600);
  ///////////dark room red tint
  fill(color(157, 21, 21, 100));
  rect(width/2, height/2, width, height);
}


//Events/Input
void mousePressed()
{
  if (!usingPen)
  {
    if ((mouseX >= (centerX - 250) && mouseX <= (centerX + 250))
      &&
      (mouseY >= (centerY - 250) && mouseY <= (centerY + 250))
      )
    {
      holding = true;
    }
  }
}

void mouseReleased()
{
  if (!usingPen)
  {
    if (holding)
    {
      dropX = grabX;
      dropY = grabY;
      holding = false;
    }
  }

  drawing = false;
}

void mouseDragged()
{
  drawing = true;
}

void keyPressed()
{
  if (key == '1')
  {
    usingPen = false;
  }
  if (key == '2')
  {
    println("PEN MODE ACTIVATE");
    usingPen = true;
  }
}

//Custom functions or methods