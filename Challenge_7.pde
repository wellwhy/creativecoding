// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 7

//Variables
PImage img1, img2, img3, img4, img5, img6;
float camX, camY, dragStartX, dragStartY, finalDragX, finalDragY, rotateSpeed;
boolean speedingUp;

//Initialization
void setup()
{

  size(1920, 1080, P3D);
  //ortho();

  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");  
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");
  imageMode(CENTER);  //origin of image is center
  camX = 0;
  camY = 0;
}

//Main loop
void draw()
{
  background(0);
  translate(width/2, height/2); //changes origin from top left to center
  rotateX(-camX);
  rotateY(camY);


  //back face
  pushMatrix(); //stores the current transformation state ^
  translate(0, 0, -250);
  image(img1, 0, 0, 500, 500);
  popMatrix(); //restores the previous state from pushMatrix() ^ (removes everything inbetween)

  //front face
  pushMatrix();
  translate(0, 0, 250);
  image(img2, 0, 0, 500, 500);
  popMatrix();

  //right face
  pushMatrix();
  translate(250, 0, 0);
  rotateY(HALF_PI);
  image(img3, 0, 0, 500, 500);
  popMatrix();

  //left face
  pushMatrix();
  translate(-250, 0, 0);
  rotateY(-HALF_PI);
  image(img4, 0, 0, 500, 500);
  popMatrix();

  //top face
  pushMatrix();
  translate(0, -250, 0);
  rotateX(HALF_PI);
  image(img5, 0, 0, 500, 500);
  popMatrix();

  //bottom face
  pushMatrix();
  translate(0, 250, 0);
  rotateX(-HALF_PI);
  image(img6, 0, 0, 500, 500);
  popMatrix();


  //if (!speedingUp)
  //{
  //  if(abs(camX) > 0)
  //  {
  //    //camX += .1 * -(int)(finalDragX/abs(finalDragX)); // 1 or -1
  //    println(-(int)(finalDragX/abs(finalDragX)));
  //  }
  //  else
  //    camX = 0;

  //  if (abs(camY) > 0)
  //    camY += .1 * -(int)(finalDragY/abs(finalDragY)); // 1 or -1
  //  else
  //    camY = 0;
      
      
  //  //println("camX: " + camX);
  //  //println("camY: " + camY);
  //}

  //else
  //{
  //  if (finalDragX < 0) // negative X
  //  {
  //    if (camX >= finalDragX)
  //    {
  //      println("finalDrag: " + finalDragX + " ||| camX: " + camX);
  //      camX-=.01;
  //    }
  //  } 
  //  if (finalDragX > 0) // positive X
  //  {
  //    if (camX <= finalDragX)
  //      camX+=.01;
  //  }

  //  if (finalDragY < 0) // negative Y
  //  {
      
  //    if (camY >= finalDragY)
  //      camY-=.01;
  //  }

  //  if (finalDragY > 0) // positive Y
  //  {
      
  //    if (camY <= finalDragY)
  //      camY+=.01;
  //  }

  //  else
  //  {
  //    println("done");
  //    speedingUp = false;
  //  }
  //}

  camX = mouseY/100f;
  camY = mouseX/100f;
}


//Events/Input
void mousePressed()
{
  dragStartX = mouseX;
  dragStartY = mouseY;
}

void mouseReleased()
{
  finalDragX = (mouseX - dragStartX) / 100f;
  finalDragY = (mouseY - dragStartY) / 100f;
  speedingUp = true;
  println(finalDragX);
  println( "Y:" + finalDragY);
}

void keyPressed()
{  
  if (keyCode == UP)
    camX-=PI/12;

  if (keyCode == DOWN)
    camX+=PI/12;

  if (keyCode == LEFT)
    camY+=PI/12;

  if (keyCode == RIGHT)
    camY-=PI/12;
}

//Custom functions or methods