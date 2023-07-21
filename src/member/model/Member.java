package member.model;

import java.util.Date;

//p591 member 테이블관련 data저장,제공 등의 기능을 제공 클래스
public class Member {
	//필드

	private String  memberid;	//회원id
	private String  password;	//비번
	private String  name;		//회원명
	
	
	//생성자
//	public Member(int no, String memberid, String password, String name, Date regDate) {
//		this.no = no;
//		this.memberid = memberid;
//		this.password = password;
//		this.name = name;
//		this.regDate = regDate;
//	}
//	
//	public Member(String memberid, String password, String name, Date regDate) {
//		this.memberid = memberid;
//		this.password = password;
//		this.name = name;
//		this.regDate = regDate;
//	}

	//메서드
	public String getMemberid() {
		return memberid;
	}
	
	public Member(String memberid, String password, String name) {
		super();
		this.memberid = memberid;
		this.password = password;
		this.name = name;
	}

	public String getPassword() {
		return password;
	}
	
	public String getName() {
		return name;
	}
	
	
	//p592 - 필드의 비번과  매개변수pwd가 일치하면 true리턴, 불일치시 false리턴
	//=> member테이블의 비번컬럼의 값과 매개변수pwd가 일치하면 true리턴, 불일치시 false리턴
	public boolean matchPassword(String pwd) {
		return this.password.equals(pwd);
	}
	

	//p619 20라인
	//password필드의 값을 새 비번으로 변경=>여기에서는 비번변경시 호출
	public void changePassword(String newPwd) {
		this.password=newPwd;
	}
}



















