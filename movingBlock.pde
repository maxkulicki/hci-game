int MOVIN_SQUARE_SIZE = 50;

class MovinBlock extends Obstacle
{
  float h; // rect height
  float w; // rect width
  float ceiling;
  float floor;
  int direction=1;

  MovinBlock( float ih, float iw, float iy) {
    super(iy);
    h=ih;
    w=iw;
    direction=1;
    ceiling = TOP + h/2;
    floor = BOTTOM - h/2;
  }

  MovinBlock( float iy) {
    super(iy);
    h=MOVIN_SQUARE_SIZE;
    w=MOVIN_SQUARE_SIZE;
    ceiling = TOP + h/2;
    floor = BOTTOM - h/2;
  }

  void move (float moveX) {
    super.x+=moveX;
    if (super.y>=floor||super.y<=ceiling)
      direction=direction*-1;
    super.y+=2*direction;
  } 
  
  boolean detectCollision() {
    if (p.x+(p.w/2) > x-(w/2) && p.x-(p.w/2) < x+(w/2) && p.y+(p.h/2) > y-(h/2) && p.y-(p.h/2) < y+(h/2))
      return true;
    return false;
  }

  void display() {
    fill(255, 0, 0);
    rect(super.x, super.y, w, h);
  }
  
  void effect() {
    if (shield>0)
      score+=3;
    else
      p.die();
  }
}
