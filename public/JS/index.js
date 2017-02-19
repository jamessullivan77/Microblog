document.addEventListener("DOMContentLoaded",function(){


var space = document.getElementById("comment_space");
var submit = document.getElementById("usrSub");

document.getElementById("comments").addEventListener("submit",
	function(event){
		event.preventDefault();
		console.log("submit");
		var newComment = document.getElementById("users_textbox").value;

	 	document.getElementById("users_textbox").value = "";

	 	var elNewComment = document.createElement("div");

	 	elNewComment.className = "comment";
	 	elNewComment.id = "msg_" + (space.querySelectorAll(".comment").length+1)

	 	elNewComment.innerText = newComment;

	 	space.appendChild(elNewComment);
});

});