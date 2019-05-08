import java.util.*;
import ddf.minim.*;
import controlP5.*; // the library we use for the start button

ControlP5 cp5;
ControlP5 cp6;
ControlFont font;
PFont pfont;

boolean gameHasStarted = false;
boolean voiceControl;

Minim minim;
AudioInput in;

final static float OBSTACLE_SIZE = 80;
final static float FALLING_SPEED = 4;
float ROLLING_SPEED = -3;
float OBST_FREQUENCY = 70;
float ACCELERATION = 0.2;

final boolean[] KEYS = new boolean[255];

int score=0;
int counter=0;
int time_passed=0;
Queue<Obstacle> ob = new ArrayDeque(); 
Player p = new Player(50, 50, 50, height);
int obstNumber=0;


void setup() { 
  size(600,400);
   cp5 = new ControlP5(this);
   cp6 = new ControlP5(this);
  pfont = createFont("Arial", 10, true);
  font = new ControlFont(pfont, 10);
  cp5.addButton("voiceButton")
    .setLabel("Voice Mode")
    .setFont(font)
    .setPosition(width/3-50, height/2-30)
    .setSize(100, 50)
    ;
    textSize(70);
  cp6.addButton("keyboardButton")
    .setLabel("Keyboard Mode")
    .setFont(font)
    .setPosition(width*2/3-50, height/2-30)
    .setSize(100, 50)
    ;
    textSize(70);
  textAlign(CENTER, CENTER);
  
  minim=new Minim(this);
  in = minim.getLineIn();
}

void draw(){
  background(0);
  if (gameHasStarted == true) {
  text(score,30,30);
  counter++;
  time_passed++;
  if(counter==OBST_FREQUENCY)
  {
     counter=0;
     float obstacleKind=random(2);
     newObstacle(obstacleKind);
     ROLLING_SPEED-=ACCELERATION;
     if(OBST_FREQUENCY>20)
       OBST_FREQUENCY-=2;
     
  }
  if(!ob.isEmpty()){
  moveObstacles();
  showObstacles();
  }
  if(voiceControl){
    float voice =abs(in.right.get(1)*70);
    p.move(FALLING_SPEED - voice);  
    print(in.right.get(1));
  }
  else{
    if(KEYS[87])
      p.move(-FALLING_SPEED);  
      else
      p.move(FALLING_SPEED);  
  }
  
  p.display();  
  }
}

public void keyboardButton() {
  gameHasStarted = true;
  voiceControl=false;
  cp6.getController("keyboardButton").remove();   // removes the button
  cp5.getController("voiceButton").remove();
} 

public void voiceButton() {
  gameHasStarted = true;
  voiceControl=true;
  cp5.getController("voiceButton").remove();   // removes the button
  cp6.getController("keyboardButton").remove();
} 


void keyPressed(){
  KEYS[keyCode] = true;
}
void keyReleased(){
  KEYS[keyCode] = false;
}


void newObstacle(float obstacleKind){
  if(obstacleKind>1)
  ob.add(new Coin(random(0, height)));
  else
  ob.add(new Block(random(0, height)));
  obstNumber+=1;  
}
  
void moveObstacles(){
  if(ob.peek().getX()<0-OBSTACLE_SIZE)
    ob.poll();
    
   for (Iterator<Obstacle> i = ob.iterator(); i.hasNext();) {
         Obstacle obstacle = i.next();
         
         obstacle.move(ROLLING_SPEED, 0);
         
         if(obstacle.x>p.x && obstacle.x<p.x+p.w && obstacle.y> p.y && obstacle.y<p.y + p.h)
           {
              if (obstacle.getClass() == Coin.class)
               score+=1;
               else
               {
               print("score: " + score);
               print(", time: ");
               print(time_passed/60);
               exit();
               }
             ob.remove(obstacle);
           }
      }
    
}

void showObstacles(){
  for (Iterator<Obstacle> i = ob.iterator(); i.hasNext();) {
         i.next().display();
      }
}
