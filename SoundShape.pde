public class SoundShape
{  
  SoundFile file;
  String fileName, noise;
  char button;
  int type;
  float x, y, sizeX, sizeY, freq, wiggleX, wiggleY;
  boolean blip, isGenerated, procOverride;
  SawOsc osc;
  color c;

  SoundShape(String fileName, char button, int type, float x, float y, float sizeX, float sizeY) //file sound
  {
    this.fileName = fileName;
    this.button = button;
    this.type = type;
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    isGenerated = false;
  }

  SoundShape(String noise, float freq, char button, int type, float x, float y, float sizeX, float sizeY) //generated sound
  {
    this.noise = noise;
    this.freq = freq;
    this.button = button;
    this.type = type;
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    isGenerated = true;
  }

  void setup()
  {
    if (!isGenerated)
      file = new SoundFile(Challenge_9.this, fileName);
    else
    {
      switch(noise) // didn't add any more noises but i can
      {
      case "saw":
        osc = new SawOsc(Challenge_9.this);
        osc.freq(freq);
      }
    }
    c = color(255, 50);
  }

  void draw()
  {
    fill(c);
    switch(type) // 0 = arc, 1 = rect, 2 = ellipse
    {
    case 0:
      arc(x, y, sizeX+wiggleX, sizeY+wiggleY, 0, PI);
      break;
    case 1:
      rectMode(CENTER);
      rect(x, y, sizeX+wiggleX, sizeY+wiggleY);
      break;
    case 2:
      ellipse(x, y, sizeX+wiggleX, sizeY+wiggleY);
      break;
    }
    
    if (blip && !isGenerated) //ends the visual press
    {
      wiggleX = 0;
      wiggleY = 0;
      blip = false;
      c = color(255, 50);
      procOverride = false;
    }
    if (keyPressed && isGenerated && key == button) //allows oscillator button to be held visually
    {
      wiggleX = random(50);
      wiggleY = random(50);
    }
    
    if (procOverride) //procGen overrided keyPressed()
    {
      c = color(0, 255, 100);
      blip = true;
      wiggleX = random(50);
      wiggleY = random(50);
      file.play();
    }
  }

  void keyPressed()
  {
    if (key == button) //begins the visual press
    {
      c = color(255);
      blip = true;
      wiggleX = random(50);
      wiggleY = random(50);
      if (!isGenerated)
        file.play();
      else
        osc.play();
    }
  }

  void keyReleased()
  {
    if (isGenerated && blip) //ends the oscillator press
    {
      wiggleX = 0;
      wiggleY = 0;
      blip = false;
      c = color(50);
      osc.stop();
    }
  }
}