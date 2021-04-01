package basic;

 
import lombok.Getter;
import lombok.Setter;
 

@Getter
@Setter


public class Counter {
	private int count;
	
	public Counter(){
		this.count=0;
	}
	public void increaseCnt() {this.count+=1;}

}
