class Haiku //<>// //<>//
{
  String[] file, oneSylVerb, twoSylVerb, threeSylVerb, 
    oneSylNoun, twoSylNoun, threeSylNoun, 
    oneSylAdj, twoSylAdj, threeSylAdj;

  String haiku;
  color colorStyleGenerator, bgStyleGenerator;

  Shape[] test = new Shape[1];


  Haiku()
  {
  }


  void setup()
  {    
    noStroke();

    test[0] = new Shape((int) random(3), (int) random(4), random(width), random(height), random(20, 200), color(0));

    for (int i = 1; i < 50; i++) //shapes in the background
    {
      test = (Shape[]) expand(test, test.length + 1);
      test[test.length - 1] = new Shape((int) random(3), (int) random(4), random(width), random(height), random(20, 200), 0);
    }


    colorStyleGenerator = color(255);
    haiku = "greetings! welcome to \n non sequitur haiku code. \n press space to change me";
    file = loadStrings("text.txt");
    for (int i = 0; i < file.length; i++) //organizes words into seperate arrays
    {
      switch(i)
      {
      case 0: //verbs
        oneSylVerb = split(file[i], ',');
        break;
      case 1:
        twoSylVerb = split(file[i], ',');
        break;
      case 2:
        threeSylVerb = split(file[i], ',');
        break;
        //case 3 empy space
      case 4: //nouns
        oneSylNoun = split(file[i], ',');
        break;
      case 5:
        twoSylNoun = split(file[i], ',');
      case 6:
        threeSylNoun = split(file[i], ',');
        break;
        //case 7 empy space
      case 8: //adjectives
        oneSylAdj = split(file[i], ',');
        break;
      case 9:
        twoSylAdj = split(file[i], ',');
        break;
      case 10:
        threeSylAdj = split(file[i], ',');
        break;
      }
    }
  }

  void draw()
  {
    background(bgStyleGenerator);
    for (int i = 0; i < test.length; i++)
    {
      test[i].draw();
    }
    textSize(50);
    textAlign(CENTER);
    fill(colorStyleGenerator);
    text(haiku, width/2, (height/2)-50); //textAlign(CENTER) doesn't account for \n, must -50
  }


  //the linguistic objects of the sentence only end up being 1SylNoun and 2SylNoun, so the color is
  //based on those
  void randomize()
  {
    switch((int)random(3)) //3 different haiku structures
    {
    case 0:
      //the 2NOUN 2VERB
      //has no 2ADJ 3NOUN;
      //a 1ADJ 1NOUN it is
      haiku = "the " + twoSylNoun[(int)random(twoSylNoun.length)] + " " + twoSylVerb[(int)random(twoSylVerb.length)] + "\n" +
        "has no " + twoSylAdj[(int)random(twoSylAdj.length)] + " " + threeSylNoun[(int)random(threeSylNoun.length)] + ";" + "\n" +
        "a " + oneSylAdj[(int)random(oneSylAdj.length)] + " " + oneSylNoun[(int)random(oneSylNoun.length)] + " it is";
      break;
    case 1:
      //the 2ADJ 2NOUN,
      //it is not a 1NOUN.
      //3ADJ they 1VERB
      haiku = "the " + twoSylAdj[(int)random(twoSylAdj.length)] + " " + twoSylNoun[(int)random(twoSylNoun.length)] + ":\n" +
        "it is not a " + oneSylNoun[(int)random(oneSylNoun.length)] + ".\n" +
        threeSylAdj[(int)random(threeSylAdj.length)] + ", they " + oneSylVerb[(int)random(oneSylVerb.length)];
      break;
    case 2:
      //2VERB a 2NOUN.
      //2ADJ, 3ADJ
      //3VERB a 1NOUN
      haiku = twoSylVerb[(int)random(twoSylVerb.length)] + " a " + twoSylNoun[(int)random(twoSylNoun.length)] + ".\n" +
        twoSylAdj[(int)random(twoSylAdj.length)] + ", also " + threeSylAdj[(int)random(threeSylAdj.length)] + "\n" +
        threeSylVerb[(int)random(threeSylVerb.length)] + " a " + oneSylNoun[(int)random(oneSylNoun.length)];
      break;
    }

    //the color is determined by the first noun in this list. if you want it by the first noun
    //in the haiku, you need to make a switch checking the first line of the haiku
    if (haiku.contains("kiss")) //<>//
    {      
      bgStyleGenerator = color(#7F0000);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("knob"))
    {      
      bgStyleGenerator = color(#BF5F00);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("shnaps"))
    {      
      bgStyleGenerator = color(#FFD3CA);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("dwarf"))
    {      
      bgStyleGenerator = color(#FF6A3C);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("goose"))
    {      
      bgStyleGenerator = color(#F0D23D);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("crumb"))
    {      
      bgStyleGenerator = color(#F0A43D);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("troll"))
    {      
      bgStyleGenerator = color(#A0A43D);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("cod"))
    {      
      bgStyleGenerator = color(#B7D2A7);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("lime"))
    {      
      bgStyleGenerator = color(#6EB533);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("cream"))
    {      
      bgStyleGenerator = color(#CFC4A9);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("steel"))
    {      
      bgStyleGenerator = color(#D6DBEB);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("wraith"))
    {      
      bgStyleGenerator = color(#35C2A7);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("skin"))
    {      
      bgStyleGenerator = color(#F1C2A7);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("rhino"))
    {      
      bgStyleGenerator = color(#CAC2C4);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("hydrant"))
    {      
      bgStyleGenerator = color(#FE493E);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("talesman"))
    {      
      bgStyleGenerator = color(#CED451);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("mucus"))
    {      
      bgStyleGenerator = color(#9DD451);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("fresco"))
    {      
      bgStyleGenerator = color(#FE6261);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("bugbear"))
    {      
      bgStyleGenerator = color(#AC6261);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("piecrust"))
    {
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
      bgStyleGenerator = color(#A86C37);
    } else if (haiku.contains("playmate"))
    {      
      bgStyleGenerator = color(#A85E7D);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("shipyard"))
    {      
      bgStyleGenerator = color(#43C7FF);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("cymbal"))
    {      
      bgStyleGenerator = color(#837C31);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("defect"))
    {      
      bgStyleGenerator = color(#36232E);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("knotgrass"))
    {      
      bgStyleGenerator = color(#36582E);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    } else if (haiku.contains("kilt"))
    {      
      bgStyleGenerator = color(#87A532);
      colorStyleGenerator = color(red(bgStyleGenerator)-50, green(bgStyleGenerator)-50, blue(bgStyleGenerator)-50);
    }

    for (int i = 0; i < test.length; i++) //sets background shapes' color
    {
      test[i].c =   color(red(bgStyleGenerator)-10, green(bgStyleGenerator)-10, blue(bgStyleGenerator)-10);
    }
  }
}