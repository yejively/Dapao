
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:if test="${empty us_id || us_id.equals(null)}">
 <c:redirect url="../user/userLogin"/> 
</c:if>
<c:if test="${!empty us_id }">
<%@ include file="../include/userLoginHeader.jsp" %>
</c:if>

<style type="text/css">

#container{

	margin-left: 20%;
	padding-bottom: 10%;
	background-color: transparent;
	border: none;
}

#item_write_section{
	width: 800px;
	border: none;
}

.left{
	float:left;
}

.it_text{
	width : 100px;
	border : none;
	background-color: transparent;
	font-weight: bold;
	font-size :medium;
}

/* 이미지 등록 구역  */
#img_section{

	width : 500px;
}

#it_reg_img{

	width:200px;
	height:200px;
	border: 1px solide balck;
}

#it_files{

/* 	display: none;	 */
}

#it_title{
	border: 1px solde gray;
	width: 650px;
	height : 30px;
	

}

#it_price{

	border: 1px solde gray;
	width: 400px;
	height : 30px;

}

#it_content{

	border: 1px solde gray;
	width: 650px;
	height : 200px;


}

.it_con{

	font-size: 10px;

}

.it_con_text_old{
	border : none;
	font-size: 20px;
	width : 100px;
	background-color: transparent;
}

.it_con_text_new{
	border : none;
	font-size: 20px;
	width : 100px;
	background-color: transparent;
}

#it_cate{
	width: 200px;
	height : 30px;
	

}


/* 버튼 구역 - 등록하기 , 돌아가기 */
#button_section{
	width : 800px;
	float: center;
}

#uploadBtn{

	width : 200px;
	height: 50px;
	background-color: green;
	font-size : 20px;
	border: none;
	color : #FFF;
}

#back{
	width : 200px;
	height: 50px;
	background-color: gray;
	opacity : 0.8;
	font-size : 20px;
	border: none;
	color : #FFF;

}


</style>

</head>
<body>

<!-- 	<h1> /item/item_Write.jsp</h1>
	<h1> 물건 판매글 등록 </h1> -->
	
	<div id="container"><!-- 1 -->
		<h1>상품등록</h1><hr>
		<div id="item_write_section"> <!-- 2 -->
			<form action=""  method="post" id="form">

				<input type="text" value="상품 이미지" class="it_text" calss="left">
				<div id="img_section">
					<img src="/resources/itemIMG/it_reg_img.png" id="it_reg_img"> <br>
					<input type="file" name="uploadFile" multiple required="required" id="it_files"> <br>
				</div>
				<hr>

				<input type="text" value="제목 " class="it_text">
				<input type="text" value="" name="it_title" required="required" id="it_title" placeholder="상품 제목을 입력해주세요."> <br>
				<hr>
				
				<input type="text" value="가격" class="it_text">
				<input type="number" value="" name="it_price" required="required" id="it_price" placeholder="숫자만 입력해주세요.">
				<input type="text" value="원" class="it_text">
				<hr>

				<input type="text" value="내용" class="it_text">
				<textarea rows="5" cols="10" name="it_content" required="required" id="it_content"></textarea> <br>
				<hr>
				
				<input type="text" value="상태" class="it_text">
				<input type="radio" value="중고상품" name="it_con" checked >   
				<input type="text" value="중고상품" class="it_con_text_old">
				<input type="radio" value="새상품" name="it_con" > 
				<input type="text" value="새상품" class="it_con_text_new"> <br>
				<hr>

				<input type="text" value="카테고리" class="it_text">
				<select name="it_cate" required="required" id="it_cate">
					<option value="">카테고리</option>
					<option value="패션의류">패션의류</option>
					<option value="유아용품">유아용품</option> 
					<option value="가구생활">가구/생활</option> 
					<option value="취미">취미</option> 
					<option value="전자기기">전자기기</option> 
					<option value="스포츠레저">스포츠/레저</option>
					<option value="도서">도서</option> 
				</select> <br>
				<hr>
				<div id="button_section">
					<input type="button" value="등록하기" id="uploadBtn"> 
					<input type="button" value="돌아가기" id="back" onclick="back();"> 
				</div>			
			</form>
		</div> <!-- 2 -->
	</div> <!-- 1 -->
	
<script type="text/javascript">


$(document).ready(function(){
	
	
	
	
	// 첨부파일 공격에 대비하기 위한 업로드 파일 확장자 제한
	// 특정 크기 이상의 파일 업로드 제한
	
	// 함수선언 : 정규식을 이용하여 확장자 제한
	var reg = new RegExp("(.*?)\.(exe|zip|alz|js)$")
	
	// 최대 업로드 크기를 설정하여 그 이상이면 제한
	var maxSize = 5242880; // 5MB
	
	// 파일이름, 파일크기
	function checkExtension(fileName, fileSize){
		
		// 파일 크기 제한
		// 실페 파일 크기 > 최대 업로드 가능 크기
		
		if(fileSize > maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(reg.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		
		return true;
		
	}//checkExtension
	
	

	
	$("#uploadBtn").on("click", function(){
		// 파일 업로드 관련 로직 처리
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		//console.log(inputFile);
		
		var files = inputFile[0].files;
		console.log(files); 
		
		// add File Data to formData
		 for(var i =0; i < files.length; i++){
			 console.log(files.length);
			 // checkExtension 함수 호출
		 	 if(!checkExtension(files[i].name, files[i].size)){
		 		 console.log("@해당파일불가@");
				 return false;
			 } 
			 
			 // jsp의 파일선택을 통해 선택한 파일들을 form 태그에 추가
			formData.append("uploadFile", files[i]);
			 console.log("@실행됨@");
			 
		} 
		
		console.log(formData);
		 // 첨부한 파일을 서버에 올려줌( UploadController에 파일 관련 데이터 전송 )
		 $.ajax({
			type : "POST",
			url : "/item/uploadAjaxAction",
			data : formData,
			processData : false,
			contentType : false,
			// dataType : "json",
			success : function(result){
				//console.log("@@@1");
				//console.log(result);
				alert('성공');				
				var str="";
				var input="";
				// 향상된 for문  _ 배열타입일때 사용 인덱스 i부터 obj 배열을 순차진행함
				
				$(result).each(function(i, obj){
					console.log("@@@2");
					console.log(obj);
					// filePath : 썸네일 파일 경로 + 파일명
					// console.log(obj.fileName);
					
					input += "<input type='hidden' name='fileList["+i+"].fileName' value='"+obj.fileName+"'>";
					input += "<input type='hidden' name='fileList["+i+"].uuid' value='"+obj.uuid+"'>";
					input += "<input type='hidden' name='fileList["+i+"].uploadPath' value='"+obj.uploadPath+"'>";
					input += "<input type='hidden' name='fileList["+i+"].image' value='"+obj.image+"'>";
					
					
				}); // $(result).each(function(i,obj)) 닫음  

				
				$("#form").append(input).submit();
				//console.log("완료3");
				
			},
			error : function(result){
				alert('실패');
			}
			
			
		}); // $.ajax 닫음 
		
		
		
 
	});
});




	// 뒤로가기 
	function back(){
		history.back(); 
	}

</script>	
	
	
<%@ include file="../include/userFooter.jsp" %>

</body>
</html>