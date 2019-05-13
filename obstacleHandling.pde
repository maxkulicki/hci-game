void newObstacle(float obstacleKind){
  if(obstacleKind>96)
  ob.add(new Buff(random(0, height), BuffType.SHIELD));
  else if(obstacleKind>94)
  ob.add(new Buff(random(0, height), BuffType.ANTIGRAVITY));
  else if(obstacleKind>90)
  ob.add(new Buff(random(0, height), BuffType.TIME_SLOW));
  else if(obstacleKind>60)
  ob.add(new Coin(random(0, height)));
  else if(obstacleKind>45)
  ob.add(new MovinBlock(random(0, height)));
    else if(obstacleKind>30)
  ob.add(new Block(random(0, height)));
  else if(obstacleKind>15)
  ob.add(new Spike(true));
  else 
  ob.add(new Spike(false));
  obstNumber+=1;  
}
  
void moveObstacles(){
  if(ob.peek().getX()<0-OBSTACLE_SIZE)
    ob.poll();
    
   for (Iterator<Obstacle> i = ob.iterator(); i.hasNext();) {
         Obstacle obstacle = i.next();
         
         obstacle.move(ROLLING_SPEED);
         
         if(obstacle.detectCollision())
           {
             obstacle.effect();
             ob.remove(obstacle);
           }
      }
    
}

void showObstacles(){
  for (Iterator<Obstacle> i = ob.iterator(); i.hasNext();) {
         i.next().display();
      }
}
