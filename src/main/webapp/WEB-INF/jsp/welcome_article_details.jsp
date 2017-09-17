<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%pageContext.setAttribute("APP_PATH",request.getContextPath()); %>
<style>
	table {
	  border-top: 1px solid #ccc;
	  border-left: 1px solid #ccc;
	}
	table td,
	table th {
	  border-bottom: 1px solid #ccc;
	  border-right: 1px solid #ccc;
	  padding: 3px 5px;
	}
	table th {
	  border-bottom: 2px solid #ccc;
	  text-align: center;
	}
	
	/* blockquote 样式 */
	blockquote {
	  display: block;
	  border-left: 8px solid #d0e5f2;
	  padding: 5px 10px;
	  margin: 10px 0;
	  line-height: 1.4;
	  font-size: 100%;
	  background-color: #f1f1f1;
	}
	
	/* code 样式 */
	code {
	  display: inline-block;
	  *display: inline;
	  *zoom: 1;
	  background-color: #f1f1f1;
	  border-radius: 3px;
	  padding: 3px 5px;
	  margin: 0 3px;
	}
	pre code {
	  display: block;
	}
	
	/* ul ol 样式 */
	ul, ol {
	  margin: 10px 0 10px 20px;
	}
</style>
<!-- 文章详情 -->
<article>
	<div class="heading">
		<h2>${diary.title }</h2>
	</div>
	<div class="content">
		<c:if test="${diary.image != null && diary.image != ''}">
			<img src="/pic/Blog/images/${diary.image}" width="100%"/>
		</c:if>
		<p>${diary.content }</p>
	</div>
	<div class="info">
		<p>By 汪正良  <fmt:formatDate value="${diary.relasedata }" type="date" pattern="yyyy-MM-dd HH:mm"/></p>
	</div>
</article>

<section>
	<h3>留个言吧<span style="color:red">（评论系统暂未开启）</span></h3>
	
	<form id="contact-form" method="post">
	    <fieldset>
	        <label><input name="email" value="Email" onBlur="if(this.value=='') this.value='Email'" onFocus="if(this.value =='Email' ) this.value=''" /></label>
	        <label><input name="subject" value="Subject" onBlur="if(this.value=='') this.value='Subject'" onFocus="if(this.value =='Subject' ) this.value=''" /></label>
	        <textarea onBlur="if(this.value=='') this.value='Message'" onFocus="if(this.value =='Message' ) this.value=''">Message</textarea>
	        <div class="buttons">
	            <a href="#" onClick="document.getElementById('contact-form').reset()">Clear</a>
	            <a href="#" onClick="document.getElementById('contact-form').submit()">Send</a>
	        </div>											
	    </fieldset>           
	</form>
</section>




