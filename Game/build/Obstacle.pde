class Obstacle 
{
  float h; // rect height
  float w ; // rect yposition
  float x; // single bar distance
  float y; // number of bars
 
 
  Obstacle( float ih, float iw, float ix, float iy) {
    h = ih;
    w = iw;
    x = ix;
    y = iy;
  }
 
 
  void move (float moveX, float moveY) {
    x+=moveX;
    y+=moveY;
  }
 
   float getX(){
     return x;
   }
 
  void display() { 
      fill(255, 0, 0);
      rect(x, y, h, w);
  }
}
