float COIN_SIZE=35;

class Coin extends Obstacle
{
  float r; // radius

  Coin( float ir, float iy) {
    super(iy);
    r = ir;
  }

  Coin( float iy) {
    super(iy);
    r = COIN_SIZE;
  }

  void display() { 
    fill(255, 255, 0);
    circle(super.x, y, r);
  }
  
   boolean detectCollision() {
    if (p.x+(p.w/2) > x-r && p.x-(p.w/2) < x+r && p.y+(p.h/2) > y-r && p.y-(p.h/2) < y+r)
      return true;
    return false;
  }
  
  void effect() {
    score+=1;
  }
}
