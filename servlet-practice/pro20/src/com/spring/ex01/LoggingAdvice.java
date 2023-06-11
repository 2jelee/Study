package com.spring.ex01;

//DI���� ���̺귯�� > Build Path > Configuration Build Path.. > Libraries - Classpath - Add JARs..
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;

// advice class : aspect(�������)�� ���� ����ü(Ŭ����)
public class LoggingAdvice implements MethodInterceptor { 
	public Object invoke(MethodInvocation invocation) throws Throwable {
		System.out.println("[�޼��� ȣ�� ��] : LogginAdvice");
		System.out.println(invocation.getMethod() + "�޼��� ȣ�� ��");
		
		Object object = invocation.proceed();
		
		System.out.println("[�޼��� ȣ�� ��] : LogginAdvice");
		System.out.println(invocation.getMethod() + " �޼��� ȣ�� ��");
		return object; 
	}
}
