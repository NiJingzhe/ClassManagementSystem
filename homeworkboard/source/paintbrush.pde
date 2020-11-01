class patbrsh
{
  boolean easr = false;
  color col_of_line,col_of_shadow;
  float weight;
  patbrsh(int r,int g,int b,int br,int bg,int bb)
  {  
    col_of_shadow = color(abs(80-r),abs(60-g),abs(100-b));
    col_of_line = color(255-br,255-bg,255-bb);
  }
  
  void setweight(float w_)
  {
    weight = w_;
  }
  
  void paint(boolean moustate,int r,int g,int b)
  {
    if(moustate)
    {
      if(!easr)
      {
        pushMatrix();
        strokeWeight(weight);
        stroke(col_of_line);
        line(mouseX,mouseY,pmouseX,pmouseY);
        strokeWeight(weight*0.5);
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
