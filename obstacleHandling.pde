void newObstacle(float obstacleKind) {
  if (obstacleKind>96)
    ob.add(new Buff(random(TOP + BUFF_SIZE/2, BOTTOM - BUFF_SIZE/2), BuffType.SHIELD));
  else if (obstacleKind>94)
    ob.add(new Buff(random(TOP + BUFF_SIZE/2, BOTTOM - BUFF_SIZE/2), BuffType.ANTIGRAVITY));
  else if (obstacleKind>90)
    ob.add(new Buff(random(TOP + BUFF_SIZE/2, BOTTOM - BUFF_SIZE/2), BuffType.TIME_SLOW));
  else if (obstacleKind>60)
    ob.add(new Coin(random(TOP + COIN_SIZE/2, BOTTOM - COIN_SIZE/2)));
  else if (obstacleKind>45)
    ob.add(new MovinBlock(random(TOP, BOTTOM)));
  else if (obstacleKind>30)
    ob.add(new Block(random(TOP, BOTTOM-200)));
  else if (obstacleKind>15)
    ob.add(new Spike());
  obstNumber+=1;
}

void moveObstacles() {
  if (ob.peek().getX()<0-OBSTACLE_SIZE)
    ob.poll();

  for (Iterator<Obstacle> i = ob.iterator(); i.hasNext(); ) {
    Obstacle obstacle = i.next();

    obstacle.move(ROLLING_SPEED);

    if (obstacle.detectCollision())
    {
      obstacle.effect();
      ob.remove(obstacle);
    }
  }
}

void showObstacles() {
  for (Iterator<Obstacle> i = ob.iterator(); i.hasNext(); ) {
    i.next().display();
  }
}
