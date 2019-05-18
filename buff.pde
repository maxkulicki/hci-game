float BUFF_SIZE=25;

class Buff extends Obstacle
{
  float r; // radius
  PImage icon;
  BuffType type;

  Buff( float iR, float iY, BuffType iType) {
    super(iY);
    r = iR;
    type = iType;
    icon = getIcon();
  }

  Buff( float iy, BuffType iType) {
    super(iy);
    r = BUFF_SIZE;
    type = iType;
    icon = getIcon();
  }
  
  PImage getIcon(){
    switch(type)
    {
    case SHIELD:
      return loadImage("Tokens/Token-01.png");
    case TIME_SLOW:
      return loadImage("Tokens/Token-03.png");
    default:
      return loadImage("Tokens/Token-04.png");
    } 
  }

  void display() {  
    imageMode(CENTER);
    image(icon, x, y);
  }
  
  boolean detectCollision() {
    if (p.x+(p.w/2) > x-(r/2) && p.x-(p.w/2) < x+(r/2) && p.y+(p.h/2) > y-(r/2) && p.y-(p.h/2) < y+(r/2))
      return true;
    return false;
  }
  
  void effect() {
    switch(type)
    {
    case SHIELD:
      shield+=200;
      break;
    case TIME_SLOW:
      ROLLING_SPEED+=1.5;
      break;
    case ANTIGRAVITY:
      antigravity+=300;
    }
  }
}

public enum BuffType {
  SHIELD, TIME_SLOW, ANTIGRAVITY
}
