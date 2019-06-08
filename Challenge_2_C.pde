// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 2

//Variables
int delay = 500;
int mult = 1;

color randomColor = color(random(255),random(255),random(255));
color tempRandomBackground = color (random(255), random(255), random(255));

//Initialization
void setup()
{
  size(1920, 1080);
  //fullScreen();
  noStroke();
  background(120, 185, 237);

  startupShapes();
}

//Main loop
void draw()
{
  refresh();

  if ((millis() > delay * mult))
  {
    randomColor = color (random(255), random(255), random(255));
    mult++;
  }
}


//Custom functions or methods

void startupShapes()
{

  stroke(255, 0, 0);
  strokeWeight(100);
  line(0, height, width/3, height * .85);
  line(width/3, height * .85, width * .9, height * .9);


  line(width/3, height * .7, width / 4, height * .6);
  line(width/3, height * .85, width / 2.8, height * .6);
  line(width/3, height * .85, width / 2.9, height);

  noStroke();
  fill(randomColor);
  ellipse(width * .8, height * .8, width/10, width/10);
  ellipse(width * .82, height * .72, width/15, width/15);
  fill(0, 0, 255);
  ellipse(width * .84, height * .7, width/100, width/100);
  triangle(width * .85, height * .72, width * .89, height * .71, width * .85, height * .70);
}



void refresh()
{
  background(120, 185, 237);
  startupShapes();
  fill(0);
  textAlign(CENTER);
  textSize(100);
  text("at the very end", width/2, height * .33);
  text("of a long wandering branch", width/2, height /2 );
  text("a small #" + hex(randomColor) + " bird", width/2, height * .66);
}