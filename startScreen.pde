ControlP5 CP5;
ControlFont font;
PFont pfont;
void startScreenSetup(){
  CP5 = new ControlP5(this);
  pfont = createFont("Arial", 10, true);
  font = new ControlFont(pfont, 10);
  CP5.addButton("voiceButton")
    .setLabel("Voice Mode")
    .setFont(font)
    .setPosition(width/2-50, height/2-120)
    .setSize(100, 50)
    ;
    textSize(70);
  
  CP5.addButton("keyboardButton")
    .setLabel("Keyboard Mode")
    .setFont(font)
    .setPosition(width/2-50, height/2-60)
    .setSize(100, 50)
    ;
    textSize(70);
 
  CP5.addButton("storeButton")
    .setLabel("Store")
    .setFont(font)
    .setPosition(width/2-50, height/2)
    .setSize(100, 50)
    ;
    textSize(70);    
  
  CP5.addButton("fakeButton")
    .setSize(0,0)
    .setLabel("");
    
  CP5.addButton("fakeButton2")
    .setSize(0,0)
    .setLabel("");

  textAlign(CENTER, CENTER);
}

public void keyboardButton() {
  gameHasStarted = true;
  voiceControl=false;

  CP5.getController("keyboardButton").remove();   // removes the button
  CP5.getController("voiceButton").remove();
  CP5.getController("storeButton").remove();// removes the button
} 

public void voiceButton() {
  gameHasStarted = true;
  voiceControl=true;
  CP5.getController("voiceButton").remove();   // removes the button
  CP5.getController("keyboardButton").remove();   // removes the button
  CP5.getController("storeButton").remove();// removes the button

} 

public void storeButton() {
  storeSetup();
  CP5.getController("voiceButton").remove();   // removes the button
  CP5.getController("storeButton").remove();// removes the button
  CP5.getController("keyboardButton").remove();   // removes the button


} 
