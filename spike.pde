float h=60;
float base=20;
boolean roof;

class Spike extends Obstacle
{
  float r; // radius


  Spike(boolean isRoof) {
    super(0);
    roof=isRoof;
    if(roof)
      super.y=height;
  }

 
  void display() { 
      fill(255, 0, 0);
      if(roof)
        triangle(super.x, 0, super.x+base, 0, super.x+(base/2), h);
        else
        triangle(super.x, height, super.x+base, height, super.x+(base/2), height-h);
  }
}
