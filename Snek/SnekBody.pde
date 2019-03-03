public class SnekBody implements SnekParts{
    private int px;
    private int py;
    private int sx = scl;
    private int sy = 0;
    private SnekParts next = new SnekTail();
    public SnekBody(int x, int y){
        this.px = x;
        this.py = y;
    }
    public void setNext(SnekParts next){
      this.next = next;
    }
    public void update(int x, int y){
        int prevx = this.px;
        int prevy = this.py;
        this.px = x;
        this.py = y;
        this.px = constrain(this.px, 10, width - 10);
        this.py = constrain(this.py, 10, height - 10);
        this.draw();
        next.update(prevx, prevy);
    }
    public void draw(){
        rect(px, py, 20, 20); 
    }
}
