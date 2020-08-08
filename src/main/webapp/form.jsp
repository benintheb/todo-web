<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>To Do Form</title>
        <link rel="stylesheet" type="text/css" href="css/formstyle.css">
    </head>
    <body>
        <div class="wrapper">
            <h1>할 일 등록</h1><br>
            <form id="todoForm" method="post" action="/todo/add" >
            	
                <label for="title">어떤 일인가요?</label><br>
                <input id="t1" type="text" name="title" size="24" maxlength="24" placeholder="할 일을 입력하세요(24자까지)" style="width:98.5%;" required><br><br>
                <label for="name">누가 할 일인가요?</label><br>
                <input id="n1" type="text" name="name" size="9" maxlength="9" placeholder="홍길동" style="width:50%;" required><br><br>
               	 우선순위를 선택하세요<br>
               	<input id="s1" type="radio" name="sequence" value="1" required>
               	<label for="sequence" style="font-size:.8rem;">1순위</label>&nbsp;&nbsp;&nbsp;&nbsp;
               	<input id="s2" type="radio" name="sequence" value="2">
               	<label for="sequence" style="font-size:.8rem;">2순위</label>&nbsp;&nbsp;&nbsp;&nbsp;
               	<input id="s3" type="radio" name="sequence" value="3">
               	<label for="sequence" style="font-size:.8rem;">3순위</label>&nbsp;&nbsp;&nbsp;&nbsp;
            	<button class="resetBtn rightButton btn" onclick="document.getElementById('todoForm').reset()">내용지우기</button>
            	<input type="submit" class="rightButton btn">
            	<button class="backButton btn" onclick="location.href='/todo/main'">&#60;이전</button>
            </form>
        </div>
    </body>
</html>