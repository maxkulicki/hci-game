int SQUARE_SIZE = 50;

class Block extends Obstacle
{
  float h; // rect height
  float w; // rect width
 
 
  Block( float ih, float iw, float iy) {
   super(iy);
   h=ih;
   w=iw;
  }
  
  Block( float iy) {
   super(iy);
   h=50;
   w=50;
  }
 
  void display() { 
      fill(255, 0, 0);
      rect(super.x, y, h, w);
  }
}
