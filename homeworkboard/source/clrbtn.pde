public class clrbtn extends Btn
{
  boolean state = false;
  public clrbtn(int x_,int y_,int l_,int w_,String n_,color c_)
  {
    super(x_,y_,l_,w_,n_,c_);
  }
  
  void isClicked(patbrsh p)
  {
    if((mouseX > posx) && (mouseX < posx+w) && (mouseY < posy+l) && (mouseY > posy))
    {
      p.easr = true;
    }      
  }
  
}
