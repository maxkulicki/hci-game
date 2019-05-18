class Player 
{
  float h; // rect height
  float w ; // rect width
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
    y=constrain(y, TOP + h/2, BOTTOM - h/2);
  }

  float getX() {
    return x;
  }

  void display() {  
    fill(255);
    if (shield>0)
      fill(0, 255, 0);
    rect(x, y, w, h);
  }

  void die() {
    print("\nscore: " + score);
    print(", time: ");
    print(time_passed/60);
    updateMoney();
    gameHasStarted=false;
    score=0;
    startScreenSetup();
  }
}
