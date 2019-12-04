<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
.articleList {
    display: inline-block;
    width: 690px;
    height: 100%;
    overflow: hidden;
    padding: 20px 0;
    border-bottom: 1px solid #e8e8e8;
    color: #777;
}
.articleList .thumb {
    position: relative;
    display: inline-block;
    float: left;
    max-width: 180px;
    min-width: 180px;
    min-height: 120px;
    margin-right: 24px;
    background-color: #e5e5e5;
}
.articleList .rightList {
    overflow: hidden;
}
.articleList .rightList .tit {
    display: block;
    max-height: 48px;
    font-size: 18px;
    line-height: 24px;
    color: #191919;
    font-weight: bold;
    letter-spacing: -1px;
    overflow: hidden;
}

.articleList .rightList .txt {
    display: block;
    margin: 17px 0 10px;
    font-family: "돋움",dotum;
    font-size: 12px;
    color: #919191;
    text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
}
a{
	target:"_blank";
}

</style>

<c:forEach items="${Newslist }" var="news">
<div class = "articleList">
${news.atag }
</div>

</c:forEach>


