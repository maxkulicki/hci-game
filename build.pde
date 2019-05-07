class Player 
{
  float h; // rect height
  float w ; // rect yposition
  float x; // single bar distance
  float y; // number of bars
  float speed;
 
  Player( float ih, float iw, float ix, float iy) {
    h = ih;
    w = iw;
    x = ix;
    y = iy;
  }
 
  void move (float move) {
    y+=move;
    y=constrain(y, 0, height-50);
  }
 
   float getX(){
     return x;
   }
 
  void display() {  
      fill(255);
      rect(x, y, h, w);
  }
}
