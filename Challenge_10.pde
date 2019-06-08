// AET310 Creative Coding Spring 2018 //<>//
//Jake Engelberg
//Challenge 10
import gifAnimation.*;
import processing.sound.*;

//Variables
Gif menuG, menuStartG, introG, upG, downG, rightG, leftG, idle;
boolean inMenu, start, firstTime, prepareShutdown;
PImage bg; //menu;
color c;
float wiggle;
SoundFile music, begin, hit, doublehit, whiff, corruption, exit;
Background test;

//Initialization
void setup()
{
  size(968, 720, P2D);
  noStroke();
  c = color(255, 0, 0);
  inMenu = true;
  firstTime = true;

  test = new Background("background.gif");
  test.setup();


  //load sounds
  music = new SoundFile(this, "tank.mp3");
  begin = new SoundFile(this, "begin.wav");
  hit = new SoundFile(this, "hit.wav");
  doublehit = new SoundFile(this, "doublehit.wav");
  whiff = new SoundFile(this, "whiff.wav");
  corruption = new SoundFile(this, "corruption.wav");
  exit = new SoundFile(this, "exit.wav");

  //load static images
  bg = loadImage("background.gif");
  //menu = loadImage("menu.gif");

  //load gifs
  menuG = new Gif(this, "menug.gif");
  menuStartG = new Gif(this, "menustart.gif");
  introG = new Gif(this, "intromix.gif");
  introG.ignoreRepeat();
  leftG = new Gif(this, "singlekick.gif");
  leftG.ignoreRepeat();
  upG = new Gif(this, "koextended.gif");
  upG.ignoreRepeat();
  downG = new Gif(this, "duck.gif");
  downG.ignoreRepeat();
  rightG = new Gif(this, "doublekick.gif");
  rightG.ignoreRepeat();
  idle = new Gif(this, "idle.gif");

  //play the looping objects
  music.loop();
  menuG.play();
  idle.play();
}

//Main loop
void draw()
{
  background(c);

  if (!prepareShutdown) //normal
    test.draw();
  //image(bg, 0, 0);
  else         //shutting down
  {
    background(random(100, 255), 0, 0);
  }

  if (start)            //pressed space
    image(menuStartG, 0, 0);

  if (inMenu && !start)//haven't pressed space
    image(menuG, 0, 0);


  if (!menuStartG.isPlaying()) //menu gif finished
  {
    if (firstTime && start) //intro gif
    {

      firstTime = false;
      start = false;
      introG.play();
    }


    if (upG.isPlaying())
      image(upG, random(-wiggle, wiggle), random(-wiggle, wiggle));
    else if (downG.isPlaying())
      image(downG, 0, 0);
    else if (rightG.isPlaying())
      image(rightG, 0, 0);
    else if (introG.isPlaying())
      image(introG, 0, 0);
    else if (leftG.isPlaying())
      image(leftG, 0, 0);
    else //idle gif
    {
      c = color(255);
      if (!inMenu)
        image(idle, 0, 0);
    }
  }

  if (!upG.isPlaying() && prepareShutdown) //exiting
    exit();
}



//Events/Input
void keyPressed()
{
  switch(keyCode)
  {
  case UP:
    if (!upG.isPlaying())
      upG.play();
    break;
  case DOWN:
    if (!downG.isPlaying())
    {
      test.down();
      whiff.play();
      whiff.rate(random(.75, 1.25));
      whiff.amp(random(1.5, 2.5));
      downG.play();
    }
    break;
  case RIGHT:
    if (!rightG.isPlaying())
    {
      test.right();
      doublehit.play();
      doublehit.rate(random(.9, 1.1));
      doublehit.amp(random(.75, 1.25));
      rightG.play();
    }
    break;
  case LEFT:
    if (!leftG.isPlaying())
    {
      test.left();
      hit.play();
      hit.rate(random(.75, 1.25));
      hit.amp(random(.75, 1.25));
      leftG.play();
    }
    break;
  }

  if (keyCode == DOWN || keyCode == RIGHT || keyCode == LEFT)
    c = color(255, 0, 0);

  if (key == ' ' && firstTime)
  {
    c = color(255, 0, 0);
    inMenu = false;
    start = true;
    menuStartG.play();
    begin.play();
  }

  if (keyCode == UP)
  {
    music.rate(.2);
    music.amp(.5);
    wiggle = 15;
    corruption.play();
    corruption.amp(4);
    prepareShutdown = true;
  }
}