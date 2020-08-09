var main = document.getElementById("main");
var listDoing = document.getElementById("listDoing");
var listDone = document.getElementById("listDone");

main.addEventListener("click", function(evt){
	if(evt.target.nodeName == "BUTTON"){
		if(evt.target.parentNode.parentNode.id == "listTodo"){
			var type = "DOING";
		}
		else if(evt.target.parentNode.parentNode.id == "listDoing"){
			var type = "DONE";
		}
		var id = evt.target.id.substr(3);
		var data = 'type=' + type + '&id=' + id;
		var req = new XMLHttpRequest();
		req.open('POST', '/todo/type');
		req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		req.send(data);
		
		if(evt.target.parentNode.parentNode.id == "listTodo"){
			var card = evt.target.parentNode;
			listDoing.appendChild(card);
		}
		else if(evt.target.parentNode.parentNode.id == "listDoing"){
			var card = evt.target.parentNode;
			listDone.appendChild(card);
			evt.target.parentNode.querySelector("small").style.paddingLeft = "12%";
			evt.target.remove();
		}
	}
});