package com.spring.ex03;

public class MemberDAOImpl implements MemberDAO{
	private MemberDAO MemberDAO;
	
	public void setMemberDAO(MemberDAO memberDAO) {
		MemberDAO = memberDAO;
	}

	@Override
	public void listMembers() {
		System.out.println("listMembers �޼��� ȣ��");
		System.out.println("ȸ�������� ��ȸ�մϴ�.");
	}
	
}
