// AET310 Creative Coding Spring 2018
//Jake Engelberg
//Challenge 5
//Makeshift Cyberpunk UZI.. add possible scrollwheel functionality to rotate the gun

float slideMover, randSpeed, randRecoil, triggerMover;
boolean slideMoving, flipRecoil, drawSmoke, drawSmokeFlash;
int smokeOpacity;
PFont only;
Shape firstCasingArrayIndex, firstBulletArrayIndex; //bullet array filler shapes
Shape slide, slideInside, slideCover, topBody, topCircle, gripParent, boxBarrel, 
  magazine, triggerGuard, triggerGuardEmptySpace, trigger; //gun shapes
Shape[] casings, bullets, gunBody; //shape arrays
Shape guard;

//Initialization
void setup()
{
  noStroke();
  size(1920, 1080, P2D);
  //fullScreen(P2D);

  only = loadFont("Impact-100.vlw");
  slideMover=0;
  smokeOpacity = 50;
  slideMoving = false;
  flipRecoil = false;
  drawSmokeFlash = false;
  drawSmoke = false;
  casings = new Shape[1];
  bullets = new Shape[1];
  gunBody = new Shape[11];
  firstCasingArrayIndex = new Shape(0, height + 100, 0, 0, 0, 0, color(0), true);   //basically null so that it can at least be drawn
  firstBulletArrayIndex = new Shape(0, height + 100, 0, 0, 0, 0, color(0), true); //same here
  casings[0] = firstCasingArrayIndex;
  bullets[0] = firstBulletArrayIndex;
  //Shape(float x, float y, float xVel, float yVel, int type, float sizeX, float sizeY, color c, boolean gravity)
  slide = new Shape(0, 0, 0, 0, 1, 125, 75, color(165), false);
  slideInside = new Shape(0, 0, 0, 0, 1, 125, 75, color(0), false);
  topBody = new Shape(0, 0, 0, 0, 1, 800, 150, color(72, 72, 72), false);
  topCircle = new Shape(0, 0, 0, 0, 2, 200, topBody.c, false);
  gripParent = new Shape(slide.x - 100, slide.y, 0, 0, 1, 175, 250, color(147, 113, 86), false);
  boxBarrel = new Shape(0, 0, 0, 0, 1, 300, 250, color(224, 223, 222), false);
  slideCover = new Shape(0, 0, 0, 0, 1, 250, 100, topBody.c, false);
  magazine = new Shape(0, 0, 0, 0, 1, 100, 600, color(129), false);
  triggerGuard = new Shape(0, 0, 0, 0, 1, 165, 100, topBody.c, false);
  triggerGuardEmptySpace = new Shape(0, 0, 0, 0, 1, 120, 75, color(100), false);
  trigger = new Shape(0, 0, 0, 0, 0, 70, 70, color(155), false);
  gunBody[7] = slideCover;
  gunBody[6] = slide;
  gunBody[5] = slideInside;
  gunBody[4] = boxBarrel;
  gunBody[3] = topBody;
  gunBody[2] = topCircle;
  gunBody[1] = gripParent;
  gunBody[0] = magazine;
  gunBody[8] = triggerGuard;
  gunBody[9] = triggerGuardEmptySpace;
  gunBody[10]= trigger;
}


void draw()
{
  background(100);
  fill(212,152,255);
  textAlign(CENTER);
  textSize(400);
  textFont(only);
  text("HAUGHTIER INDUSTRIES TECHNIQUES [*] CHAMP DE TIR LABORATOIRE #0046 [*] HAUGHTIER INDUSTRIES TECHNIQUES ",width/2,200);
  assembleGunAndTrackMouse(); //sets part positions

  if (slideMoving == true) //slide animation, overrides assembleGunAndTrackMouse();
  {
    if (slideMover <= TWO_PI)
    {
      slideMoving = true;
      slide.x = map(cos(slideMover), -1, 1, mouseX - 125, mouseX);
      slideMover+= randSpeed;
      gripParent.r = map(cos(slideMover), -1, 1, randRecoil, 0); //-cos makes the recoil less smooth (which is good maybe) probably beacuse it makes it start opposite from its actual starting point (1 vs -1)
      magazine.r*=-.5; //makes magazine "rattle" by moving opposite of rest of gun
    } else 
    {
      slideMover = 0;
      gripParent.r = 0;
      slideMoving = false;
      flipRecoil = false;
    }
  }

  if (mousePressed == true)  //fires bullets, allows automatic fire
  {
    trigger.sizeX = 40;
    if (!slideMoving)
    {
      randSpeed = random(.75, 1.5); //varies firespeed between bullets
      randRecoil = random(-3, -1); //varies recoil between bullets
      if (random(-1, 1) > 0) //occasionally flips recoil
        randRecoil*=-1;

      casings = (Shape[]) expand(casings, casings.length + 1); //new casing
      casings[casings.length - 1] = new Shape(slide.x + slide.xOffset, slide.y + slide.yOffset, random(-50, 50), random(-75, -25), 1, 50, color(255, 215, 0), true);       //real locations of x and y because pin requires two values to transform 
      casings[casings.length - 1].setup();

      bullets = (Shape[]) expand(bullets, bullets.length + 1); //new bullet
      bullets[bullets.length - 1] = new Shape(topBody.x+(topBody.sizeX/2) + 50, topBody.y - 200, 400, random(-50, 50), 0, 80, 50, color(255, 170, 0), true);
    }
    drawSmoke = true;
    drawSmokeFlash = true;
    smokeOpacity =255;
    slideMoving = true;
  }


  for (int i = 0; i < bullets.length; i++) //draws bullets
  {
    bullets[i].draw();
  }


  if (drawSmoke)
    smokeCloud(1);

  for (int i = 0; i < gunBody.length; i++) //draws gun
  {
    gunBody[i].draw();
  }

  if (drawSmoke)
    smokeCloud(0);


  for (int i = 0; i < casings.length; i++) //draws bullets
  {
    casings[i].draw();
  }
  trigger.sizeX = 70;
}

void pin(Shape parent, Shape child, float xOffset, float yOffset)
{
  child.pin = true;
  child.x = parent.x;
  child.y = parent.y;
  child.r = parent.r;
  child.xOffset = xOffset;
  child.yOffset = yOffset;
  child.rDir = parent.rDir;
}

void assembleGunAndTrackMouse()
{
  for (int i = 0; i < gunBody.length; i++)
  {

    //the gripParent is the central object everything gets its location off of
    gripParent.x = mouseX;
    gripParent.y = mouseY;

    //defining locations
    pin(gripParent, topBody, 50, -200);
    pin(gripParent, slide, 25, -200);
    pin(gripParent, slideInside, 25, -200);
    pin(gripParent, boxBarrel, 400, -150);
    pin(gripParent, slideCover, -150, -200);
    pin(gripParent, topCircle, -325, -180);
    pin(gripParent, magazine, 0, 180); //175 will make it touch, but it pokes out
    pin(gripParent, triggerGuard, 80+(175/2), -75);
    pin(gripParent, triggerGuardEmptySpace, 70+(175/2), -75);
    pin(gripParent, trigger, 10+(175/2), -75);
  }
}

void smokeCloud(int type)
{
  if (!drawSmoke)
    smokeOpacity = 255;
  else
  {
    switch(type)
    {
    case 0:
      fill(200, smokeOpacity);
      for (int i = 0; i < 10; i++)
        ellipse(random((boxBarrel.x + (boxBarrel.sizeX/2) + 400) - (smokeOpacity), (boxBarrel.x + (boxBarrel.sizeX/2) + 800) + (smokeOpacity)) + smokeOpacity, random((boxBarrel.y - (boxBarrel.sizeY/2)) -300 -(smokeOpacity), (boxBarrel.y + (boxBarrel.sizeY/2) - 300)) + smokeOpacity, random(200, 300), random(200, 300));
      fill(255, 245, 152, smokeOpacity);
      for (int i = 0; i < 25; i++)
        rect(random((boxBarrel.x + (boxBarrel.sizeX/2) + 400) - (smokeOpacity), (boxBarrel.x + (boxBarrel.sizeX/2) + 800) + (smokeOpacity)) + smokeOpacity, random((boxBarrel.y - (boxBarrel.sizeY/2)) -300 -(smokeOpacity), (boxBarrel.y + (boxBarrel.sizeY/2) - 300)) + smokeOpacity, 10, 10);

      smokeOpacity-= 20;
      break;
    case 1:
      if (drawSmokeFlash)
      {
        fill(240, 150, 60);
        for (int i = 0; i < 5; i++)
          ellipse(random(boxBarrel.x + boxBarrel.sizeX/2 + 400, boxBarrel.x + boxBarrel.sizeX/2 + 500), random(boxBarrel.y - boxBarrel.sizeY/2 - 150, boxBarrel.y - boxBarrel.sizeY/2 - 50), 100, 100);
        drawSmokeFlash = false;
        break;
      }
    }
    if (smokeOpacity == 0)
      drawSmoke = false;
  }
}
