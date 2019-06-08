// AET310 Creative Coding Spring 2018 //<>//
//Jake Engelberg
//Challenge 9
import processing.sound.*;


//Variables
SoundShape[] instrument = new SoundShape[7];
SoundFile global;
int globalMult, halfMult, procMult, procHalfMult, proc16thMult, procIndex;
boolean playGlobal, procGen, procGenComplex;
float lightningPoint1, lightningPoint12, lightningEnd, trackDist1, trackDist2;

//Initialization
void setup()
{
  noStroke();
  size(1400,1400,P2D);
  //fullScreen(P2D);
  
  playGlobal = false;
  procGen = false;
  procGenComplex = false;

  //global sound files to help you make a beat
  global = new SoundFile(this, "global.wav");
  global.amp(.25);

  //the sound shapes
  instrument[0] = new SoundShape("explode.wav", '2', 2, width/2, height/2, 100, 100);
  instrument[1] = new SoundShape("trickle.wav", '1', 0, width/2 - 400, height/2, 100, 100);
  instrument[2] = new SoundShape("buzz.wav", '3', 1, width/2 + 400, height/2, 100, 100);
  instrument[3] = new SoundShape("snare.wav", '0', 1, width/2 - 200, height/2 + 400, 500, 100);
  instrument[4] = new SoundShape("saw", 92.4986, '4', 2, width/2 - 400, height/2 - 400, 100, 100);
  instrument[5] = new SoundShape("saw", 155.563, '5', 1, width/2, height/2 - 400, 100, 100);
  instrument[6] = new SoundShape("saw", 220, '6', 0, width/2 + 400, height/2 - 400, 100, 100);

  //setup the SoundShapes
  for (int i = 0; i < instrument.length; i++)
    instrument[i].setup();
}

//Main loop
void draw()
{
  background(0);

  if (millis() > 2500 * globalMult) //EVERY 2.5 SECONDS... counts up the global loop and plays if enabled
  {
    globalMult++;
    if (playGlobal)
    {
      lightning();
      global.play();
    }
  }

  if (playGlobal) //EVERY FRAME... draws the global shape on or off
  {
    fill(0, 100, 255);
    ellipse(width/2 + 400, height/2 + 400, 100, 100);
  } else
  {
    fill(0, 100, 255, 100);
    ellipse(width/2 + 400, height/2 + 400, 100, 100);
  }

  for (int i = 0; i < instrument.length; i++) //EVERY FRAME... draws the shapes
    instrument[i].draw();

  //if (millis() > (1250 * halfMult) + 612.5) //EVERY 1.25 SECONDS... counts up twice as fast as the global loop and plays/draws the snare offset by a beat if enabled
  //{
  //  halfMult++;
  //  if (playGlobal)                                      //UNUSED, SOUNDS BAD
  //  {
  //    fill(0, 100, 255);
  //    rect(width/2 - 200, height/2 + 400, 500, 100);
  //    instrument[3].file.play();
  //  }
  //}


  if (millis() > 625 * procMult) //EVERY 1.25 SECONDS... counts up twice as fast as the global loop and if procGen, will play a random sound on quarter notes
  {
    procMult++;
    if (procGen)
    {
      procIndex = (int) random(instrument.length - 3);
      instrument[procIndex].procOverride = true;
    }
  }

  if (millis() > (625 * procHalfMult) + 312.5) //EVERY 1.25 SECONDS... counts up twice as fast as the global loop and if procGen, will play a random sound on some upbeat quarter notes
  {
    procHalfMult++;
    if (procGen && random(1) > .5)
    {
      procIndex = (int) random(instrument.length - 3);
      instrument[procIndex].procOverride = true;
    }
  }

  if (millis() > (312.5 * proc16thMult) + 156.25) //EVERY .625 SECONDS... counts up twice as fast as the global loop and if procGen, will play a random sound on some upbeat eight notes quarter notes
  {
    proc16thMult++;
    if (procGen && procGenComplex && random(1) > .75)
    {
      procIndex = (int) random(instrument.length - 3);
      instrument[procIndex].procOverride = true;
    }
  }
}


//Events/Input


void keyPressed()
{
  if (key == '.') //toggles the global helper
    playGlobal = !playGlobal;

  if (keyCode == ENTER) //toggles the procedural generator
  {
    fill(color(0, 255, 100, 100));
    rect(width/2 + 800, height/2 + 200, 100, 500);
    procGen = !procGen;
  }

  if (keyCode == UP) //enables 16th notes on the procedural generator
  {
    if (procGen) {
      fill(color(0, 255, 100, 100));
      rect(width/2 - 800, height/2 + 375, 150, 50);
    }
    procGenComplex = true;
  }
  if (keyCode == DOWN) //disables 16th notes on the procedural generator
  {
      if (procGen) {
        fill(color(0, 255, 100, 100));
        rect(width/2 - 800, height/2 + 425, 150, 50);
      }
      procGenComplex = false;
  }

  for (int i = 0; i < instrument.length; i++)
    instrument[i].keyPressed();
}

void keyReleased()
{
  for (int i = 0; i < instrument.length; i++)
    instrument[i].keyReleased();
}

void lightning()
{
  fill(255, 75);
  rect(width/2, height/2, width, height);
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
