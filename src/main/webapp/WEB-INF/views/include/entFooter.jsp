<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
    </div><!-- ./wrapper -->
	

	<script type="text/javascript">
	$(function() {
		var own_id = '${own_id}';
		/* 마우스이벤트  */
		$('.small-box-footer').hover(function() {
			$(this).css('color', 'cadetblue');
			$(this).css("cursor", "pointer");
		}, function() {
			$(this).css('color', 'white');
		});
		$('a').hover(function() {
			$(this).css("cursor", "pointer");
		});
		$('.info > a').hover(function() {
			$(this).css("color", "#2BBD26");
		}, function() {
			$(this).css('color', 'black');
		});

		/* 로그인해야 작동하게 */
		$('.small-box-footer').off("click").click(function() {
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				location.href = "/ent/entLogin";
				alert('로그인 이후 사용해주세요');
				return false;
			}
		});
		$('#coin').off("click").click(function() { 
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				alert('로그인이후 이용해주세요');
				location.href = "/ent/entLogin";
				return false;
			}
		});
		$('#talk').off("click").click(function() {
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				alert('로그인이후 이용해주세요');
				location.href = "/ent/entLogin";
				return false;
			}
			
		});
		$('.shop').off("click").click(function() {
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				alert('로그인이후 이용해주세요');
				location.href = "/ent/entLogin";
				return false;
			}
		});
		$('button[type=submit]').off("click").click(function() {
			if (own_id == null || typeof own_id == "undefined" || own_id == "") {
				alert('로그인 이후 사용해주세요');
				location.href = "/ent/entLogin";
				return false;
			}
		});
		// 사이드바 최소화 버튼 클릭시
		$('#mini').on("click", function() {
			console.log("click");
			$('.sidebar-menu>li').css("margin",0);
		});
		
	});
	</script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="${pageContext.request.contextPath }/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='${pageContext.request.contextPath }/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="${pageContext.request.contextPath }/resources/dist/js/demo.js" type="text/javascript"></script>
    
    
  </body>
</html>