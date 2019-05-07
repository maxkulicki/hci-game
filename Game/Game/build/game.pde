import java.util.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
final static float OBSTACLE_SIZE = 50;
final static float OBST_FREQUENCY = 50; 
final static float ROLLING_SPEED = -5; 
final static float FALLING_SPEED = 2;

int counter=0;
Queue<Obstacle> ob = new ArrayDeque(); 
Player p = new Player(50, 50, 50, height);
int obstNumber=0;

void setup() { 
  size(600,400);
  minim=new Minim(this);
  in = minim.getLineIn();
}

void draw(){
  background(0);
  counter++;
  if(counter==OBST_FREQUENCY)
  {
     counter=0;
     newObstacle();
  }
  if(!ob.isEmpty()){
  moveObstacles();
  showObstacles();
  }
  float voice =abs(in.right.get(1)*50);
  p.move(FALLING_SPEED - voice);
  print(in.right.get(1));

  p.display();  
}

void movePlayer(){
  
  
}

void showPlayer(){
  
  
}


void newObstacle(){
  ob.add(new Coin(random(0, height)));
  obstNumber+=1;  
}
  
void moveObstacles(){
  if(ob.peek().getX()<0-OBSTACLE_SIZE)
    ob.poll();
    
   for (Iterator<Obstacle> i = ob.iterator(); i.hasNext();) {
         i.next().move(ROLLING_SPEED, 0);
      }
    
}

void showObstacles(){
  for (Iterator<Obstacle> i = ob.iterator(); i.hasNext();) {
         i.next().display();
      }
}
