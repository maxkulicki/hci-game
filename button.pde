class Button
{
  private int x, y, w, h;
  private PFont font;
  private String label;
  private int fontSize;
  public Void effect;
  private int delay = 50, framesPassed = 0;
  
  public Button(int x, int y, int ww, int hh, String label, int fontSize)
  {
    this.x = x;
    this.y = y;
    this.w = ww;
    this.h = hh;
    this.font = createFont("Arial", 16, true);
    this.fontSize = fontSize;
    this.label = label;
  }
  
  public void Draw()
  {
    fill(160);
    stroke(0);
    rect(x, y, w, h);
    textFont(font, fontSize);
    noStroke();
    fill(0);
    text(label, x + 5, y + (h - fontSize) / 2 + (h / 2));
    
    if(framesPassed < delay)
    {
      framesPassed++;
    }
  }
  
  public void SetFrameDelay(int delay)
  {
    this.delay = delay;
  }
  
  public boolean IsPressed()
  {    
    if(!mousePressed)
    {
      return false;
    }
    
    if(mouseX >= x && mouseX <= x + width)
    {
      if(mouseY >= y && mouseY <= y + (height))
      {
        if(framesPassed == delay)
        {
          framesPassed = 0;
          return true;
        }
      }
    }
    
    return false;
  }
}


void showButtons(){
  for (int i = 0; i < buttonsDisplayed.size(); i++) {
      buttonsDisplayed.get(i).Draw();
    }
}
