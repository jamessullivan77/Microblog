document.addEventListener("DOMContentLoaded",function(){

var date = new Date();
var time = new Date();
var day = date.getDate();
var month = date.getMonth()+1;
var year = date.getFullYear();
var AM_PM = "";

if (hours < 12) {
	AM_PM = "AM";
}else{
	AM_PM = "PM";
}

if (hours == 0){
	hours = "12";
}

if (hours > 12){
	hours = hours - 12;
}

if (seconds < 10){
	seconds = "0" + seconds
}

if (minutes < 10){
	minutes = "0" + minutes
}

if (hours < 10){
	hours = "0" + hours
}
var hours = time.getHours();
var minutes = time.getMinutes();
var seconds = time.getSeconds();


date = month + "/" + day + "/" + year; 
time = hours +':'+ minutes+ " " + AM_PM;

var space = document.getElementById("comment_space");
var submit = document.getElementById("usrSub");

document.getElementById("comments").addEventListener("submit",
	function(event){
		event.preventDefault();
		console.log("submit");
		// var newComment_1 = document.getElementById("users_textbox").value + date;
	
	 	// ajax call
	 	$.ajax({
	 		url: document.querySelector("#comments").action,
	 		method: document.querySelector("#comments").method,
	 		data: {
	 			usr_comment: document.getElementById("users_textbox").value
	 		},
	 		dataType: "json",
	 		complete: function(response){
	 			// to do: update or whatever here...
	 			var newComment = document.getElementById("users_textbox").value;

	 			var elTime = document.createElement("span");
	 			elTime.innerText = time;
	 			elTime.className = "right";

			 	document.getElementById("users_textbox").value =  "";

			 	var elNewComment = document.createElement("div");

			 	elNewComment.className = "comment";
			 	elNewComment.id = "msg_" + (space.querySelectorAll(".comment").length+1)

			 	elNewComment.innerText = newComment;
			 	elNewComment.appendChild(elTime);
			 	space.appendChild(elNewComment);
	 		}
	 	});

	});
});

document.addEventListener("DOMContentLoaded",function(){
	up.onclick=function(){
		document.getElementById('up').style.display="none"
		document.getElementById('fieldsetProfile').style.display="block"
	}
	editSubmit.onclick = function(){
		document.getElementById('fieldsetProfile').style.display="none"
		document.getElementById('up').style.display="block"
	}
});


