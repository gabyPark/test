package com.goods.action;

public class ActionForward {
	// �������� �̵������� �����ϴ� ��ü
	// ������ �̵��� �׻� ������ ���� (�ּ�, �̵����)
	
	private String path; //�ּ�
	private boolean isRedirect; //�̵����-2����
	// true - sendRedirect() ������� �̵� (�ּ�,ȭ�� ����O)
	// false - forward() ������� �̵� (�ּ� ����x, ȭ�� ���� O)
	
	
	// alt shift s + r => set/get()
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	

}
