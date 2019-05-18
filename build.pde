import java.util.*;
import ddf.minim.*;
import controlP5.*; // the library we use for the start button

boolean gameHasStarted = false;
boolean voiceControl;
//audio input
Minim minim;
AudioInput in;
//game constants
final static float OBSTACLE_SIZE = 80;
final static float FALLING_SPEED = 10;
float BOTTOM;
final float TOP = 170;
float ROLLING_SPEED = -8;
float OBST_FREQUENCY = 70;
float ACCELERATION = 0.1;
//keyboard control
final boolean[] KEYS = new boolean[255];


int money=0;
int score=0;
int counter=0;
int time_passed=0; 
int shield=0;
int antigravity=0;
int gravity_direction=1;

Queue<Obstacle> ob = new ArrayDeque(); 
ArrayList<Button> buttonsDisplayed = new ArrayList<Button>();
Player p = new Player(180, 120, 240, height-90-40);
int obstNumber=0;
PImage background;
BigProp[] bigProps = new BigProp[5];
SmallProp[] smallProps = new SmallProp[5];
Mode mode = Mode.CITY;

void setup() { 
  BOTTOM = height - 40;
  background = loadImage("City/Background.png");
  readMoney();
  fullScreen();
  startScreenSetup();
  rectMode(CENTER);
  //voice control
  minim=new Minim(this);
  in = minim.getLineIn();
  for (int i = 0; i < 5; i++)
    bigProps[i] = new BigProp(480 * (i+0.5));
  for (int i = 0; i < 5; i++)
    smallProps[i] = new SmallProp(480 * (i+1));
}

void draw() {
  imageMode(CORNER);
  image(background, 0, 0);
  textSize(26);
  fill(255);
  text("coins: "+money, 80, 30);
  showButtons();
  if (gameHasStarted == true) {
    imageMode(CORNER);
    image(background, 0, 0);
    fill(255);
    text(score, 30, 30);
    displayProps();
    if (shield>0)
      text(shield/30, width-30, 30);
    counter++;
    time_passed++;
    if (shield>0)
      shield--;
    if (antigravity>0) {
      gravity_direction=-1;
      antigravity--;
    } else
      gravity_direction=1;
    if (counter==OBST_FREQUENCY) {
      counter=0;
      float obstacleKind=random(100);
      newObstacle(obstacleKind);
      ROLLING_SPEED-=ACCELERATION;
      if (OBST_FREQUENCY>20)
        OBST_FREQUENCY-=2;
    }
    if (!ob.isEmpty()) {
      moveObstacles();
      showObstacles();
    }
    if (voiceControl) {
      float voice=abs(in.right.get(1)*100);
      voice = constrain(voice, 0, FALLING_SPEED*3);
      p.move((FALLING_SPEED - voice)*gravity_direction);
    } else {
      if (KEYS[87])
        p.move(-FALLING_SPEED*gravity_direction);  
      else
        p.move(FALLING_SPEED*gravity_direction);
    }
    p.display();
  }
}

void displayProps(){
  for (BigProp prop: bigProps){
    prop.display();
  }
  for (SmallProp prop: smallProps){
    prop.display();
  }
}

static enum Mode {CITY, WEST, MEDIEVAL, FUTURE};

void keyPressed() {
  KEYS[keyCode] = true;
}
void keyReleased() {
  KEYS[keyCode] = false;
}
