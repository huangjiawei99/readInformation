<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
		pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/publish.css">
<script type="text/javascript">
	$(function(){
		//收藏
			$('.ClickOne').on("click",function(){
			var isCollection = $(this).attr("isCollection");
			var articleId = $(this).attr("articleId");
			var sctd = this;
			var scNum = $(this).prev();
			console.log(sctd);
			console.log(isCollection+"--"+articleId);
			
			$.get("user/collectionArticle",{"articleId":articleId,"collectionState":isCollection},
				function(data){
					console.log(data);
					if(data == '1'){
						console.log("收藏成功");
						$(sctd).attr("style","color:red")
						scNum.text(Number(scNum.text())+1);
						$(sctd).attr("isCollection","1");
					}else{
						console.log("取消收藏成功");
						$(sctd).removeAttr("style")
						scNum.text(Number(scNum.text())-1);
						$(sctd).attr("isCollection","2");
					}
					//改为js操作图片转换与数量+-
					//location.reload(true);
				},"text");
		});
	});
</script>
			<div class="search_bar">

              <span class="search_title">我的收藏</span>&nbsp;&nbsp;

          </div>
          <!-- 搜索end -->
          <div class="news_list">
                <table class="tbl">
            <thead>
              <tr>
                <th>资讯标题</th>
				<th>作者</th>
				<th>所属栏目</th>
				<th>发布时间</th>
				<th>背景音乐</th>
				<th>阅读量</th>
				<th>点赞量</th>
				<th>收藏量</th>
                <th width="160px">操作</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${collectionArticles }" var="article">
					<tr>
						<td><a style="color:gray" href="${APP_PATH }/user/showArticle?articleId=${article.id }" target="_blank">${article.title }</a></td>
						<td>${article.user.nickname }</td>
						<td>${article.category.name }</td>
						<td><fmt:formatDate value="${article.releaseDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>${article.backgroundMusicUrl == null?"无":fn:substring(article.backgroundMusicUrl,23,-1) }</td>
						<td>${article.clickTimes }</td>
						<td>${article.likeTimes }</td>
						<td>${article.collectionTimes }</td>
		                <td style="color:red" class="optior ClickOne" articleId=${article.id } isCollection="${article.isCollection }">
		                  <span class="glyphicon glyphicon-star" aria-hidden="true" data-toggle="modal" data-target=".bs-example-modal-del"></span>&nbsp;&nbsp;
		                 </td>
					</tr>
				</c:forEach>

            </tbody>
          </table>
         </div>
         