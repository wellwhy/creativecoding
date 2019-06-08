// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 1

//Variables
int sidetl = 100, sidetr = 100, sidebl = 100, sidebr = 100;
color topLeft = color(random(255), random(255), random(255));
color topRight = color(random(255), random(255), random(255));
color bottomLeft = color(random(255), random(255), random(255));
color bottomRight = color(random(255), random(255), random(255));

int tlXBound, tlYBound, trXBound, trYBound, blXBound, blYBound, brXBound, brYBound;

//Initialization
void setup()
{
  size(1000, 1000);

  //fullScreen();
}

//Main loop
void draw()
{
  clear();
  noStroke();


  fill(topLeft);
  rect(10, 10, sidetl, sidetl);

  fill(topRight);
  rect(width-10, 10, -sidetr, sidetr);

  fill(bottomRight);
  rect(width-10, height-10, -sidebr, -sidebr);

  fill(bottomLeft);
  rect(10, height-10, sidebl, -sidebl);

  tlXBound = sidetl+10;
  tlYBound = sidetl+10;

  trXBound = width-10-sidetr;
  trYBound = sidetr+10;

  blXBound = sidebl+10;
  blYBound = height-10-sidebl;

  brXBound = width-10-sidebr;
  brYBound = height-10-sidebr;

  if ( (mouseX > 10 && mouseX < tlXBound) && (mouseY > 10 && mouseY < tlYBound) )
  {
    sidetl-=2;
  }

  if ( (mouseX > trXBound && mouseX < width-10) && (mouseY > 10 && mouseY < trYBound) )
  {
    sidetr-=2;
  }

  if ( (mouseX > 10 && mouseX < blXBound) && (mouseY > blYBound && mouseY < height-10) )
  {
    sidebl-=2;
  }

  if ( (mouseX > brXBound && mouseX < width-10) && (mouseY > brYBound && mouseY < height-10) )
  {
    sidebr-=2;
  }
}


//Events/Input
void mousePressed()
{
  if (mouseButton == LEFT)
  {
    topLeft = color(random(255), random(255), random(255));
    bottomLeft = color(random(255), random(255), random(255));
  }

  if ( mouseButton == RIGHT)
  {
    topRight = color(random(255), random(255), random(255));
    bottomRight = color(random(255), random(255), random(255));
  }

  sidetl+=10;
  sidetr+=10;
  sidebl+=10;
  sidebr+=10;
}

void keyPressed()
{    
  sidetl=100;
  sidetr=100;
  sidebl=100;
  sidebr=100;
  topLeft = color(random(255), random(255), random(255));
  topRight = color(random(255), random(255), random(255));
  bottomLeft = color(random(255), random(255), random(255));
  bottomRight = color(random(255), random(255), random(255));
}

//Custom functions or methods
