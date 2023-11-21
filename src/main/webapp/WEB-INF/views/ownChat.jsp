<%@ page language="java" 
    pageEncoding="UTF-8"%>
<%@include file="./include/header.jsp"%>

<title>채팅</title>

<style>
.container{
	border:2px solid gray;
    margin-top: 5%;
    height: 700px;
    position : relative;
    overflow: auto;
}

.chatRoom{
	font-size: 20px
}

#msg{
	width:300px;
}

#button-send{
	margin-left: 2%
}

.input-group-append{
	width: 130px;
    float: left;
}

.box-body {
    text-align: center;
    display: inline;
    padding-bottom: 7%;
    position: absolute;
    bottom: 0;
    margin-left: 30%;
    margin-right: 30%;
}
</style>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<script type="text/javascript">

	  var sock;
      document.addEventListener("DOMContentLoaded", function() {
    	 sock = new SockJS("http://localhost:8088/chat");

    	 sock.onopen = function (event) {
    		
          };
          
    	 sock.onclose = function (event) {
          };

         
		sock.onmessage = function(event) {
			var data = event.data;
			console.log(data);
			var sessionId = null; //데이터를 보낸 사람
			var message = null;
			var arr = data.split(":");
			var cur_session = '${ent_name}';
			for (var i = 0; i < arr.length; i++) {
				console.log('arr[' + i + ']: '+cur_session);
			}
			console.log(cur_session)
			sessionId = arr[0];
			message = arr[1];

			if (sessionId == cur_session) {
				if(message == null){
					var str = "<div class='col-6'>";
					str += "<div class='alert alert-warning'>";
					str += "<b>" + sessionId +"</b>";
					str += "</div></div>";
					$("#msgArea").append(str);
				}else{
					var str = "<div class='col-6'>";
						str += "<div class='alert alert-warning'>";
						str += "<b>" + sessionId + " : " + message + "</b>";
						str += "</div></div>";
						$("#msgArea").append(str);
				}

			} else {
				if(message == null){
					var str = "<div class='col-6'>";
					str += "<div class='alert alert-secondary'>";
					str += "<b>" + sessionId +"</b>";
					str += "</div></div>";
					$("#msgArea").append(str);
				}else{
					var str = "<div class='col-6'>";
						str += "<div class='alert alert-warning'>";
						str += "<b>" + sessionId + " : " + message + "</b>";
						str += "</div></div>";
						$("#msgArea").append(str);
				}
			}
		}
	});

	function send() {
			if($('input[id=msg]').val() != ""){
				var message = document.querySelector("#msg");
				sock.send(message.value);
				message.value = '';
			}else{
				console.log('입력x')
			}
	}
	

	function enterKey() {
		if($('input[id=msg]').val() != ""){
	        if (window.event.keyCode == 13) {
	            send();
	        }else{
				console.log('입력x')
			}
		}
    }
		

</script>
<div class="container">
	<div class="col-6">
		<label class="chatRoom"><b>채팅방</b></label>
	</div>
	<div>
		<div id="msgArea" class="col"></div>
	</div>
</div>
			<div class="box-body">
				<div class="input-group mb-3">
					<input type="text" id="msg" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" onkeyup="enterKey()">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" id="button-send" onclick="send()">전송</button>
						<button class="btn btn-outline-secondary" type="button" onclick="location.href='/ent/shopMain';">나가기</button>
					</div>
				</div>
			</div>
<%@include file="./include/footer.jsp"%>