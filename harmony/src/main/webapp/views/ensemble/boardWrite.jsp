<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ensemble/boardWrite.css" type="text/css">
<%@ page import= "java.util.List, 
					com.harmony.ensemble.model.dto.Inst" %>
<%
	List<Inst> inst = (List<Inst>)request.getAttribute("inst");
%>

<%@ include file="/views/common/header.jsp" %>  

<section>
<form id="myForm">
		<div>
			글 제목
			<input type="text" name="title" id="title">
		</div>
		
		
		<div class="part_container">
			모집파트<br>
			<table class="part_table">
			<tr>
				<td>
			   		<input class="inst_chk" type="checkbox" name="inst" value="vocal" style="display:none">
					<span class="inst_chk_span">보컬</span>
		   		</td>
		   		<td>
			   		<input class="inst_chk" type="checkbox" name="inst" value="piano" style="display:none">
					<span class="inst_chk_span">건반</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="drum" style="display:none">
					<span class="inst_chk_span">드럼</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="guitar" style="display:none">
					<span class="inst_chk_span">기타</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="bass" style="display:none">
					<span class="inst_chk_span">베이스</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="violin" style="display:none">
					<span class="inst_chk_span">바이올린</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="percussion" style="display:none">
					<span class="inst_chk_span">퍼커션</span>
		    	</td>
		    </tr>	
		    <tr>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="saxophone" style="display:none">
					<span class="inst_chk_span">색소폰</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="flute" style="display:none">
					<span class="inst_chk_span">플룻</span>
		    	</td>
		    	<td>	
			    	<input class="inst_chk" type="checkbox" name="inst" value="electronic" style="display:none">
					<span class="inst_chk_span">일렉트로닉</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="contra" style="display:none">
					<span class="inst_chk_span">더블베이스</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="cello" style="display:none">
					<span class="inst_chk_span">첼로</span>
		    	</td>
		    	<td>
			    	<input class="inst_chk" type="checkbox" name="inst" value="trumpet" style="display:none">
					<span class="inst_chk_span">트럼펫</span>
		        </td>
		        <td>
		        <input class="inst_chk" type="checkbox" name="inst" value="etc" style="display:none">
				<span class="inst_chk_span">etc</span>
				</td>
			</tr>
		</table>
	
		</div>
		
		
		
		
		<div>
			지역
			<input type="select" name="location" id="location">
		</div>
		<div>
			장소	      
			<input type="text" id="sample6_postcode" placeholder="우편번호">
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
			<input type="text" id="sample6_address" placeholder="주소"><br>
<!-- 			<input type="text" id="sample6_detailAddress" placeholder="상세주소"><br> -->
			<input type="text" id="sample6_extraAddress" placeholder="참고항목">
	
			<input type="hidden" name="place" id="place">
			
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			
			<script>
			    function sample6_execDaumPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("sample6_extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("sample6_extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('sample6_postcode').value = data.zonecode;
			                document.getElementById("sample6_address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
// 			                document.getElementById("sample6_detailAddress").focus();
			                
			                //합쳐서 hidden 인풋에 넣기!
			                document.getElementById("place").value= addr+ " "+extraAddr;
			                
			            }
			        }).open();
			    }
			</script>
		</div>
		<div>
			상세설명
			  <textarea rows="5" cols="50" name="detail" id="detail"></textarea>
		</div>
	
		<div>
			<button id="board_end">글 등록</button>	
<!-- 				<input type="button" onclick="submit_form()">등록</button> -->
		</div>
</form>
</section>
<script>
	function submit_form(){
		let parts = $('input[name="inst"]:checked').map(function(){
			return $(this).val();
		}).get();
		
		let location = $('#location').val();
		let title= $('#title').val();
		let place = $('#place').val();
		let detail = $('#detail').val();
		
		let formData = new FormData();
		formData.append("parts", JSON.stringify(parts));
		formData.append("location", location);
		formData.append("title",title);
		formData.append("detail",detail);
		
		$.ajax({
			type: "POST",
			url: "<%=request.getContextPath()%>/ensemble/boardWriteEnd.do",
			data: formData,
			processData: false,
			contentType: false,
			success: function(data){
				console.log(data);
			},
			error: function(error){
				console.log(error);
			}
		});
	}
</script>

<script>
//// $("#submit").click(e=>{

	
// 	const form = new FormData();
	
// 	const parts = $('.inst_chk:checked').map(function(){
// 		return $(this).next().text();
// 	}).get();
// 	const location = $('#location').val();
// 	const place =  $('#place').val();
// 	const detail = $('#detail').val();
// 	const title = $('#title').val();
	
	
// 	form.append("parts", parts);
// 	form.append("location", location);
// 	form.append("place", place);
// 	form.append("detail", detail);
// 	form.append("title",title);
	
	
// 	$.ajax({
<%-- 		url: "<%=request.getContextPath()%>/ensemble/boardWriteEnd.do", --%>
// 		data:form,
// 		type:"post",
// 		processData:false,
// 		contentType:false,
// 		success:data=>{
// 			alert("등록 성공");
// 		},
// 		error:(r,e)=>{
// 			alert("등록 실패");
// 		},
// 		complete:()=>{
// 		}
// 	});
	
// });	
	

</script>


<script>
	
	$("#board_end").click(e=>{
		const want_part = $('.inst_chk:checked').map(function(){
			return $(this).next().text();
		}).get();
		
		const location = $('#location').val();
		const place =  $('#place').val();
		const detail = $('#detail').val();
		const title = $('#title').val();

		const ensBoard = {
			ensLocation: location,
			ensPlace: place,
			ensDetail: detail,
			ensBoardTitle: title
		};
		
		const ensembleBoardWantPart = {
			ensInstNo : want_part
		};
		
		
		
		$.post("<%=request.getContextPath()%>/ensemble/boardWriteEnd.do",
					{
						data: JSON.stringify(ensBoard), 
						part: JSON.stringify(ensembleBoardWantPart)		
					},
					data=>{
						console.log(data);
					}
				);
	});
</script>
<script>
$('.inst_chk_span').click((e)=>{
	const $target = $(e.target);
	$target.prev().click();		
});
$('.inst_chk').click((e)=>{
	const $target = $(e.target);
	console.log($target.next());
	$target.next().toggleClass('selected');
});


</script>

<%@ include file="/views/common/footer.jsp" %>