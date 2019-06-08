// AET 310 Creative Coding Spring 2018
// Jake Engelberg
// Class Demo 6

// Variables
float rad, fov, cameraZ;
int camX, camY;
boolean stopTime;
float[] starX = {random(width)};
float[] starY = {random(height)};
float[] starZ = {random(width)};

// Initialize
void setup()
{
  float fov = PI/3;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), cameraZ/10.0, cameraZ*30.0);



  for (int i = 0; i < 100; i++)
  {
    starX = (float[]) expand(starX, starX.length + 1);
    starX[starX.length - 1] = random(-10000, 10000);

    starY = (float[]) expand(starY, starY.length + 1);
    starY[starY.length - 1] = random(-10000, 10000);

    starZ = (float[]) expand(starZ, starZ.length + 1);
    starZ[starZ.length - 1] = random(-10000, 10000);
  }

  stopTime = false;
  size(1920,1080,P3D);
  //fullScreen(P3D);
  frameRate(60);
  noStroke();
  //ortho();
  camX = -4000;
  camY = -1000;
  camera(camX, camY, -1000, 0, 0, 0, 0, 1, 0);
}

// Main loop
void draw()
{
  background(0);
  lights();

  //stars
  fill(255);
  for (int i = 0; i< starX.length; i++)
  {
    pushMatrix();
    translate(starX[i], starY[i], starZ[i]);
    sphere(random(2, 4));
    popMatrix();
  }





  rotateY(rad/10000);
  fill(255, 255, 0);
  sphere(800);

  pushMatrix();
  rotateY(rad/750);
  translate(width/2, 0, -2000);
  rotateY(rad/750);
  fill(0, 255, 255);



  translate(width/16, 0, -2200);
  sphere(25);
  popMatrix();

  pushMatrix();
  rotateY(rad/1000);
  translate(width, 0, -8000);
  fill(0, 255, 0);
  sphere(100);
  popMatrix();

  pushMatrix();
  rotateY(rad/1500);
  translate(width*(3/2), 0, 12000);
  fill(120, 100, 255);
  sphere(150);
  popMatrix();

  pushMatrix();
  rotateY(rad/2500);
  translate(width*(9/8), 0, 1612);
  fill(120, 160, 50);
  sphere(300);
  rotateY(rad/2500);
  translate(width/8, 0, 509);
  fill(0, 120, 40);
  sphere(25);
  pushMatrix();
  rotateY(rad/1000);
  translate((width/24), 0, 1259);
  fill(149, 41, 23);
  sphere(50);
  popMatrix();

  popMatrix();

  if (!stopTime)
    rad += 1;
}

// Events
void mousePressed()
{
  stopTime = !stopTime;
}

void keyPressed()
{
  if (keyCode == UP)
    camY+=1000;

  if (keyCode == DOWN)
    camY-=1000;

  if (keyCode == LEFT)
    camX-=1000;

  if (keyCode == RIGHT)
    camX+=1000;

  if (keyCode == ENTER)
  {
    rad+=100;
  }

  camera(camX, camY, -1000, 0, 0, 0, 0, 1, 0);
}

// Custom methods
