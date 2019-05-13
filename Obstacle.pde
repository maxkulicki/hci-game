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
 
   float getX(){
     return x;
   }
   
  boolean detectCollision(){
    if(x>=p.x && x<=p.x+p.w && y>= p.y && y<=p.y + p.h)
      return true;
    return false;
  };
  abstract void display();
  abstract void effect();
  
}
