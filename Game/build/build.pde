import java.util.*;


final static float OBSTACLE_SIZE = 50;
final static float OBST_FREQUENCY = 50; 
final static float ROLLING_SPEED = -5; 
int counter=0;
Queue<Obstacle> ob = new ArrayDeque(); 
int obstNumber=0;

void setup() { 
  size(600,400);
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
  
}

void newObstacle(){
  ob.add(new Obstacle(OBSTACLE_SIZE, OBSTACLE_SIZE, width, 100));
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
