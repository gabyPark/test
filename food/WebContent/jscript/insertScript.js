/**
 * 
 */
function checkValue() {
	var form = document.userInfo;
	
	if(!form.f_mem_id.value){
        alert("아이디를 입력하세요.");
        return false;
    }
    
    if(form.idDup.value != "idCheck"){
        alert("아이디 중복체크를 해주세요.");
        return false;
    }
    
    if(!form.f_mem_pw.value){
        alert("비밀번호를 입력하세요.");
        return false;
    }
    
    var pw_len = form.f_mem_pw.value.length;
    if(!(4 <= len && len <= 10)) {
    	alert("비밀번호는 4자리 이상 10자리 이하로 입력해주세요")
    }
    
    // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
    if(form.f_mem_pw.value != form.f_mem_pw_chk.value ){
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }    
    
    if(!form.f_mem_name.value){
        alert("이름을 입력하세요.");
        return false;
    }
    
    if(!form.f_mem_nick.value){
        alert("닉네임을 입력하세요.");
        return false;
    }
    
}

function openIdChk(){
    
    window.name = "parentForm";
    window.open("member/MemberIdCheckForm.jsp",
            "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
}

function pwCheck() {
	var form = document.userInfo;
	
	if(form.f_mem_pw.value == form.f_mem_pw_chk.value) {
		form.f_mem_pw_result.style.color = "blue";
		form.f_mem_pw_result.value = "비밀번호가 일치합니다.";
		
	} else {
		form.f_mem_pw_result.style.color = "red";
		form.f_mem_pw_result.value = "비밀번호가 일치하지않습니다.";		
	}
}