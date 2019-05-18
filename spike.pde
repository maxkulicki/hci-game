int SPIKE_WIDTH = 245;
int SPIKE_HEIGHT = 95;

class Spike extends Obstacle
{
  float h; // rect height
  float w; // rect width
  PImage icon;

  Spike() {
    super(BOTTOM - SPIKE_HEIGHT/2);
    h=SPIKE_HEIGHT;
    w=SPIKE_WIDTH;
    switch(mode){
      case CITY:
        icon = getCity();
        break;
      case WEST:
        break;
      case MEDIEVAL:
        break;
      case FUTURE:
        break;
    }
  }

  void display() {
    imageMode(CENTER);
    image(icon, x, y);
  }
  
  void effect() {
    if (shield>0)
      score+=3;
    else
      p.die();
  }
  
  PImage getCity(){
    int choice = int(random(4));
    switch (choice){
      case 0: return loadImage("City/Trash/Trash-01.png");
      case 1: return loadImage("City/Trash/Trash-02.png");
      case 2: return loadImage("City/Trash/Trash-03.png");
      default: return loadImage("City/Trash/Trash-04.png");
    }
  }
  
  boolean detectCollision() {
    if (p.x+(p.w/2) > x-(w/2) && p.x-(p.w/2) < x+(w/2) && p.y+(p.h/2) > y-(h/2) && p.y-(p.h/2) < y+(h/2))
      return true;
    return false;
  }
}
