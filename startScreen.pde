void startScreenSetup(){
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
