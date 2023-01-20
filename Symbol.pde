public class Symbol
{
  private boolean hexTopLeft, hexTopRight, hexRight, hexBotRight, hexBotLeft, hexLeft;
  private boolean spokeTopLeft, spokeTop, spokeTopRight, spokeMid, spokeBotRight, spokeBot, spokeBotLeft;
  private boolean tail;
  private int[] position = new int[2];
  private boolean finished;
  
  public boolean getHexTopLeft(){  return hexTopLeft;  }
  public boolean getHexTopRight(){  return hexTopRight;  }
  public boolean getHexRight(){  return hexRight;  }
  public boolean getHexBotRight(){  return hexBotRight;  }
  public boolean getHexBotLeft(){  return hexBotLeft;  }
  public boolean getHexLeft(){  return hexLeft;  }
  public boolean getSpokeTopLeft(){  return  spokeTopLeft;  }
  public boolean getSpokeTop(){  return spokeTop;  }
  public boolean getSpokeTopRight(){  return spokeTopRight;  } 
  public boolean getSpokeMid(){  return spokeMid;  }
  public boolean getSpokeBotRight(){  return spokeBotRight;  }
  public boolean getSpokeBot(){  return spokeBot;  }
  public boolean getSpokeBotLeft(){  return spokeBotLeft;  }
  public boolean getTail(){  return tail;  }
  public int[] getPosition(){  return position;  }
  public boolean isFinished(){  return finished;  }
  
  public void toggleHexTopLeft(){  hexTopLeft = !hexTopLeft;  }
  public void toggleHexTopRight(){  hexTopRight = !hexTopRight;  }
  public void toggleHexRight(){  hexRight = !hexRight;  }
  public void toggleHexBotRight(){  hexBotRight = !hexBotRight;  }
  public void toggleHexBotLeft(){  hexBotLeft = !hexBotLeft;  }
  public void toggleHexLeft(){  hexLeft = !hexLeft;  }
  public void toggleSpokeTopLeft(){  spokeTopLeft = !spokeTopLeft;  }
  public void toggleSpokeTop(){  spokeTop = !spokeTop;  }
  public void toggleSpokeTopRight(){  spokeTopRight = !spokeTopRight;  }
  public void toggleSpokeMid(){  spokeMid = !spokeMid;  }
  public void toggleSpokeBotRight(){  spokeBotRight = !spokeBotRight;  }
  public void toggleSpokeBot(){  spokeBot = !spokeBot;  }
  public void toggleSpokeBotLeft(){  spokeBotLeft = !spokeBotLeft;  }
  public void toggleTail(){  tail = !tail;  }
  public void setPosition(int[] val){  position = val;  }
  public void markFinished(){  finished = true;  }
  
  //Default Constructor//
  public Symbol()
  {
     position[0] = 0;
     position[1] = 0;
     hexTopLeft = false; hexTopRight = false; hexRight = false; hexBotRight = false; hexBotLeft = false; hexLeft = false;
     spokeTopLeft = false; spokeTop = false; spokeTopRight = false; spokeMid = false; spokeBotRight = false; spokeBot = false; spokeBotLeft = false;
     tail = false;
     finished = false;
  }
  
  //Constructor with Position//
  public Symbol(int inX, int inY)
  {
     position[0] = inX;
     position[1] = inY;
     hexTopLeft = false; hexTopRight = false; hexRight = false; hexBotRight = false; hexBotLeft = false; hexLeft = false;
     spokeTopLeft = false; spokeTop = false; spokeTopRight = false; spokeMid = false; spokeBotRight = false; spokeBot = false; spokeBotLeft = false;
     tail = false;
     finished = false;
  }
  
  //Copy Constructor//
  public Symbol(Symbol inSymbol)
  {
     position[0] = 0;
     position[1] = 0;
     hexTopLeft = inSymbol.getHexTopLeft(); hexTopRight = inSymbol.getHexTopRight(); hexRight = inSymbol.getHexRight(); hexBotRight = inSymbol.getHexBotRight(); hexBotLeft = inSymbol.getHexBotLeft(); hexLeft = inSymbol.getHexLeft();
     spokeTopLeft = inSymbol.getSpokeTopLeft(); spokeTop = inSymbol.getSpokeTop(); spokeTopRight = inSymbol.getSpokeTopRight(); spokeMid = inSymbol.getSpokeMid(); spokeBotRight = inSymbol.getSpokeBotRight(); spokeBot = inSymbol.getSpokeBot(); spokeBotLeft = inSymbol.getSpokeBotLeft();
     tail = inSymbol.getTail();
     finished = inSymbol.isFinished();
  }
  
  public void blank()
  {
    hexTopLeft = false; hexTopRight = false; hexRight = false; hexBotRight = false; hexBotLeft = false; hexLeft = false;
    spokeTopLeft = false; spokeTop = false; spokeTopRight = false; spokeMid = false; spokeBotRight = false; spokeBot = false; spokeBotLeft = false;
    tail = false;
  }
}
