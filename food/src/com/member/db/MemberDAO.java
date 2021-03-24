package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	// DB - f_member 테이블의 모든 처리 
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";		
	
	// 디비연결 - 커넥션풀 
	private Connection getCon() throws Exception {
		Context initCTX = new InitialContext();
		DataSource ds = (DataSource) initCTX.lookup("java:comp/env/jdbc/foodDB");		
		con = ds.getConnection();
		
		System.out.println("DAO : 디비 연결 성공! -> " + con);
		
		return con;
	}
	
	// 자원해제 
	public void closeDB(){
		try {
			if(rs != null){ rs.close(); }
			if(pstmt != null){ pstmt.close(); }
			if(con != null){ con.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////
	// loginCheck(mb)
	public int loginCheck(MemberBean mb) {
		int result = -1;
		
		try {
			// 1.2. 디비연결
			con = getCon();
			// 3. sql 생성 & pstmt 객체
			sql = "select f_mem_pw from f_member where f_mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getF_mem_id());
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리 
			if(rs.next()) {
				// 회원
				if(mb.getF_mem_pw().equals(rs.getString("f_mem_pw"))) {
					// 본인
					result = 1;
				} else {
					// 본인이지만 비밀번호 오류
					result = 0;
				}
				
			} else {
				// 비회원
				result = -1;
			}
			
			System.out.println("DAO : 로그인 체크 >> " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// loginCheck(mb)
	///////////////////////////////////////////////////////////////////////////////////////////
	
	
	/////////////////////////////////////////////////////////////////
	// getMember(id)
	public MemberBean getMember(String id) {
		MemberBean mb = null;
		try {
			// 1.2 디비연결
			con = getCon();
			// 3. sql 작성 & pstmt 생성
			sql = "select * from f_member where f_mem_id=?";
	
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
	
			// 4. sql 실행
			rs = pstmt.executeQuery();
	
			// 5. 데이터 처리
			if (rs.next()) {
				mb = new MemberBean();
	
				// DB -> MemberBean 저장
				mb.setF_mem_addr(rs.getString("f_mem_addr"));
				mb.setF_mem_addr1(rs.getString("f_mem_addr1"));
				mb.setF_mem_addr2(rs.getString("f_mem_addr2"));
				mb.setF_mem_date(rs.getDate("f_mem_date"));
				mb.setF_mem_email(rs.getString("f_mem_email"));
				mb.setF_mem_id(rs.getString("f_mem_id"));
				mb.setF_mem_ip(rs.getString("f_mem_ip"));
				mb.setF_mem_name(rs.getString("f_mem_name"));
				mb.setF_mem_nick(rs.getString("f_mem_nick"));
				mb.setF_mem_num(rs.getInt("f_mem_num"));
				mb.setF_mem_phone(rs.getString("f_mem_phone"));
				mb.setF_mem_pw(rs.getString("f_mem_pw"));
				
			}
			System.out.println("DAO : 회원 정보 저장 완료 >> " + mb);
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return mb;
	}
	// getMember(id)
	/////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	// deleteMember(mb)
	public int deleteMember(MemberBean mb) {
		int result = -1;

		try {
			// 1.2. 디비연결
			con = getCon();

			// 3. sql 작성 & pstmt 객체 생성
			sql = "select f_mem_pw from f_member where f_mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getF_mem_id());
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				if(mb.getF_mem_pw().equals(rs.getString("f_mem_pw"))) {
					// 3. sql 작성 & pstmt 객체 생성
					sql = "delete from f_member where f_mem_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mb.getF_mem_id());
					
					// 4. sql 실행
					pstmt.executeUpdate();					
					
					result = 1;
				} else {
					result = 0;
				}
				
			} else {
				result = -1;
			}
			
			System.out.println("DAO : 회원 탈퇴 완료 >> " + result);

		} catch (Exception e) {		
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	// deleteMember(mb)
	///////////////////////////////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	// updateMember(mb)
	public int updateMember(MemberBean mb) {
		int result = -1;
		
		try {
			// 1.2 디비연결
			con = getCon();
			
			// 3. sql 작성 & pstmt 객체 실행
			sql = "select f_mem_pw from f_member where f_mem_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getF_mem_id());
			
			// 4. sql 실행 
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				if(mb.getF_mem_pw().equals(rs.getString("f_mem_pw"))) {
					// 수정
					// 3. sql 작성 & pstmt 객체 실행
					sql = "update f_member set f_mem_pw=?, f_mem_name=?, f_mem_phone=?, f_mem_addr=?, f_mem_addr1=?, f_mem_addr2=?, "
							+ "f_mem_email=?, f_mem_nick=? where f_mem_id=?";
					
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, mb.getF_mem_pw());
					pstmt.setString(2, mb.getF_mem_name());
					pstmt.setString(3, mb.getF_mem_phone());					
					pstmt.setString(4, mb.getF_mem_addr());
					pstmt.setString(5, mb.getF_mem_addr1());
					pstmt.setString(6, mb.getF_mem_addr2());
					pstmt.setString(7, mb.getF_mem_email());
					pstmt.setString(8, mb.getF_mem_nick());
					pstmt.setString(9, mb.getF_mem_id());

					// 4. sql 실행 
					result = pstmt.executeUpdate();
					// => exectueUpdate() : sql 쿼리 실행 후 영향을 받은 row 수 리턴
					//result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
			
			System.out.println("DAO : 회원정보 수정완료 >> " + result);
			
		} catch (Exception e) {		
			e.printStackTrace();
		} finally {
			closeDB();
		}		
		return result;
	}	
	// updateMember(mb)
	///////////////////////////////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	// insertMember(mb)
	public void insertMember(MemberBean mb) {
		int f_mem_num=0;
		
		try {
			// 1.2. 디비연결
			con = getCon();
			
			sql="select max(f_mem_num) from f_member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				f_mem_num = rs.getInt(1)+1;
				
				// 3. sql 작성 & pstmt 객체
				// 회원가입구문 - insert구문				
				pstmt = con.prepareStatement(sql);
				
				sql = "insert into f_member "
						+ "values(?,?,?,?,?,?,?,?,?,?,now(),?)";
					
				pstmt = con.prepareStatement(sql);				
				
				pstmt.setInt(1, f_mem_num);
				pstmt.setString(2, mb.getF_mem_id());
				pstmt.setString(3, mb.getF_mem_pw());
				pstmt.setString(4, mb.getF_mem_name());
				pstmt.setString(5, mb.getF_mem_phone());
				pstmt.setString(6, mb.getF_mem_addr());
				pstmt.setString(7, mb.getF_mem_addr1());
				pstmt.setString(8, mb.getF_mem_addr2());
				pstmt.setString(9, mb.getF_mem_email());
				pstmt.setString(10, mb.getF_mem_nick());
				pstmt.setString(11, mb.getF_mem_ip());
				
				// 4. sql 실행
				pstmt.executeUpdate();				
				System.out.println("DAO : 회원가입 완료!");
			}
				
		} catch (Exception e) {
			System.out.println("DAO : 회원가입 실패!");
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}	
	// insertMember(mb)
	///////////////////////////////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	// joinIdCheck()
	public int joinIdCheck(String id){
		int result = -1;
		try {
			//1. DB연결
			con = getCon();
			//2. sql 구문 & pstmt생성
			sql = "select id from fun_member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			//3. 실행 -> select -> rs저장
			rs = pstmt.executeQuery();

			//4. 데이터처리

			if(rs.next()){	
				result = 0;
			}else{
				result = 1;
			}

			System.out.println("아이디 중복체크결과 : " + result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return result;
	}//joinIdCheck 메서드닫음
	// joinIdCheck()
	///////////////////////////////////////////////////////////////////////////////////////////

	
	///////////////////////////////////////////////////////////////////////////////////////////
	// duplicateIdCheck(id)
	public boolean duplicateIdCheck(String id) {
        boolean idChkResult = false;
        try {        	
        	// 1. DB연결
			con = getCon();
			
			// 2.3 sql 구문 & pstmt생성
			sql = "select f_mem_id from f_member where f_mem_id=?";    	
			pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            
            // 4. sql 실행
            rs = pstmt.executeQuery();
            
            // 5. 데이터 처리
            if(rs.next()) {
            	idChkResult = true; //해당 아이디 존재
            	System.out.println("DAO : 중복아이디 존재함");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeDB();
        }
        
        return idChkResult;
    }
	// duplicateIdCheck(id)
	///////////////////////////////////////////////////////////////////////////////////////////
	
	
	///////////////////////////////////////////////////////////////////////////////////////////
	// insertAuth(mb)
	
	// insertAuth(mb)
	///////////////////////////////////////////////////////////////////////////////////////////
	
	///////////////////////////////////////////////////////////////////////////////////////////
	// emailCheck(email)
	public int emailCheck(String email) {
		int result = 0; // 동일한 이메일 없음.
		
		try {
			// 1. 디비연결
			con = getCon();
			
			// 2.3. sql 작성 & pstmt 객체 생성
			sql = "select f_mem_email from f_member where f_mem_email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			// 4. 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				result = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		
		return result;
	}
	
	// emailCheck(email)
	///////////////////////////////////////////////////////////////////////////////////////////
}
