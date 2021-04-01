package basic.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor	//기본 생성자
@AllArgsConstructor	//모든 파라미터를 받는 생성자

public class Customer {	//Model 데이터 베이스 테이블과 1대1 매칭(Value Object)
	private String id;
	private String name;
	private String email;
	private String address;
	
	}
