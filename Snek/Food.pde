public class Food{
    private int fx;
    private int fy;
    public Food(){ 
    }
    public void pickLocation(){
      this.fx=(floor(random(1,rows))*scl-10);
      this.fy=(floor(random(1,cols))*scl-10);
    }
    public int getFX(){
        return this.fx;  
    }
    public int getFY(){
        return this.fy;  
    }
    public void draw(){
      rect(fx,fy,20,20);
    }
}
