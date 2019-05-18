float COIN_SIZE=50;

class Coin extends Obstacle
{
  float r; // radius
  PImage icon;

  Coin( float ir, float iy) {
    super(iy);
    icon = loadImage("Tokens/Token-02.png");
    r = ir;
  }

  Coin( float iy) {
    super(iy);
    icon = loadImage("Tokens/Token-02.png");
    r = COIN_SIZE;
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
    score+=1;
  }
}
