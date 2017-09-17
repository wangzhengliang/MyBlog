<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="edit" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">修改标签</h4>
      </div>
	      <div class="modal-body">
	      	   <input id="editId" type="hidden" value="">
	     	   <input id="editType" type="text" class="form-control" value="">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" onclick="return editType()">确认修改</button>
	      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="mymodal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加标签</h4>
      </div>
      <div class="modal-body">
     	   <input id="newType" type="text" class="form-control" placeholder="请输入新的标签名">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="addType()">确认添加</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div style="padding-top:5px">
	<button type="button" class="btn btn-info col-md-offset-8" data-toggle="modal" data-target="#mymodal">添加标签</button>
</div>
<hr />
<table class="table table-hover" style="font-size:18px;">
  <thead>
  	<tr style="font-weight:bold">
  		<td>#</td>
  		<td>标签名</td>
  		<td>操作</td>
  	</tr>
  </thead>
  <tbody>
  	<c:forEach items="${typeList }" var="type">
	  	<tr>
	  		<td>${type.tid }</td>
	  		<td>${type.tname }</td>
	  		<td>
	  			<button class="btn btn-info btn-sm" onclick="toEditType(${type.tid})">修改</button>
	  			<button class="btn btn-danger btn-sm" onclick="delType(${type.tid})">删除</button>
	  		</td>
	  	</tr>
  	</c:forEach>
  </tbody>
</table>

	
