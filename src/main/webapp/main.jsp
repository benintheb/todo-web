<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
		<title>To Do List</title>
        <link rel="stylesheet" type="text/css" href="css/mainstyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>  
    </head>
    <body>
        <div class="wrapper">
            <h1 class="crookedHeader">THINGS TO DO</h1>
            <section class="upperSection">
                <button class="addTodoButton" onclick="location.href='/todo/form'">할 일 추가</button>
            </section>
            <section class="lowerSection">
                <div class="statusCard"><h2>TO DO</h2></div>
                <div class="statusCard"><h2>DOING</h2></div>
                <div class="statusCard"><h2>DONE</h2></div>
            </section>
            <main id="main">
                <ul id="listTodo" class="cardSection" style="text-align:center;">
                    <c:forEach var="i" items="${todoIds }">     
                    	<li id="todoCardNo${i}" class="card">
                    		<h4>${todoList[i].title }</h4>
                    		<small>등록날짜: ${todoList[i].regDate.substring(0, 10).replaceAll("-",".")},
										        ${todoList[i].name}, 우선순위: ${todoList[i].sequence}</small>&nbsp;
							<button id="btn${todoList[i].id}">></button>
                    	</li>                     	        	
                    	<script>
                    		document.getElementById("btn${todoList[i].id}").addEventListener('click', function(event){
                    			var id = "${todoList[i].id}";
                    			var data = 'type='+ "DOING" + '&id='+ id;
                    			var req = new XMLHttpRequest();
                    			req.open('POST', '/todo/type');
                    			req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    			req.onreadystatechange = function(){
                    				if(req.readyState === 4 && req.status === 200){
                    					console.log("success");
                    					$("body").load("/todo/main");
                    				}
                    			}
                    			req.send(data);
                    		});
                    	</script>
                    </c:forEach>
                </ul>
                <ul id="listDoing" class="cardSection" style="text-align:center;">
                    <c:forEach var="i" items="${doingIds }">
                    	<li id="doingCardNo${i}" class="card">
                    		<h4>${todoList[i].title }</h4>
                    		<small>등록날짜: ${todoList[i].regDate.substring(0, 10).replaceAll("-",".")},
												${todoList[i].name}, 우선순위: ${todoList[i].sequence}</small>&nbsp;
							<button id="btn${todoList[i].id}">></button>
                    	</li>
                    	<script>
                    		document.getElementById("btn${todoList[i].id}").addEventListener('click', function(event){
                    			var id = "${todoList[i].id}";
                    			var data = 'type='+ "DONE" + '&id='+ id;
                    			var req = new XMLHttpRequest();
                    			req.open('POST', '/todo/type');
                    			req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    			req.onreadystatechange = function(){
                    				if(req.readyState === 4 && req.status === 200){
                    					console.log("success");
                    					$("body").load("/todo/main");
                    				}
                    			}
                    			req.send(data);
                    		});
                    	</script>
                    </c:forEach>
                </ul>
                <ul id="listDone" class="cardSection">
                    <c:forEach var="i" items="${doneIds }">
                    	<li class="card">
                    		<h4>${todoList[i].title }</h4>
                    		<small style="padding-left:12%;">등록날짜: ${todoList[i].regDate.substring(0, 10).replaceAll("-",".")},
												${todoList[i].name}, 우선순위: ${todoList[i].sequence}</small>
                        </li>
                    </c:forEach>
                </ul>
            </main>
        </div>
    </body>
</html>