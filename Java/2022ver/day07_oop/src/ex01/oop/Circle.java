package ex01.oop;
 
public class Circle { 
	//멤버변수
	private int x, y, r;

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}
	
	public void display() {
		System.out.println("x : "+x+" / y : "+y+" / r :"+r);
	}
}//end of Circle class
 