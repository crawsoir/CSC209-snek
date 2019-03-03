public class SnekHead{
    private int px;
    private int py;
    private int sx = scl;
    private int sy = 0;
    private SnekParts next = new SnekTail();
    private Boolean newPart = false;
    public SnekHead(int x, int y){
        this.px = x;
        this.py = y;
    }
    public void setSpeed(int x, int y){
        this.sx = x;
        this.sy = y;
    }
    public void setTrue(){
        this.newPart = true; 
    }
    public void addBody(SnekBody sb){
        sb.setNext(this.next);
        this.next = sb;
    }
    public void update(){
        
        int prevx = this.px;
        int prevy = this.py;
        this.px += this.sx;
        this.py += this.sy;
        this.px = constrain(this.px, 10, width-10);
        this.py = constrain(this.py, 10, height-10);
        this.draw();
        if(newPart){
            newPart = false;
            this.addBody(new SnekBody(prevx, prevy));
        }
        next.update(prevx, prevy);
        
    }
    public void draw(){
        rect(px, py, 20, 20); 
    }
    public boolean eat(Consumable food){
        if(dist(this.px, this.py, food.getFX(), food.getFY()) < 1){
            return true;
        }
        else{
            return false;  
        }
    }
}
  
