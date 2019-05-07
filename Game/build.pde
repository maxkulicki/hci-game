import java.util.*;
import ddf.minim.*;
import controlP5.*; // the library we use for the start button

ControlP5 cp5;
ControlFont font;
boolean gameHasStarted = false;
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
PFont pfont;

void setup() { 
  size(600,400);
  cp5 = new ControlP5(this);
  pfont = createFont("Arial", 10, true);
  font = new ControlFont(pfont, 30);
  // create a new button with name 'startButton'
  cp5.addButton("startButton")
    .setLabel("Press to Start")
    .setFont(font)
    .setPosition(width/2-150, height/2-30)
    .setSize(300, 50)
    ;
    textSize(70);
  textAlign(CENTER, CENTER);
  minim=new Minim(this);
  in = minim.getLineIn();
}

void draw(){
  background(0);
  if (gameHasStarted == true) {
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
}

public void startButton() {
  println("The button has been clicked!");
  gameHasStarted = true;
  cp5.getController("startButton").remove();   // removes the button
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
