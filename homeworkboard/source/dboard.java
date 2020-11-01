import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class dboard extends PApplet {

clrbtn button1;
penbtn button2;
patbrsh paintbrush;

int bgcr = (int)random(0,100);
int bgcg = (int)random(0,100);
int bgcb = (int)random(0,100);

public void setup()
{
  
  button1 = new clrbtn(0,0,50,50,"eraser",color(180));
  button2 = new penbtn(50,0,50,50,"pen",color(255-bgcr,255-bgcg,255-bgcb,180));
  paintbrush = new patbrsh(10,10,10,bgcr,bgcg,bgcb);
  background(bgcr,bgcg,bgcb);
}



public void draw()
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

public float speedget()
{
  float speed = 4-sqrt(abs(mouseX-pmouseX) + abs(mouseY-pmouseY))*0.4f;
  if(speed <= 0)  speed = 0.001f;
  return speed;
}

public void mousePressed()
{
    button1.isClicked(paintbrush);
    button2.isClicked(paintbrush);
}
public class Btn
{

public int posx;
public int posy;
public int l;
public int w;
public String name;
public int col;
  
  public Btn(int x,int y,int l_,int w_,String n_,int col_)
  {
    posx = x;
    posy = y;
    l = l_;
    w = w_;
    name = n_;
    col = col_;
  }
  
  public void display()
  {
    pushMatrix();
    noStroke();
    fill(col);
    rect(posx,posy,w,l);
    fill(255,255,255);
    text(name,posx+w/2-name.length()*2.5f,posy+l/2);
    popMatrix();
  }
}
public class clrbtn extends Btn
{
  boolean state = false;
  public clrbtn(int x_,int y_,int l_,int w_,String n_,int c_)
  {
    super(x_,y_,l_,w_,n_,c_);
  }
  
  public void isClicked(patbrsh p)
  {
    if((mouseX > posx) && (mouseX < posx+w) && (mouseY < posy+l) && (mouseY > posy))
    {
      p.easr = true;
    }      
  }
  
}
class patbrsh
{
  boolean easr = false;
  int col_of_line,col_of_shadow;
  float weight;
  patbrsh(int r,int g,int b,int br,int bg,int bb)
  {  
    col_of_shadow = color(abs(80-r),abs(60-g),abs(100-b));
    col_of_line = color(255-br,255-bg,255-bb);
  }
  
  public void setweight(float w_)
  {
    weight = w_;
  }
  
  public void paint(boolean moustate,int r,int g,int b)
  {
    if(moustate)
    {
      if(!easr)
      {
        pushMatrix();
        strokeWeight(weight);
        stroke(col_of_line);
        line(mouseX,mouseY,pmouseX,pmouseY);
        strokeWeight(weight*0.5f);
        stroke(col_of_shadow);
        line(mouseX+weight,mouseY+weight,pmouseX+weight,pmouseY+weight);
        popMatrix();
      }
      else
      {
        pushMatrix();
        noStroke();
        fill(r,g,b);
        ellipse(mouseX,mouseY,25,25);
        popMatrix();
      }
      
    }
  }
 
}
class penbtn extends Btn
{
  penbtn(int x_,int y_,int l_,int w_,String n_,int c_)
  {
    super(x_,y_,l_,w_,n_,c_);
  }
  
  public void isClicked(patbrsh p)
  {
    if((mouseX > posx) && (mouseX < posx+w) && (mouseY < posy+l) && (mouseY > posy))
    {
      p.easr = false;
    }   
  }
  
}
  public void settings() {  size(400,400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dboard" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
