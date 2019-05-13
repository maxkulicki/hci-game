float h=60;
float base=20;

class Spike extends Obstacle
{
  float r; // radius
  boolean roof;


  Spike(boolean isRoof) {
    super(height);
    roof=isRoof;
    if(roof)
      super.y=0;
  }

 
  void display() { 
      fill(255, 0, 0);
      if(roof)
        triangle(super.x, super.y, super.x+base, 0, super.x+(base/2), h);
        else
        triangle(super.x, super.y, super.x+base, height, super.x+(base/2), height-h);
  }
  void effect() {
    if(shield>0)
      score+=3;
    else
      p.die();
  }
  boolean detectCollision(){
    if(x>=p.x && x<=p.x+p.w && y+h>= p.y && y<=p.y + p.h)
      return true;
    return false;
  };  
}
