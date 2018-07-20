<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해주세요");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}
	
	function inputCheck(){
		if(document.regFrm.id.value==""){
			alert("아이디를 입력해주세요");
			document.regFrm.id.focus();
			return;
		}
		if(document.regFrm.password.value==""){
			alert("비밀번호를 입력해주세요");
			document.regFrm.password.focus();
			return;
		}
		if(document.regFrm.repassword.value==""){
			alert("비밀번호를 확인해주세요");
			document.regFrm.repassword.focus();
			return;
		}
		if(document.regFrm.password.value != document.regFrm.repassword.value){
			alert("비밀번호가 일치하지 않습니다");
			document.regFrm.repassword.value="";
			document.regFrm.repassword.focus();
			return;
		}
		if(document.regFrm.name.value==""){
			alert("이름을 입력해주세요");
			document.regFrm.name.focus();
			return;
		}
		if(document.regFrm.birthday.value==""){
			alert("생년월일을 입력해주세요");
			document.regFrm.birthday.focus();
			return;
		}
		if(document.regFrm.email.value==""){
			alert("이메일을 입력해주세요");
			document.regFrm.email.focus();
			return;
		}
		document.regFrm.submit();
	}
</script>
</head>
<body bgcolor="#FFFFCC" onLoad="regFrm.id.focus()">
	<div align="center">
		<br /><br />
		<form name="regFrm" method="post" action="memberProc.jsp">
			<table align="center" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center" valign="middle" bgcolor="#FFFFCC">
						<table border="1" cellspacing="0" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#996600">
								<td colspan="2"><font color="#FFFFFF"><b>회원 가입</b></font></td>
							</tr>
							<tr>
								<td width="20%">아이디</td>
								<td width="50%"><input type="text" name="id" size="15"
									value=""> <input type="button" value="ID중복확인"
									onClick="idCheck(this.form.id.value)"></td>
							</tr>
							<tr>
								<td>패스워드</td>
								<td><input type="password" name="password" size="15" value=""></td>
							</tr>
							<tr>
								<td>패스워드 확인</td>
								<td><input type="password" name="repassword" size="15" value=""></td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" size="15" value="">
								</td>
							</tr>
							<tr>
								<td>성별</td>
								<td>남<input type="radio" name="sex" value="1"
									checked="checked"> 여<input type="radio" name="sex"
									value="2">
								</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" name="birthday" size="6" value="">
									ex)830815</td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input type="text" name="email" size="30" value="">
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
								<input type="button" value="회원가입" onclick="inputCheck()"> &nbsp; &nbsp;
								<input type="reset" value="다시쓰기">&nbsp; &nbsp;
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
