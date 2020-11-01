clrbtn button1;
penbtn button2;
patbrsh paintbrush;

int bgcr = (int)random(0,100);
int bgcg = (int)random(0,100);
int bgcb = (int)random(0,100);

void setup()
{
  size(400,400);
  button1 = new clrbtn(0,0,50,50,"eraser",color(180));
  button2 = new penbtn(50,0,50,50,"pen",color(255-bgcr,255-bgcg,255-bgcb,180));
  paintbrush = new patbrsh(10,10,10,bgcr,bgcg,bgcb);
  background(bgcr,bgcg,bgcb);
}



void draw()
{
  pushMatrix();
  paintbrush.setweight(speedget());
  paintbrush.paint(mousePressed,bgcr,bgcg,bgcb);
  popMatrix();
  
  pushMatrix();
  button1.display();
  button2.display();
  popMatrix();
}

float speedget()
{
  float speed = 4-sqrt(abs(mouseX-pmouseX) + abs(mouseY-pmouseY))*0.4;
  if(speed <= 0)  speed = 0.001;
  return speed;
}

void mousePressed()
{
    button1.isClicked(paintbrush);
    button2.isClicked(paintbrush);
}
