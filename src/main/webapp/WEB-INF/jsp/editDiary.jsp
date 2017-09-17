<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.text.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>

<div style="height:600px;width:100%;">
	<div style="margin:5px auto;width:350px;">
		<input type="text" class="form-control" id="title" name="title" placeholder="${diary.title }" value="${diary.title } " style="text-align:center">
	</div>
	<div id="editor">
       		<p> ${diary.content } </p>
    </div>
    <div class="row" style="padding-top:5px">
	  <div class="col-md-8">
		<div style="width:200px;margin-left:5px">
    		<select class="form-control" name="typeid" id="typeid">
				  <option>请选择标签分类</option>
				  <c:forEach var="type" items="${typeList }">
				  	<option value="${type.tid }" ${type.tid == diary.typeid?'selected':'' }>${type.tname }</option>
				  </c:forEach>
			</select>
		</div>
	  </div>
	  <input type="hidden" name="did" id="did" value="${diary.did }">
	  <div class="col-md-4" style="padding-left:40px">
	    	<button class="btn btn-danger"  onclick="deleteDiary()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 删除</button>  
	    	<button class="btn btn-primary" onclick="updateDiary()"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 确认修改</button>
	  </div>
	</div>
</div>

    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="${APP_PATH }/wangEditor/wangEditor.min.js"></script>
    <script type="text/javascript">
   	    var editor
	    $(function (){
	        var E = window.wangEditor;
	        editor = new E('#editor');
	        editor.customConfig.zIndex = 100;
	        editor.customConfig.uploadImgShowBase64 = true;
	        editor.create();
	    });
	    
	    function updateDiary(){
	    	var title = $("#title").val();
	    	var content = editor.txt.html();
	    	var typeid = $("#typeid").val();
	    	var diaryid = $("#did").val();
	    	if(title == null || title == ""){
	    		alert("文章标题不能为空！");
	    		return;
	    	}
	    	if(content == null || content == ""){
	    		alert("文章内容不能为空！");
	    		return;
	    	}
	    	if(typeid == "0"){
	    		alert("请选择文章标签！");
	    		return;
	    	}
	    	$.ajax({
	    		url:"${APP_PATH}/updateDiary.action",
	    		type:"POST",
	    		data:"did="+diaryid+"&title="+title+"&content_base="+content.substr(0,100)+"&content="+content+"&typeid="+typeid+"&image="+null,
	    		success:function(result){
	    			if(result == "1"){
	    				alert("文章修改成功！");
	    				window.location.href="${APP_PATH}/toDiaryList.action";
	    			}
	    		}
	    	});
	    }
	    
	    function deleteDiary(){
	    	if(confirm("确认删除"+$("#title").val()+"吗？")){
	    		$.ajax({
	    			url:"${APP_PATH}/deleteDiary.action",
	    			data:"id="+$("#did").val(),
	    			success: function(result){
	    				if(result == "1"){
		    				alert("删除成功！");
		    				window.location.href="${APP_PATH}/toDiaryList.action";
	    				}
	    			}
	    		});
	    	}
	    }
    </script>
