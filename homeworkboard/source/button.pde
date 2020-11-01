public class Btn
{

public int posx;
public int posy;
public int l;
public int w;
public String name;
public color col;
  
  public Btn(int x,int y,int l_,int w_,String n_,color col_)
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
    text(name,posx+w/2-name.length()*2.5,posy+l/2);
    popMatrix();
  }
}
