ControlP5 CP6;

void storeSetup(){
  CP6 = new ControlP5(this);
  pfont = createFont("Arial", 10, true);
  font = new ControlFont(pfont, 10);
  CP6.addButton("gravity")
    .setLabel("gravity")
    .setFont(font)
    .setPosition(width/2-50, height/2-120)
    .setSize(100, 50)
    ;
    textSize(70);
  
  CP6.addButton("back")
    .setLabel("back")
    .setFont(font)
    .setPosition(width/2-50, height/2-60)
    .setSize(100, 50)
    ;
    textSize(70);
    
    
  CP6.addButton("fakeButton")
    .setSize(0,0)
    .setLabel("");  
    
    
  textAlign(CENTER, CENTER);
}
public void gravity() {
  
  money+=1;
} 

public void back() {
  CP6.getController("gravity").remove();   // removes the button
  CP6.getController("back").remove();   // removes the button  
  startScreenSetup();
} 






void readMoney(){
BufferedReader reader = createReader("data.txt");
  try {
    money = int(reader.readLine());
    reader.close();
  } catch (IOException e) {
    e.printStackTrace();
  }
}

void updateMoney(){    

PrintWriter output = createWriter("data.txt"); 
money+=score;
output.println(money);
output.flush(); // Writes the remaining data to the file
output.close(); // Finishes the file
  
}
