<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>


<!-- 在写文章的时候添加标签 -->
<div id="newtyoemodal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加标签</h4>
      </div>
      <div class="modal-body">
     	   <input id="addnewType" type="text" class="form-control" placeholder="请输入新的标签名">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="addNewType()">确认添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 新写一篇文章 -->
<div style="height:600px;width:100%;">
	<form action="${APP_PATH}/saveDiary.action" method="post" enctype="multipart/form-data">
		<div style="margin:5px auto;width:350px;">
			<input type="text" class="form-control" id="title" name="title" placeholder="请输入文章标题" style="text-align:center">
		</div>
		<div id="editor" >
	        
	    </div>
	    <input type="hidden" id="content" name="content">
	    <input type="hidden" id="content_base" name="content_base">
	    <div class="row" style="padding-top:5px">
			  <div class="col-md-12">
		  		<div class="row">
		  			<div class="col-md-3" style="padding-right:0;">
		  				<div style="width:200px">
					    	<select class="form-control" name="typeid" id="typeid">
							  <option value="0">请选择标签分类</option>
							  <c:forEach var="type" items="${typeList }">
							  		<option value="${type.tid }">${type.tname }</option>
							  </c:forEach>
							</select>
						</div>
		  			</div>
			  		<div class="col-md-3" style="padding-left:20px;">
			  			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#newtyoemodal"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span> 添加标签</button> 
			  		</div>
			  		<div class="col-md-6">
			  			<label>上传配图： </label><input name="image" type="file" style="display:inline-block">
			  		</div>
		  		</div>
			  </div>
		</div>
		<div class="row">
			 <div class="col-md-4 col-md-offset-9">
			    	<button class="btn btn-danger"  onclick="javascript:history.back()"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 取消</button>  
			    	<button class="btn btn-primary" onclick="return saveDiary()"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 发表</button>
			  </div>
		</div>
	</form>
</div>

    <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
    <script type="text/javascript" src="${APP_PATH }/wangEditor/wangEditor.min.js"></script>
    <script type="text/javascript">
   	    var editor;
    	$(function (){
	        var E = window.wangEditor;
	        editor = new E('#editor');
	        editor.customConfig.zIndex = 100;
	        editor.customConfig.uploadImgShowBase64 = true;
	        editor.create();
	    });
	    
	    function addNewType(){
			var newType = $("#addnewType").val();
			if(newType == null || newType == ''){
				alert("请添加新加标签名！")
				return false;
			}
			$.ajax({
				url:"${APP_PATH }/addNewType.action",
				data:"tname="+newType,
				type:"POST",
				success:function(result){
					if(result == "1"){
						alert("标签创建成功!")
						window.location.reload();
					}else if(result == "2"){
						alert("标签已经存在！")
					}
				}
			});
		}
	    
	    function saveDiary(){
	    	var title = $("#title").val();
	    	var content = editor.txt.html();
	    	var typeid = $("#typeid").val();
	    	if(title == null || title == ""){
	    		alert("文章标题不能为空！");
	    		return false;
	    	}
	    	if(content == null || content == ""){
	    		alert("文章内容不能为空！");
	    		return false;
	    	}
	    	if(typeid == "0"){
	    		alert("请选择文章标签！");
	    		return false;
	    	}
	    	
	    	$("#content").val(content);
	    	$("#content_base").val(content.substr(0,100));
	    	
	    	return true;
	    	/* $.ajax({
	    		url:"${APP_PATH}/saveDiary.action",
	    		type:"POST",
	    		data:"title="+title+"&content_base="+content.substr(0,100)+"&content="+content+"&typeid="+typeid+"&image="+null,
	    		success:function(result){
	    			if(result == "1"){
	    				alert("文章发表成功！");
	    				window.location.href="${APP_PATH}/toDiaryList.action";
	    			}
	    		}
	    	}); */
	    }
    </script>
