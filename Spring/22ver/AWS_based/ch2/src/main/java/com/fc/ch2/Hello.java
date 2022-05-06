package com.fc.ch2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 1. 원격 호출 가능한 프로그램으로 등록 
@Controller
public class Hello {
	int iv = 10; //인스턴스 변수 
	static int cv = 20; // static 변수 
	
	@RequestMapping("/hello") 
//	public void main() { // 인스턴스 메서드 - iv, cv를 둘다 사용 O
	private void main() { // 접근제어자를 public이 아닌 private으로 변경 
//		System.out.println("Hello");
		System.out.println("Hello - private");
		System.out.println(cv);  
		System.out.println(iv);  
	}
	
	// static 
	public static void main2() { // static 메서드 - cv만 사용 가능 
		System.out.println(cv); // OK
//		System.out.println(iv); // error
	}
}
