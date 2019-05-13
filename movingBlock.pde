int MOVIN_SQUARE_SIZE = 40;

class MovinBlock extends Obstacle
{
  float h; // rect height
  float w; // rect width
  int ceiling=30;
  int floor=height-30;
  int direction=1;
 
 
  MovinBlock( float ih, float iw, float iy) {
   super(iy);
   h=ih;
   w=iw;
   direction=1;
  }
  
  MovinBlock( float iy) {
   super(iy);
   h=50;
   w=50;
  }
 
   void move (float moveX) {
    super.x+=moveX;
    if(super.y>=floor||super.y<=ceiling)
      direction=direction*-1;
    super.y+=2*direction;
      
    
  } 
 
 
  void display() { 
      fill(255, 0, 0);
      rect(super.x, super.y, h, w);
  }
  void effect() {
    if(shield>0)
      score+=3;
    else
      p.die();
  }
}
