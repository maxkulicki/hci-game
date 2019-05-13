float BUFF_SIZE=35;

class Buff extends Obstacle
{
  float r; // radius
  BuffType type;
 
 
  Buff( float iR, float iY, BuffType iType) {
   super(iY);
   r = iR;
   type = iType;
  }

  Buff( float iy, BuffType iType) {
   super(iy);
   r = BUFF_SIZE;
   type = iType;
  }

 
  void display() { 
    switch(type)
    {
      case SHIELD:
        fill(0, 255, 0);
        break;
      case TIME_SLOW:
        fill(0, 0, 255);
        break;
      case ANTIGRAVITY:
        fill(255, 0, 255);
        break;
    }  
      circle(super.x, y, r);
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

public enum BuffType{
  SHIELD, TIME_SLOW, ANTIGRAVITY
}
