<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="errorPage.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<script src="js/jquery.slim.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.bundle.min.js"></script>
<link href="./css/signin.css" rel="stylesheet">

<script>

	function openCk()
	{
		window.name="ckForm";
		window.open("confirm.jsp","check","width=500, height=300");
	}

	
	function pwdCheck() {
		if(document.userInfo.pwd.value != document.userInfo.pwdck.value)
		{
			alert("비밀번호가 일치하지 않습니다.");
			return 1;
		}
		else
			return 0;
	}
	
function check() {
		
		
		if(document.userInfo.confirmok.value == "1")
		{
			
			if(pwdCheck()==0)
				document.userInfo.submit();
		}
		else
		{
			alert("이메일 중복확인을 하세요.");
		}
	}

	
	
</script>



</head>
<body>


<div class="container">
	<h2 align=center>계정 생성</h2>
  
  	<form class="form-signin" action="joinAction.jsp" name="userInfo" method="post">
    	<div class="form-group">
      		Email:   <input type="button" value="중복확인" class="btn btn-primary" onclick="javascript:openCk()"><br><br>
      		<input type="email" class="form-control" name="email" placeholder="Enter email" required autofocus>
    	</div>
    	<div class="form-group">
			Password:
      		<input type="password" class="form-control" name="pwd" placeholder="Enter password">
    	</div>
    	<div class="form-group">
      		Password check:
      		<input type="password" class="form-control" name="pwdck" placeholder="Enter password">
    	</div>
    	<div class="form-group">
      		name:
      		<input type="text" class="form-control" name="name" placeholder="Enter name">
    	</div>
    	<div class="form-group">
     		cell phone:
      		<input type="tel" class="form-control" name="cp" placeholder="01012345678" pattern="[0-9]{11}" required>
    	</div>
    
    	<button class="btn btn-sm btn-primary btn-block" onclick="check()">회원가입</button>
    
    	<input type="hidden" name="confirmok" value="0">
  	</form>
</div>


</body>
</html>