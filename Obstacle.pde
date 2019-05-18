abstract class Obstacle 
{
  float x; // single bar distance
  float y; // number of bars 

  Obstacle(float iy) {
    x = width;
    y = iy;
  }

  void move (float moveX) {
    x+=moveX;
  } 
  
  void move (float moveX, float moveY) {
    x+=moveX;
    y+=moveY;
  }

  float getX() {
    return x;
  }

  abstract boolean detectCollision();
  abstract void display();
  abstract void effect();
}
