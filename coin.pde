float COIN_SIZE=25;

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
}
