import java.awt.image.*;
import java.awt.*;
import java.awt.datatransfer.*;
import javax.imageio.*;


Symbol writingSymbol = new Symbol();
int symbolWidth = 90;
int symbolHeight = 160;
float symbolWeight = 10;
color white = color(255, 255, 255);

//HEX ON AND OFF COLORS
color cHexTopRight[] = {color(215, 215, 216), color(0, 0, 1)};
color cHexRight[] = {color(215, 215, 217), color(0, 0, 2)};
color cHexBotRight[] = {color(215, 215, 218), color(0, 0, 3)};
color cHexBotLeft[] = {color(215, 215, 219), color(0, 0, 4)};
color cHexLeft[] = {color(215, 215, 220), color(0, 0, 5)};
color cHexTopLeft[] = {color(215, 215, 221), color(0, 0, 6)};

//SPOKE ON AND OFF COLORS
color cSpokeTopLeft[] = {color(215, 216, 215), color(0, 1, 0)};
color cSpokeTop[] = {color(215, 217, 215), color(0, 2, 0)};
color cSpokeTopRight[] = {color(218, 217, 215), color(0, 3, 0)};
color cSpokeMid[] = {color(215, 219, 215), color(0, 4, 0)};
color cSpokeBotLeft[] = {color(215, 220, 215), color(0, 5, 0)};
color cSpokeBot[] = {color(215, 221, 215), color(0, 6, 0)};
color cSpokeBotRight[] = {color(215, 222, 215), color(0, 7, 0)};

//TAIL ON AND OFF COLORS
color cTail[] = {color(216, 215, 215), color(1, 0, 0)};

String userHome = System.getProperty("user.home");
String savePath = userHome + "\\Pictures\\TrunicWriting\\";

int printing; // 0 = Not Printing  1 = Entering Name  2 = Arranging Frame
String fileName;

int phraseSize = 40; //CURRENTLY FITS 12 ON A LINE
Symbol phrase[] = new Symbol[phraseSize];
int phraseIndex;

void setup()
{
  size(800, 600);
  background(white);
  strokeWeight(symbolWeight);
  phraseIndex = 0;
  print(savePath);
  printing = 0;
  fileName = "";
}

void draw()
{
  background(white);
  
  if(printing < 2) //Regular symbol writing state
  {
    drawEmptySymbols(writingSymbol, (width/2)-(symbolWidth), 25, 2);
    drawSymbols(writingSymbol, (width/2)-(symbolWidth), 25, 2);
  
    for(int i = 0; i < phraseIndex; i++)
    {
      strokeWeight(symbolWeight-4);
      float symbolScale = 0.7;//0.7
      float scaledSymbolWidth = (symbolWidth*symbolScale);
      //Centre of screen, adjust for centre of symbol, adjust for number of symbols, adjusting 
      drawSymbols(phrase[i], floor((width/2)-scaledSymbolWidth/2+(scaledSymbolWidth*i)-scaledSymbolWidth/2*(phraseIndex-1)-(2*i)), 350, symbolScale);
    }
    strokeWeight(symbolWeight);
  }
  else //Arranging frame for final output
  {
    for(int i = 0; i < phraseIndex; i++)
    {
      strokeWeight(symbolWeight-4);
      float symbolScale = 0.7;//0.7
      float scaledSymbolWidth = (symbolWidth*symbolScale);
      //Centre of screen, adjust for centre of symbol, adjust for number of symbols, adjusting 
      drawSymbols(phrase[i], floor((width/2)-scaledSymbolWidth/2+(scaledSymbolWidth*i)-scaledSymbolWidth/2*(phraseIndex-1)-(2*i)), floor(height/2-(symbolHeight*symbolScale/2)), symbolScale);
    }
    save(savePath + fileName+ ".png");
    fileName = "";
    printing = 0; //Reset back to default drawing
  }
}

void drawSymbols(Symbol sourceSymbol, int posX, int posY, float scale) //Scale based on edit symbol size    //REORDER TO DRAW ALL DARK LINES ON TOP OF GREY ONES
{
  //*Drawing the Outside Hex*//
  //Top Right
  if (sourceSymbol.getHexTopRight())
  {
    stroke(cHexTopRight[1]);
    line(posX+(45*scale), posY+(25*scale), posX+(88*scale), posY+(44*scale));
  }  
  //Right -- DEPRECATED as no right side hexes exist in the language.
  //if (sourceSymbol.getHexRight())
  //{
  //  stroke(cHexRight[0]);
  //  line(posX+(88*scale), posY+(44*scale), posX+(88*scale), posY+(116*scale));
  //}
  //Bot Right
  if (sourceSymbol.getHexBotRight())
  {
    stroke(cHexBotRight[1]);
    line(posX+(88*scale), posY+(136*scale), posX+(45*scale), posY+(154*scale));
  }
  //Bot Left
  if (sourceSymbol.getHexBotLeft())
  {
    stroke(cHexBotLeft[1]);
    line(posX+(45*scale), posY+(154*scale), posX+(1*scale), posY+(136*scale));
  }
  //Left
  if (sourceSymbol.getHexLeft())
  {
    stroke(cHexLeft[1]);
    line(posX+(1*scale), posY+(136*scale), posX+(1*scale), posY+(44*scale));
  }
  //Top Left
  if (sourceSymbol.getHexTopLeft())
  {
    stroke(cHexTopLeft[1]);
    line(posX+(1*scale), posY+(44*scale), posX+(45*scale), posY+(25*scale));
  }
  
  //*Drawing the Inside Spokes*//
  if(sourceSymbol.getSpokeTopLeft())
  {
    stroke(cSpokeTopLeft[1]);
    line(posX+(1*scale), posY+(44*scale), posX+(45*scale), posY+(64*scale));
  }
  if(sourceSymbol.getSpokeTop())
  {
    stroke(cSpokeTop[1]);
    line(posX+(45*scale), posY+(25*scale), posX+(45*scale), posY+(64*scale));
  }
  if(sourceSymbol.getSpokeTopRight())
  {
    stroke(cSpokeTopRight[1]);
    line(posX+(45*scale), posY+(64*scale), posX+(88*scale), posY+(44*scale));
  }  
  if(sourceSymbol.getSpokeMid())
  {
    stroke(cSpokeMid[1]);
    line(posX+(45*scale), posY+(64*scale), posX+(45*scale), posY+(90*scale));
  }
  if(sourceSymbol.getSpokeBotRight())
  {
    stroke(cSpokeBotRight[1]);
    line(posX+(88*scale), posY+(136*scale), posX+(45*scale), posY+(118*scale));
  }
  if(sourceSymbol.getSpokeBot())
  {
    stroke(cSpokeBot[1]);
    line(posX+(45*scale), posY+(154*scale), posX+(45*scale), posY+(118*scale));
  }
  if(sourceSymbol.getSpokeBotLeft())
  {
    stroke(cSpokeBotLeft[1]);
    line(posX+(1*scale), posY+(136*scale), posX+(45*scale), posY+(118*scale));
  }
  
  //*Drawing the Tail*//
  if(sourceSymbol.getTail())
  {
    stroke(cTail[1]);
    {
      int diameter = 15;
      ellipse(posX+(45*scale), posY+(154*scale)+diameter/2, diameter*scale, diameter*scale);
    }
  }
  
  if(sourceSymbol.isFinished())
  {
    line(posX, posY+(90*scale)-symbolWeight/2, posX+(88*scale), posY+(90*scale)-symbolWeight/2);
    //line(357, 230, 444, 231);
    stroke(255,255,255);
    strokeWeight(symbolWeight);
    strokeCap(SQUARE);
    line(posX-5, posY+(101*scale)-symbolWeight/2, posX+(92*scale), posY+(101*scale)-symbolWeight/2);
    strokeCap(ROUND);
    //line(354, 240, 446, 240);
    strokeWeight(symbolWeight);
  }
  
  stroke(0, 0, 0);
}
void drawEmptySymbols(Symbol sourceSymbol, int posX, int posY, float scale) //Scale based on edit symbol size
{
  //*Drawing the Outside Hex*//
  //Top Right
  if (!sourceSymbol.getHexTopRight())
  {
    stroke(cHexTopRight[0]);
    line(posX+(45*scale), posY+(25*scale), posX+(88*scale), posY+(44*scale));
  }
  //Right -- DEPRECATED as no right side hexes exist in the language.
  //if (!sourceSymbol.getHexRight())
  //{
  //  stroke(cHexRight[1]);
  //  line(posX+(88*scale), posY+(44*scale), posX+(88*scale), posY+(116*scale));
  //}
  //Bot Right
  if (!sourceSymbol.getHexBotRight())
  {
    stroke(cHexBotRight[0]);
    line(posX+(88*scale), posY+(136*scale), posX+(45*scale), posY+(154*scale));
  }
  //Bot Left
  if (!sourceSymbol.getHexBotLeft())
  {
    stroke(cHexBotLeft[0]);
    line(posX+(45*scale), posY+(154*scale), posX+(1*scale), posY+(136*scale));
  }
  //Left
  if (!sourceSymbol.getHexLeft())
  {
    stroke(cHexLeft[0]);
    line(posX+(1*scale), posY+(136*scale), posX+(1*scale), posY+(44*scale));
  }
  //Top Left
  if (!sourceSymbol.getHexTopLeft())
  {
    stroke(cHexTopLeft[0]);
    line(posX+(1*scale), posY+(44*scale), posX+(45*scale), posY+(25*scale));
  }
  
  //*Drawing the Inside Spokes*//
  if(!sourceSymbol.getSpokeTopLeft())
  {
    stroke(cSpokeTopLeft[0]);
    line(posX+(1*scale), posY+(44*scale), posX+(45*scale), posY+(64*scale));
  }
  if(!sourceSymbol.getSpokeTop())
  {
    stroke(cSpokeTop[0]);
    line(posX+(45*scale), posY+(25*scale), posX+(45*scale), posY+(64*scale));
  }
  if(!sourceSymbol.getSpokeTopRight())
  {
    stroke(cSpokeTopRight[0]);
    line(posX+(45*scale), posY+(64*scale), posX+(88*scale), posY+(44*scale));
  }  
  if(!sourceSymbol.getSpokeMid())
  {
    stroke(cSpokeMid[0]);
    line(posX+(45*scale), posY+(64*scale), posX+(45*scale), posY+(90*scale));
  }
  if(!sourceSymbol.getSpokeBotRight())
  {
    stroke(cSpokeBotRight[0]);
    line(posX+(88*scale), posY+(136*scale), posX+(45*scale), posY+(118*scale));
  }
  if(!sourceSymbol.getSpokeBot())
  {
    stroke(cSpokeBot[0]);
    line(posX+(45*scale), posY+(154*scale), posX+(45*scale), posY+(118*scale));
  }
  if(!sourceSymbol.getSpokeBotLeft())
  {
    stroke(cSpokeBotLeft[0]);
    line(posX+(1*scale), posY+(136*scale), posX+(45*scale), posY+(118*scale));
  }
  
  //*Drawing the Tail*//
  if(!sourceSymbol.getTail())
  {
    stroke(cTail[0]);
    {
      int diameter = 15;
      ellipse(posX+(45*scale), posY+(154*scale)+diameter/2, diameter*scale, diameter*scale);
    }
  }
  
  if(finished)
  {
    line(357, 230, 444, 231);
    stroke(255,255,255);
    strokeWeight(10);
    line(354, 240, 446, 240);
    strokeWeight(symbolWeight);
  }
  
  stroke(0, 0, 0);
}

void keyPressed()
{
  if (key == ENTER)
  {
    if(printing == 0)
    {
      print("ADD SYMBOL \n");
      phrase[phraseIndex] = new Symbol(writingSymbol);
      if(writingSymbol.getSpokeTopLeft() || writingSymbol.getSpokeTop() || writingSymbol.getSpokeTopRight() || writingSymbol.getSpokeMid() || writingSymbol.getSpokeBotLeft() || writingSymbol.getSpokeBot() || writingSymbol.getSpokeBotRight() || writingSymbol.getHexTopLeft() || writingSymbol.getHexTopRight() || writingSymbol.getHexBotRight() || writingSymbol.getHexBotLeft() || writingSymbol.getHexLeft() || writingSymbol.getTail())
      {
        phrase[phraseIndex].markFinished();
      }
      phraseIndex++;
      writingSymbol.blank();
    }
    else if(printing == 1)
    {
      printing = 2;
      print("TIME TO GO!");
    }
  }
  else if(key == BACKSPACE)
  {
    if(phraseIndex > 0)
    {
      phraseIndex--;
    }
  }
  else if(keyCode == 'P')
  {
    if(printing == 0)
    {
      printing = 1;
    }
  }
  else
  {
    if (printing == 1)
    {
      fileName = fileName + key;
      print(fileName + "\n");
    }
    else //FOR DEBUG PURPOSES ONLY. TO BE REMOVED.
    {
      writingSymbol.toggleHexTopRight();
      //writingSymbol.toggleHexRight();
      writingSymbol.toggleHexBotRight();
      writingSymbol.toggleHexBotLeft();
      writingSymbol.toggleHexLeft();
      writingSymbol.toggleHexTopLeft();
      
      writingSymbol.toggleSpokeTopLeft();
      writingSymbol.toggleSpokeTop();
      writingSymbol.toggleSpokeTopRight();
      writingSymbol.toggleSpokeMid();
      writingSymbol.toggleSpokeBotLeft();
      writingSymbol.toggleSpokeBot();
      writingSymbol.toggleSpokeBotRight();
      
      writingSymbol.toggleTail();
    }
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    color c = get(mouseX, mouseY);
    
    //Hex color check//
    if (c == cHexTopRight[0] || c == cHexTopRight[1])
    {
      writingSymbol.toggleHexTopRight();
    }
    if (c == cHexRight[0] || c == cHexRight[1])
    {
      writingSymbol.toggleHexRight();
    }
    if (c == cHexBotRight[0] || c == cHexBotRight[1])
    {
      writingSymbol.toggleHexBotRight();
    }
    if (c == cHexBotLeft[0]|| c == cHexBotLeft[1])
    {
      writingSymbol.toggleHexBotLeft();
    }
    if (c == cHexLeft[0] || c == cHexLeft[1])
    {
      writingSymbol.toggleHexLeft();
    }
    if (c == cHexTopLeft[0] || c == cHexTopLeft[1])
    {
      writingSymbol.toggleHexTopLeft();
    }
    
    //Spoke color check//
    if (c == cSpokeTopRight[0] || c == cSpokeTopRight[1])
    {
      writingSymbol.toggleSpokeTopRight();
    }
    if (c == cSpokeTop[0] || c == cSpokeTop[1])
    {
      writingSymbol.toggleSpokeTop();
    }
    if (c == cSpokeTopLeft[0] || c == cSpokeTopLeft[1])
    {
      writingSymbol.toggleSpokeTopLeft();
    }
    if (c == cSpokeMid[0] || c == cSpokeMid[1])
    {
      writingSymbol.toggleSpokeMid();
    }
    if (c == cSpokeBotRight[0] || c == cSpokeBotRight[1])
    {
      writingSymbol.toggleSpokeBotRight();
    }
    if (c == cSpokeBot[0] || c == cSpokeBot[1])
    {
      writingSymbol.toggleSpokeBot();
    }
    if (c == cSpokeBotLeft[0] || c == cSpokeBotLeft[1])
    {
      writingSymbol.toggleSpokeBotLeft();
    }
    
    //Tail color check//
    if (c == cTail[0] || c == cTail[1])
    {
      writingSymbol.toggleTail();
    }
  }
}
