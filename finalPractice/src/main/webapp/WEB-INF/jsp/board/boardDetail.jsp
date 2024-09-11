<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<title>게시물 등록</title>
<style>
	table{
		margin:auto;
	}
	tr {
		height:30px;
	}

	.text {
	 width:100%;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		fn_getReply("${boardInfo.boardIdx}");
		
		$("#btn_update").on('click', function(){
			$("#flag").val("U");
			var frm = $("#saveFrm");
			frm.attr("method", "POST");
			frm.attr("action", "/board/registBoard.do");
			frm.submit();
		});
		
		$("#btn_list").on('click', function(){
			location.href="/board/boardList.do";
		});
		
		$("#btn_delete").on('click', function(){
			fn_delete();
		});
		
		$("#btn_reply_save").on('click', function(){
			fn_comment();
		});
	});
	
	function fn_delete(){
	
	}
	
	function fn_getReply(boardIdx){
		$.ajax({
		    url: '/board/getBoardReply.do',
		    method: 'post',
		    data : { "boardIdx" : boardIdx},
		    dataType : 'json',
		    success: function (data, status, xhr) {
		    	var replyHtml = '';
		    	if(data.replyList.length > 0){
		    		for(var i=0; i<data.replyList.length; i++){
		    			replyHtml += '<div id="reply_'+data.replyList[i].replyIdx+'" style="width:90%;">';
			    		replyHtml += '<span>';
			    		if(data.replyList[i].replyLevel > 0){
			    			for(var j=0; j<data.replyList[i].replyLevel; j++){
				    			replyHtml += '=';
				    		}
			    			replyHtml+='=>';
			    		}
			    		replyHtml += data.replyList[i].createId;
			    		replyHtml += '</span></br>';
			    		replyHtml += '<span>';
			    		replyHtml += data.replyList[i].replyContent;
			    		replyHtml += '</span></br>';
			    		replyHtml += '<span>';
			    		replyHtml += data.replyList[i].createDate;
			    		replyHtml += '<a href="javascript:fn_replyInsert(\''+data.replyList[i].replyIdx+'\');" style="float:right;">';
			    		replyHtml += '답글달기';
			    		replyHtml += '</a><br>';
			    		replyHtml += '<a href="javascript:fn_replyDelete(\''+data.replyList[i].replyIdx+'\');" style="float:right;">';
			    		replyHtml += '삭제';
			    		replyHtml += '</a>';
			    		replyHtml += '</span></br>';
			    		replyHtml += '</div>';	
		    		}
		    	}else{
		    		
		    		replyHtml += '댓글이 존재하지 않습니다.';
		    	}
		    	$("#replyDiv").html(replyHtml);
		    },
		    error: function (data, status, err) {
		    	console.log(err);
		    }
		});
	}
	
	function fn_replyInsert(replyIdx){
		
	}
	
	function fn_replyInsertSave(replyIdx){
		
	}
	
	function fn_comment(){
		
	}
	
	function fn_replyDelete(replyIdx){
		
	}
	

</script>
</head>
<body>
	<div>
		<form id="fileFrm" name="fileFrm" method="POST">
			<input type="hidden" id="fileName" name="fileName" value=""/>
			<input type="hidden" id="filePath" name="filePath" value=""/>
		</form>
		<form id="saveFrm" name="saveFrm">
			<input type="hidden" id="flag" name="flag" value="${flag}"/>
			<input type="hidden" id="boardIdx" name="boardIdx" value="${boardIdx }"/>
			<table style="height:auto; width:100%;" >
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" class="text" id="boardTitle" name="boardTitle" value="${boardInfo.boardTitle }" readonly/>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea rows="20" cols="100" id="boardContent" name="boardContent" style="width:100%;" readonly>${boardInfo.boardContent}</textarea>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" class="text" id="createId" name="createId" value="${boardInfo.createId }" readonly />
						</td>
						<th>작성일</th>
						<td>
							<input type="text" class="text" id="createDate" name="createDate" value="${boardInfo.createDate }" readonly />
						</td>
					</tr>
					<tr>
						<th>수정자</th>
						<td>
							<input type="text"  class="text" id="updateId" name="updateId" value="${boardInfo.updateId }" readonly />
						</td>
						<th>수정일</th>
						<td>
							<input type="text" class="text" id="updateDate" name="updateDate" value="${boardInfo.updateDate }" readonly />
						</td>
					</tr>
				</tbody>
				
			</table>
		</form>
	</div>
	<div style="float:right; width:100%;">
		<input type="button" id="btn_list" name="btn_list" value="목록" style="float:right;"/>
		<c:if test="${loginInfo.id == boardInfo.createId }"> <!-- 수정 버튼 보이고 안보이고 처리방법 - 1 -->
			<input type="button" id="btn_delete" name="btn_delete" value="삭제" style="float:right;"/>
			<input type="button" id="btn_update" name="btn_update" value="수정" style="float:right;"/>
		</c:if>
	</div>
	<div style="width:100%; margin:0px 0px 0px 9%;">
		<h4>댓글</h4>hj
		<input type="text" id="replyContent" name="replyContent" style="width:87%; margin:0 0px 10px 0px;" placeholder="댓글을 입력해주세요."/>
		<input type="button" id="btn_reply_save" name="btn_reply_save" value="등록"/>
	</div>
	<div style="width:100%; margin:0px 0px 0px 9%;" id="replyDiv" name="replyDiv">
	</div>
</body>
</html>