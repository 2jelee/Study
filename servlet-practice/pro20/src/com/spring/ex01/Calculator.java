package com.spring.ex01;

// target class : advice(aspect�� ���� ����ü - Ŭ����)�� ����Ǵ� Ŭ����
public class Calculator {
	public void add(int x, int y) {
		int result = x + y;
		System.out.println("���:"+result);
	}
	
	public void substract(int x, int y) {
		int result = x - y;
		System.out.println("���:"+result);
	}

	public void multiply(int x, int y) {
		int result = x * y;
		System.out.println("���:"+result);
	}
	
	public void divide(int x, int y) {
		int result = x / y;
		System.out.println("���:"+result);
	}
	
}
