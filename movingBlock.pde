int MOVIN_SQUARE_SIZE = 80;

class MovinBlock extends Obstacle
{
  float r; // radius
  float ceiling;
  float floor;
  int direction=1;

  MovinBlock( float ih, float iw, float iy) {
    super(iy);
    r=ih;
    direction=1;
    ceiling = TOP + r;
    floor = BOTTOM - r;
  }

  MovinBlock( float iy) {
    super(iy);
    r=MOVIN_SQUARE_SIZE;
    ceiling = TOP + r;
    floor = BOTTOM - r;
  }

  void move (float moveX) {
    super.x+=moveX;
    if (super.y>=floor||super.y<=ceiling)
      direction=direction*-1;
    super.y+=2*direction;
  } 
  
   boolean detectCollision() {
    if (p.x+(p.w/2) > x-(r/2) && p.x-(p.w/2) < x+(r/2) && p.y+(p.h/2) > y-(r/2) && p.y-(p.h/2) < y+(r/2))
      return true;
    return false;
  }

  void display() {
    fill(255, 0, 0);
    ellipse(super.x, super.y, r, r);
  }
  
  void effect() {
    if (shield>0)
      score+=3;
    else
      p.die();
  }
}
